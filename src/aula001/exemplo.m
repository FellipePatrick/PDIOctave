img = imread('C:\Users\Fellipe Patrick\Pictures\ex\lena.jpg');
img = (img(:,:,1) * 0.299) + (img(:,:,2) * 0.587) + (img(:,:,3) * 0.114);
auxX = size(img,1);
auxY = size(img,2);
im = img;
for i = 1: size(img, 1)
  for j = 1: size(img, 2)
    im(i,j) = img(auxX,auxY);
    auxX = auxX - 1;
  endfor
  auxY = auxY - 1;
  auxX = size(img,1);
endfor
figure(1);
imshow(im);
