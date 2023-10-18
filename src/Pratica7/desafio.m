clear all
close all
imx = imread('sojar.png');
bin = imx(:,:,1);
im = zeros(size(imx));
for i = 1: size(imx,1)
  for j = 1: size(imx,2)
    if(imx(i,j,1) > 126)
      bin(i,j,:) = 255;
    endif
  endfor
endfor
cont = 1;
for i = 1: size(bin,1)
  for j = 1: size(bin,2)
    if(bin(i,j) ==255)
      if(((im(i,j-1) != 0 && im(i,j-1) != 255) && (im(i-1,j) != 0 && im(i-1,j) != 255)))
       nE = im(i,j-1);
       nR = im(i-1,j);
        for x = 1: 1: i
          for y = 1: 1: j
            if(im(x,y) == nE)
              im(x,y) = nR;
            endif
          endfor
        endfor
        im(i,j) = nR;
      else
        if((im(i,j-1) != 0 && im(i,j-1) != 255) || (im(i-1,j)!= 0 && im(i-1,j)!= 255))
          if(im(i,j-1)!= 0 && im(i,j-1)!= 255)
            im(i,j) = im(i,j-1);
          else
            im(i,j) = im(i-1,j);
          endif
        else
          im(i,j) = cont;
          cont++;
        endif
      endif
    endif
  endfor
endfor
unicos = unique(im);
objetos = size(unicos,1) - 1;







