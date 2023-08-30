pkg load image;

clear all;
close all;
im = imread('moon.png');
#figure;
#imshow(im);
iml = logical(im);
#histograma
h = imhist(im);
#processo de binarização
for i = 1: size(im,1)
  for j = 1: size(im,2)
    if(im(i,j)<120)
      iml(i,j) = 1;
    else
      iml(i,j) = 0;
    endif;
  endfor
endfor
imInvertida = 255 - im(:,:);
imFinal = imInvertida;
for i = 1: size(im,1)
  for j = 1: size(im,2)
    if(im(i,j)<120)
      imFinal(i,j) = imInvertida(i,j)^1.3;
    endif;
  endfor
endfor
subplot(1, 5, 1);
imshow(im);
subplot(1, 5, 2);
imshow(iml);
subplot(1, 5, 3);
imshow(imInvertida);
subplot(1, 5, 4);
imshow(imFinal);


