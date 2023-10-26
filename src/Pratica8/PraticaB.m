clear all
close all
im = imread('Imagem.png');
imVP = uint8(rand(248,248,3));
imBI = imVP;
imGG = imVP;
x = 1;
y = 1;
%Vizinhança mais próxima
for i = 1: 2: 247
  for j = 1: 2: 247
    imVP(i,j,:) =  im(x,y,:);
    imVP(i,j+1,:) =  im(x,y,:);
    imVP(i+1,j,:) =  im(x,y,:);
    imVP(i+1,j+1,:) =  im(x,y,:);
    y++;
  endfor
  x++;
  y = 1;
endfor

%Interpolação bilinear
x = 0;
y = 0;
tic
for i = 1: 2: 247
  if(x < 123)
    x++;
  end
  y = 0;
  for j = 1: 2: 247
      if(y < 123)
        y++;
      end
      p =  im(x,y,:)/4 + im(x,y+1,:)/4 + im(x+1,y,:)/4 + im(x+1,y+1,:)/4;
      imBI(i,j,:) = p;
      imBI(i,j+1,:) = p;
      imBI(i+1,j,:) = p;
      imBI(i+1,j+1,:) = p;
  endfor
endfor
toc
x = 0;
y = 0;
tic
for i = 1: 2: 247
  if(x < 122)
    x++;
  end
  y = 0;
  for j = 1: 2: 247
        if(y < 122)
        y++;
      end
      p =  im(x,y,:)/8 + im(x,y+1,:)/8 + im(x+1,y,:)/8 + im(x+1,y+1,:)/8 + im(x,y+2,:)/8 + im(x+2,y,:)/8 + im(x+2,y+2,:)/8 ;
      imGG(i,j,:) = p;
      imGG(i,j+1,:) = p;
      imGG(i+1,j,:) = p;
      imGG(i+1,j+1,:) = p;
      imGG(i,j+2,:) = p;
      imGG(i+2,j,:) = p;
      imGG(i+2,j+2,:) = p;
  endfor
endfor
toc
figure(1);
imshow(imVP);
figure(2);
imshow(imBI);
figure(3);
imshow(imGG);
