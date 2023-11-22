clear all
close all
bin = imread('space_invaders.png');
im = zeros(size(bin), 'uint8');
cont = 10;
for i = 1: size(bin,1)
  for j = 1: size(bin,2)
    if(bin(i,j))
      if(im(i-1,j)!=0 && im(i+1,j-1) !=0)
        v = im(i-1,j);
        e = im(i+1,j-1);
        im(i,j) = v;
        x = i+1;
        y = j-1;
        while(im(x,y) != v && im(x,y) != 0)
          z = x - 1;
          while(im(z,y) != v && im(z,y) != 0)
            im(z,y) = v;
            z--;
          endwhile
          im(x,y) = v;
          y--;
        endwhile
       endif
      else
        if(im(i-1,j) != 0 || im(i,j-1) != 0)
          if(im(i-1,j) != 0)
            im(i,j) = im(i-1,j);
          else
            im(i,j) = im(i,j-1);
          endif
        else
          im(i,j) = cont;
          cont++;
        endif
    endif
  endfor
endfor

ong = size(unique(im)) - 1;

figure(1);
imshow(im);
