clear all
close all
bin = imread('space_invaders.png');
im = zeros(size(bin), 'uint8');
cont = 20;
for i = 1: size(bin,1)
  for j = 1: size(bin,2)
    if(bin(i,j))
      if(im(i,j-1) != 0 && (im(i-1,j) != 0) || (im(i-1,j-1)!=0 && im(i-1,j) == 0 && im(i,j-1) == 0 ) || im(i-1,j+1)!=0 && im(i-1,j) == 0 && im(i,j-1) == 0)
        if(im(i-1,j-1)!=0 && im(i-1,j) == 0 && im(i,j-1) == 0)
          nR = im(i-1,j-1);
          im(i,j) = nR;
        else
          if(im(i-1,j+1)!=0 && im(i-1,j) == 0 && im(i,j-1) == 0 )
            nR = im(i-1,j+1);
            im(i,j) = nR;
          else
             nE = im(i,j-1);
             nR = im(i-1,j);
             im(i,j) = nR;
             for x = 1: 1: i
              for y = 1: 1: j
                if(im(x,y) == nE)
                  im(x,y) = nR;
                endif
              endfor
            endfor
          endif
        endif
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
