im = imread('C:\Users\Fellipe Patrick\Pictures\ex\lena.png');
qtd = input("Digite a quantidade de níveis:");
anterior = 0;
proximo = 0;
nivel = 0;
cont = qtd;
for c = 1: cont;
  if(qtd < 3)
    proximo = 255/(qtd);
  else
    proximo = 255/(qtd-1);
  endif
  nivel = anterior;
  for i = 1: size(im,1)
    for j = 1: size(im,2)
      if(im(i,j) >= anterior && im(i,j) <= proximo)
        im(i,j) = nivel;
      endif
    endfor
  endfor
  qtd = qtd - 1;
  anterior = proximo;
endfor
figure(3);
imshow(im);

