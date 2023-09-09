clear all;
close all;
pkg load image;
im = imread('neuron.jpg');
x = 160;
imS1 = (im(:,:,1)) - (im(:,:,2)) - (im(:,:,3));
imS2 = im(:,:,1);
for i = 1: size(im,1)
  for j = 1: size(im,2)
    if(imS2(i,j,1) < x )
     imS2(i,j,:) = 0;
   else
     imS2(i,j,:) = 255;
    endif
   if(im(i,j,3) > 160)
     imS2(i,j,:) = 0;
   endif
  endfor
endfor
subplot(1,3,1);
imshow(im);
title('Origial');
subplot(1,3,2);
imshow(imS1);
title('Saida 1');
subplot(1,3,3);
imshow(imS2);
title('Saida 2');
