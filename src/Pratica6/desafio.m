clear all
close all
pkg load image;
%y 613 e x 1000
im = imread('mapa.png');
imR = im(:,:,1);
flag = true;
glob = 254;
for i = 1: size(imR,1)
  for j = 1: size(imR,2)
    if(imR(i,j)>glob && flag == true)
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
      if(imR(i,j)>glob && flag == true)
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
figure(1);
imshow(im);




x = round((1000*d)/140);
x = round(sqrt(x))




