clear all
close all
pkg load image;

quadro = zeros (512,512, "uint8");

montanha = imread('C:\Users\Fellipe Patrick\Documents\repositorios git\PDIOctave\src\Pratica4\images\object_5.jpg');

ceu = imread('C:\Users\Fellipe Patrick\Documents\repositorios git\PDIOctave\src\Pratica4\images\background_5.jpg');

clone = ceu;

agua = imread('C:\Users\Fellipe Patrick\Documents\repositorios git\PDIOctave\src\Pratica4\images\mask_1.bmp');

passaro = imread('C:\Users\Fellipe Patrick\Documents\repositorios git\PDIOctave\src\Pratica4\images\object_3.jpg');

quadro = 255 - montanha(:,:);

mascara = logical(quadro);

for i = 1: 512
  for j = 1: 512
    if(mascara(i,j) == 0)
      quadro(i,j) = ceu(i,j);
    endif
  endfor
endfor




x = 512;
y = 512;

for i = 1: size(ceu,1)
  for j = 1: size(ceu,2)
    clone(i,j) = ceu(x,y);
    y = y - 1;
  endfor
  x = x - 1;
  y = 512;
endfor



figure(1);
imshow(quadro);

