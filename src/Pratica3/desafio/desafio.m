clear all
close all
im = imread('fractal.png');
size(im)
im7 = logical(im);
im8 = logical(im);
vetor = uint8(linspace(1, 10, 8));
tic
for i = 1: size(im, 1)
  for j = 1: size(im, 2)
    var = dec2bin(uint8(im(i,j)));
    s = size(var,2);
    while s < 8
      var(1,s+1) = 0;
      s = s + 1;
    endwhile
    nZeros = 8 - size(var,2);
    for x = 1: nZeros
      vetor(x) = 0;
    endfor
    n = 1;
    if nZeros == 0
      nZeros = 1;
    endif
    for x = nZeros: 8
      vetor(1,x) = (uint8((var(1,n))));
      n = n + 1;
    endfor
    if vetor(1,7) != 0
      im7(i, j) = 1;
    else
      im7(i, j) = 0;
    endif
    if vetor(1,8) != 0
      im8(i, j) = 1;
    else
      im8(i, j) = 0;
    endif
  endfor
end
toc
imT = im7 + im8;
subplot(1, 2, 1);
imshow(im);
title('ImEntrada');
subplot(1, 2, 2);
imshow(imT);
title('ImSaida');
