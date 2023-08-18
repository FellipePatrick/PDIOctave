im = imread('C:\Users\Fellipe Patrick\Pictures\ex\lena.png');
cont = 255;
imPosterizada = im;
for i = 1: size(im)
  for j = 1: size(im)
    im(i,j) = im(i,j) - cont;
    cont = cont - 1;
  endfor
  cont = 255;
endfor
figure(1);
imshow(im);
