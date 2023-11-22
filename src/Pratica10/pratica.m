clear all
close all
im = imread ('ruido.jpg');
imOriginal = im;
imBorda = uint8(zeros(size(im,1)+2, size(im,2)+2));
x = 1;
y = 1;
for i = 2: 1:size(imBorda,1)-1
  for j = 2: 1:size(imBorda,2)-1
      imBorda(i,j) = im(x,y);
      y++;
  endfor
  y = 1;
  x++;
endfor
% Inicialize a matriz 5x5 com zeros
matriz = zeros(3, 3);
% Preencha a matriz com valores fornecidos pelos usuários
for i = 1:3
    for j = 1:3
        prompt = sprintf('Digite o valor para a posição (%d, %d) do elemento estruturante: ', i, j);
        matriz(i, j) = input(prompt);
    end
end
x = 1;
y = 1;
for i = 2: 1:size(imBorda,1)-1
  for j = 2: 1:size(imBorda,2)-1
      viz = [imBorda(i-1,j-1)+matriz(1,1),imBorda(i-1,j)+matriz(1,2),imBorda(i-1,j+1)+matriz(1,3),imBorda(i,j-1)+matriz(2,1),imBorda(i,j)+matriz(2,2),imBorda(i,j+1)+matriz(2,3),imBorda(i+1,j+1)+matriz(3,1),imBorda(i+1,j)+matriz(3,2),imBorda(i+1,j+1)+matriz(3,3)];
      total = sum(viz)/9;
      im(x,y) = total;
      y++;
  endfor
  y = 1;
  x++;
endfor
figure('name', 'imProcessada');
imshow(im);
figure('name', 'imOriginal');
imshow(imOriginal);
