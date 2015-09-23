function [disp_vect] = getdispvect(firstImage, secondImage)
%% firstImage / secondImage can be B, G or R
%% disp_vect is of the for [x,y]

    % initializing minSSD with infinite
    minSSD = inf;
    % initializing disp_vect with [0,0]
    disp_vect = [0,0];
    for i=-15:15
        for j=-15:15
           % shifting firstImage by displacement vector [i,j]
           temp = circshift(firstImage,[i,j]);        
           % calculating SSD
           ssd = sum(sum((secondImage-temp).^2));
           % checking if SSD is less than minSSD. If so updating the minSSD
           if(ssd < minSSD)
               minSSD = ssd;
               % updating the disp_vect with disp_vect having minimum SSD
               disp_vect = [i,j];
           end
        end
    end
end