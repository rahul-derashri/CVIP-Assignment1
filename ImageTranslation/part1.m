% CSE 473/573 Programming Assignment 1, starter Matlab code
% Adapted from A. Efros
% (http://graphics.cs.cmu.edu/courses/15-463/2010_fall/hw/proj1/)
% and R. Fergus
% http://cs.nyu.edu/~fergus/teaching/vision/assign1.pdf

% name of the input file
%%imname = 'yourfile.jpg';
imname = ['part1_1.jpg';'part1_2.jpg';'part1_3.jpg';'part1_4.jpg';'part1_5.jpg';'part1_6.jpg'];
imageData = cellstr(imname);
% read in the image
%%fullim = imread(imname);

% convert to double matrix 
%%fullim = im2double(fullim);

% compute the height of each part (just 1/3 of total)
%%height = floor(size(fullim,1)/3);
% separate color channels
%%B = fullim(1:height,:);
%%G = fullim(height+1:height*2,:);
%%R = fullim(height*2+1:height*3,:);


for k = 1:6
    fullim = imread(imageData{k});
    fullim = im2double(fullim);
    height = floor(size(fullim,1)/3);
    B = fullim(1:height,:);
    % clipping the image B
    B = B(26:end-25,26:end-25);
    G = fullim(height+1:height*2,:);
    % clipping the image G
    G = G(26:end-25,26:end-25);
    R = fullim(height*2+1:height*3,:);
    % clipping the image R
    R = R(26:end-25,26:end-25);
    % calling getdispvect to get the displacement vector for G
    DispVec_G  = getdispvect( G ,B );
    DispVec_G
    G1 = circshift(G,DispVec_G);
    % calling getdispvect to get the displacement vector for R
    DispVec_R  = getdispvect( R ,B );
    DispVec_R
    R1 = circshift(R,DispVec_R);
    % generating tejn final image using R1, G1 and B
    rgbImage = cat(3,R1,G1,B);
    % writing the final images
    imwrite(rgbImage,['result-' imageData{k}]);
end




% Align the images
% Functions that might be useful to you for aligning the images include: 
% "circshift", "sum"

%%%%%aG = align(G,B);

%%%%%aR = align(R,B);


% open figure
%% figure(1);

% create a color image (3D array)
% ... use the "cat" command

% show the resulting image
% ... use the "imshow" command

% save result image
%% imwrite(colorim,['result-' imname]);
