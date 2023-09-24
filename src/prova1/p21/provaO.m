clear all
close all
pkg load image;
mascara = imread('mask_21.png');
arvore = imread('land_21.png');
tarta = imread('animal_21.png');
textura = imread('text_21.png');
ass = imread('tads_21.png');
saida = uint8(mascara);
%recortando a arvore na saida
for i = 1: size(mascara,1)
  for j = 1: size(mascara,2)
    if(mascara(i,j) == 0)
      saida(i,j,:) = arvore(i,j,:);
    endif
  endfor
endfor
%virar a tartaruga
tartP = tarta;
cont = 513;
for i = 1: size(tarta,1)
 tartP(:,cont-i,:) = tarta(i,:,:);
endfor
tartP = (tartP(:,:,1) * 0.2989) + (tartP(:,:,2) * 0.5870) + (tartP(:,:,3) * 0.1140);
for i = 1: size(mascara,1)
  for j = 1: size(mascara,2)
    if(saida(i,j) < 100 && i > 200)
      saida(i,j,:) = tartP(i,j,:);
    endif
  endfor
endfor
%colocando a arvore sem pixelar
cont = 1;
for i = 1: size(mascara,1)
  for j = 1: size(mascara,2)
    if(saida(i,j) > 240)
      saida(i,j,:) = arvore(i,j,:);
      if(saida(i,j) != 0 && cont!= 7)
        saida(i,j+5,:) = 0;
        if(i < 507)
          saida(i+5,j,:) = 0;
        endif
        cont = 1;
      endif
      cont += 1;
    endif
  endfor
endfor
%pintando de rosa
for i = 1: size(mascara,1)
  for j = 1: size(mascara,2)
    if(mascara(i,j) > 100 && mascara(i,j) < 150)
      saida(i,j,1) = 255;
      saida(i,j,2) = 0;
      saida(i,j,3) = 255;
    endif
  endfor
endfor
%colorindo a assinatura
for i = 1: size(ass,1)
  for j = 1: size(ass,2)
    if(ass(i,j)!= 255)
      ass(i,j,:) = textura(i,j,:);
    endif
  endfor
endfor
for i = 1: size(mascara,1)
  for j = 1: size(mascara,2)
    if(mascara(i,j) > 150 && mascara(i,j) < 240)
      saida(i,j,:) = 0;
    endif
  endfor
endfor
l = 1;
for i = 1: 80
  for j = 1: size(mascara,2)
    if(j > 352)
      if(ass(i,l) != 255)
        saida(i,j,:) = ass(i,l,:);
      endif
      l = l + 1;
    endif
  endfor
  l = 1;
endfor
figure(1);
imshow(saida);
