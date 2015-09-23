function  height_map = get_surface(surface_normals, image_size)
% surface_normals: h x w x 3 array of unit surface normals
% image_size: [h, w] of output height map/image
% height_map: height map of object of dimensions [h, w]



    
%% <<< fill in your code below >>> 


% initializing height_map with zeros
height_map = zeros(image_size(1),image_size(2));
for i=1:image_size(1)
        if( i > 1 )
            % calculating q to calculate heightmap value for for first column of a row considering value at (1,1) as ZERO  
            q = surface_normals(i,1,2)/surface_normals(i,1,3);
            % updating height_map with last value + q 
            height_map(i,1) = height_map(i-1,1)+q;   
        end
        % starting loop to calculate height_map values for all the columns of the row
        for j=2:image_size(2)
            % calculating p to calculate heightmap value for for column of a row  
            p = surface_normals(i,j,1)/surface_normals(i,j,3);
            % updating height_map with last value + p 
            height_map(i,j) = height_map(i,j-1)+p;
        end
end


%% tried to do both ways and taken average but getting very poor image
% height_map1 = zeros(192,168);
% height_map2 = zeros(192,168);
% height_map = zeros(192,168);
% for i=2:image_size(1)
%         q = surface_normals(i,1,2)/surface_normals(i,1,3);
%         height_map1(i,1) = height_map1(i-1,1)+q;   
%         for j=2:image_size(2)
%             p = surface_normals(i,j,1)/surface_normals(i,j,3);
%             height_map1(i,j) = height_map1(i,j-1)+p;
%         end
% end
% 
% 
% for j=2:image_size(2)
%         p = surface_normals(1,j,1)/surface_normals(1,j,3);
%         height_map2(1,j) = height_map2(1,j-1)+p;   
%         for i=2:image_size(1)
%             q = surface_normals(i,j,2)/surface_normals(i,j,3);
%             height_map2(i,j) = height_map2(i-1,j)+q;
%         end
% end
% 
% height_map = zeros(192,168);
% for i=1:192
%     for j=1:168
%         height_map(i,j) = (height_map1(i,j) + height_map2(i,j))/2;
%     end
% end

% for i=1:192
%     for j=2:168
%         p = surface_normals(i,j,1)/surface_normals(i,j,3);
%         height_map(i,j) = height_map(i,j)+p;
%     end
% end
end

