clear all
close all
im = imread('C:\Users\Fellipe Patrick\Pictures\ex\lena.png');
#Atribuição direta na matriz
imTc = im;
imTc(:,:,:) = imTc(:,:,:) + (0.8 * imTc(:,:,:));
imTe = im;
imTe(:,:,:) = imTc(:,:,:) - (0.8 * imTc(:,:,:));
#Atribuição indireta
imClara = im;
imEscura = im;
for i = 1: size(im)
  for j = 1: size(im)
    imClara(i,j) = im(i,j) + (0.8 * im(i,j));
    imEscura(i,j) = im(i,j) - (0.8 * im(i,j));
  endfor
endfor
figure(1);
imshow(imTe);

