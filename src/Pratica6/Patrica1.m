clear all
close all
pkg load image;
%y 613 e x 1000
im = imread('mapa.png');
imB = im(:,:,3);
flag = true;
glob = 185;
for i = 1: size(imB,1)
  for j = 1: size(imB,2)
    if(imB(i,j)>glob && flag == true)
      x = i;
      s = j;
      flag = false;
      im(:,j,:) = 0;
      im(i,j,:) = 255;
    endif
  endfor
  if(!flag)
    break;
  endif
endfor
flag = true;
for i = 613:-1:1
    for j = 1000:-1:1
      if(imB(i,j)>glob && flag == true)
        y = i;
        t = j;
        flag = false;
        im(i,:,:) = 0;
        im(i,j,:) = 255;
      endif
    endfor
    if(!flag)
      break;
    endif
end
px = power((y-x),2);
py = power((t-s),2);
sT = px+py;
d = round(sqrt(px+py));
%figure(1);
%imshow(im);
