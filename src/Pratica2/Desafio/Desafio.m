im = imread('C:\Users\Fellipe Patrick\Pictures\ex\lena.png');
qtd = input("Digite a quantidade de níveis:");
cont = 0;
vetorNiveis = [];
for i = 1:qtd
    n = input(sprintf('Digite o tom do nível %d:', i));
    vetorNiveis = [vetorNiveis, n];
endfor
for i = 1:size(im, 1)
    for j = 1:size(im, 2)
        cont = cont + 1;
        im(i, j) = im(i, j) + vetorNiveis(cont);
        if cont == qtd
            cont = 0;
        endif
    endfor
endfor
figure(1);
imshow(im);

