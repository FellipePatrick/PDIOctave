im = imread('C:\Users\Fellipe Patrick\Pictures\ex\lena.png');
for i = 1: size(im, 1)
  for j = 1: size(im, 2)
    im(i,j) = im(i,j) + 80;
  endfor
endfor
figure(1)
imshow(im)
for i = 1: size(im, 1)
  for j = 1: size(im, 2)
    im(i,j) = im(i,j) - 80;
  endfor
endfor
figure(2)
imshow(im)
valor = input("Digite um valor para modificar a imagem: ");
im3 = im;
for i = 1: size(im, 1)
  for j = 1: size(im, 2)
    im3(i,j) = im(i,j) + valor;
  endfor
endfor
figure(3)
imshow(im3)
