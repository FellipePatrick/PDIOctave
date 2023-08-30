clear all;
close all;
pkg load image;

im = imread('dance.png');
imd = imread('dance_depth.png');
imH = imd;
imM = logical(imd);
for i = 1: size(im,1)
  for j = 1: size(im,2)
    if(imd(i,j) < 165)
      imH(i,j) = 0;
    else
      imH(i,j) = 255;
    endif
  endfor
endfor
imH = logical(imH);
for i = 1: size(im,1)
  for j = 1: size(im,2)
    if(imd(i,j) < 90)
      imM(i,j) = 0;
    else
      imM(i,j) = 1;
    endif
  endfor
endfor

im = im(:,:,:) .* imM(:,:);


figure;
imshow(im);
