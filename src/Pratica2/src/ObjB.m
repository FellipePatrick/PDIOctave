im = imread('C:\Users\Fellipe Patrick\Pictures\ex\lena.png');
#Atribuição direta na matriz
imTc = im;
imTc(:,:,:) = imT(:,:,:) + (0.8 * imT(:,:,:));
imTe = im;
imTe(:,:,:) = imT(:,:,:) - (0.8 * imT(:,:,:));
#Atribuição indireta
imClara = im;
imEscura = im;
for i = 1: size(im)
  for j = 1: size(im)
    imClara(i,j) = im(i,j) + (0.8 * im(i,j));
    imEscura(i,j) = im(i,j) - (0.8 * im(i,j));
  endfor
endfor
figure(1);
imshow(imTe);

