clear all
close all
im = imread('Imagem.png');
imS = uint8(zeros(size(im,1)/2, size(im,2)/2, 3));
imM = imS;
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
x = 1;
y = 1;

for i = 1: 2:size(im,1)
  for j = 1: 2:size(im,2)
    viz = [im(i,j,:), im(i+1,j,:), im(i, j+1, :), im(i+1,j+1,:)];
    p = sum(viz)/4
    imM(x,y,:) = p;
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
imshow(imM);
