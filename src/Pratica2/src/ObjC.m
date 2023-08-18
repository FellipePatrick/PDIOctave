im = imread('C:\Users\Fellipe Patrick\Pictures\ex\lena.png');
clone = im;
cont = 255;
imPosterizada = im;
for i = 1: size(im)
  for j = 1: size(im)
    im(i,j) = im(i,j) - cont;
    cont = cont - 1;
  endfor
  cont = 255;
endfor
for i = 1: size(im)
  for j = 1: size(im)
    if(imPosterizada(i,j) >= 0 && imPosterizada(i,j) <= 82)
        imPosterizada(i,j) = 0;
    else
        if(imPosterizada(i,j) >= 83 && imPosterizada(i,j) <= 164)
            imPosterizada(i,j) = 126;
        else
            imPosterizada(i,j) = 220;
        endif
    endif
  endfor
endfor
figure(1);
imshow(imPosterizada);
figure(2);
imshow(im);
figure(3);
imshow(clone);
