close all; clear; clc;

%% reading the original image and showing its histogram
imageOriginal = imread('car.jpeg'); % reading the image
imshow(imageOriginal);title('Orijinal Resim');
figure
imhist(imageOriginal);title('Orijinal Histogram');


%% Histogram Germe 
[h,w] = size(imageOriginal); % height and width
imageOut = zeros(0,0,'uint8'); % creating zero image

yeni_min = 0; yeni_max = 255;
eski_min = 0; eski_max = 0; % intializing

% computes a global threshold from grayscale image
esik_degeri = graythresh(imageOriginal)*255;  % 0.4941*255 = 126


for i = 1 : h  
    for j = 1 : w      
        if (imageOriginal(i,j) <= esik_degeri && imageOriginal(i,j) ~= 0 )
            eski_min = imageOriginal(i,j);
        end
        if (imageOriginal(i,j) > esik_degeri && imageOriginal(i,j) ~= 255 )
            eski_max = imageOriginal(i,j);
        end
    end
end


for i = 1:h       
    for j = 1:w      
       imageOut(i,j) = ((yeni_max - yeni_min)/(eski_max - eski_min)) * (imageOriginal(i,j) - eski_min) + yeni_min;
    end
end

figure
imshow(imageOut);title('Germe Resimi'); 
figure
imhist(imageOut);title('Histogram Germe');

