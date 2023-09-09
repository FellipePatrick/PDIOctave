clear all
close all
pkg load image;

im = imread('C:\Users\Fellipe Patrick\Documents\repositorios git\PDIOctave\src\Pratica4\images\mask_3.tif');

imC = im;

imT = imread('C:\Users\Fellipe Patrick\Documents\repositorios git\PDIOctave\src\Pratica4\images\mask_2.tif');

for i = 1: 512
  for j = 1: 512
    if(im(i,j) == 1)
      im(i,j) = imT(i,j);
    endif
  endfor
endfor
subplot(1,3,1);
imshow(imC);
title('entrada 1');
subplot(1,3,2);
imshow(imT);
title('entrada 2');
subplot(1,3,3);
imshow(im);
title('saida');

