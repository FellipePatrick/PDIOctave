im = zeros (256,256, "uint8");
clone = im;
cont = 0;
for i = 1: size(im, 1)
  for j = 1: size(im, 2)
    clone(i,j) = cont;
    if((j >= 8 && j < 25) || (i > 16 && i < 36) || (i > 219 && i < 239) )
      im(i,j) = 100;
    else
      if(j < 247 && j >= 230 )
        im(i,j) = 100;
      else
        im(i,j) = cont;
      endif
    endif
  endfor
  cont = cont + 1;
endfor
figure(1);
imshow(im);
figure(2);
imshow(clone);
