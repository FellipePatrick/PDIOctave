clear all;
close all;
pkg load image;
im = imread('milho.png');
imC = im;
for i = 1: size(im,1)
  for j = 1: size(im,2)
    if(im(i,j,1) < 200)
      im(i,j,:) = 0;
    endif
  endfor
endfor
subplot(1,2,1);
imshow(imC);
title('Origial');
subplot(1,2,2);
imshow(im);
title('Imagem Recortada');
