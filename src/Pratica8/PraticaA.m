clear all
close all
im = imread('Imagem.png');
imS = uint8(rand(62,62,3));
x = 1;
y = 1;
for i = 1: 2:size(im,1)
  for j = 1: 2:size(im,2)
    imS(x,y,:) = im(i,j,:);
    y++;
  endfor
  x++;
  y=1;
endfor
imI = uint8(rand(62,62,3));
x = 1;
y = 1;
for i = 1: 2:size(im,1)
  for j = 1: 2:size(im,2)
    p = (im(i+1,j+1,:)/4+im(i+1,j,:)/4 + im(i,j,:)/4 + im(i+1,j+1,:)/4);
    imI(x,y,:) = p;
    y++;
  endfor
  x++;
  y=1;
endfor

figure(1);
imshow(im);

figure(2);
imshow(imS);

figure(3);
imshow(imI);
