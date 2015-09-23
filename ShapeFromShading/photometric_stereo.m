function [albedo_image, surface_normals] = photometric_stereo(imarray, light_dirs)
% imarray: h x w x Nimages array of Nimages no. of images
% light_dirs: Nimages x 3 array of light source directions
% albedo_image: h x w image
% surface_normals: h x w x 3 array of unit surface normals


%% <<< fill in your code below >>>
    % initializing albedo_image with zeros
    albedo_image = zeros(192,168);
    % initializing surface_normals with zeros
    surface_normals = zeros(192,168,3);
    for i=1:192
        for j=1:168
            intensity = reshape(imarray(i, j, :), 64, 1);
            % conversting intensity to a vector
            intensity = intensity(:);
            % getting the solution for equation I=Vg using linear equaltion solver 
            g = mldivide(light_dirs,intensity);
            % getting modulus of g which is called albedo
            gMod = norm(g);
            % setting the albedo value to construct albedo image
            albedo_image(i,j) = gMod;
            % checking if modulus is greater than ZERO hen set the serface normals value
            if(gMod > 0)
                % setting surface normal values by using the equation g/|g|
                surface_normals(i,j,:) = g/norm(g);
            end
        end
    end
end

