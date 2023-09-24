clear all
close all
pkg load image;
arvore = imread('land_21.png');
cont = 1;
while cont < 513
  arvore(:,cont,:) = 0;
  arvore(:,cont+1,:) = 0;
  arvore(cont,:,:) = 0;
  arvore(cont+1,:,:) = 0;
  cont = cont + 6;
endwhile
figure(1);
imshow(arvore);
