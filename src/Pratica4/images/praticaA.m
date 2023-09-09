clear all
close all
pkg load image;
imbg = imread('background_4.jpg');
immask = imread('mask_3.tif');
imob = imread('ob.jpg');
quadro = zeros(512,512, "uint8");

imbg = imbg .* immask;

imbg = 255 - imbg;

imbg2 = 255 - imread('b2.jpg');

imbg = imbg - imbg2;

imb3 = imread('bg.jpg');

imbg = imbg - imb3;

quadro = imbg;

imbg4= imread('object_4.jpg');

copy = imbg4;



c = 512;

for i = 1: size(quadro, 1)
  for j = 1: size(quadro, 2)
    if(imbg4(i,j) + quadro(i,j) < 220)
      quadro(i,j) = (imbg4(i,j)*0.8) + quadro(i,j);
    endif
  endfor
endfor

figure(1);
imshow(quadro);
