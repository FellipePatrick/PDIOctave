clear all;
close all;
pkg load image;
im = imread('lake.png');
imContraste = im;
atual = 90;
aux = 2.55;
for x = 1: 100
  for i = 1: size(im,1)
    for j = 1: size(im,2)
      if(im(i,j) == atual)
        imContraste(i,j) = aux;
      endif
    endfor
  endfor
  aux = aux + 5.1;
  atual = atual + 1;
endfor
figure;
imshow(imContraste);

