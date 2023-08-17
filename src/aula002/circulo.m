m1 = imread('C:\Users\Fellipe Patrick\Pictures\ex\circulo.png')
m2 = m1;
figure(1);
m2 = uint8(m2);
for i = 1: size(m2, 1)
  for j = 1: size(m2, 2)
    if(m2(i,j) == 1)
        m2(i,j) = 126;
    endif
  endfor
endfor
imshow(m2);
