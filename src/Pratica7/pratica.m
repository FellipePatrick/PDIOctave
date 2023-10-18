clear all
close all
bin = imread('soja.png');
im = zeros(size(bin), 'uint8');
cont = 1;
for i = 1: size(bin,1)
  for j = 1: size(bin,2)
    if(bin(i,j))
      if((im(i,j-1) != 0 && im(i-1,j) != 0) || (im(i-1,j-1)!=0) || (im(i-1,j+1)!=0))
        if(im(i-1,j-1)!=0 && im(i-1,j) == 0)
          nE = im(i,j);
          nR = im(i-1,j-1);
        else
          if(im(i-1,j+1)!=0 && im(i-1,j) == 0)
            nE = im(i,j);
            nR = im(i-1,j+1);
          else
             nE = im(i,j-1);
             nR = im(i-1,j);
          endif
        endif
        for x = 1: 1: i
          for y = 1: 1: j
            if(im(x,y) == nE)
              im(x,y) = nR;
            endif
          endfor
        endfor
        im(i,j) = nR;
      else
        if(im(i,j-1) != 0 || im(i-1,j)!= 0)
          if(im(i,j-1)!= 0)
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
figure(1);
imshow(im);
figure(2);
imshow(bin);
