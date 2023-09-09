clear all
close all
pkg load image;
im = imread('cores.jpg');
imC = im;
imC = (im(:,:,1) .* 0.2989) + (im(:,:,2) .* 0.5870) + (im(:,:,3) .* 0.1140);
subplot(1,2,1);
imshow(im);
title('Origial');
subplot(1,2,2);
imshow(imC);
title('Preto e Branco');
