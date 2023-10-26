clear all
close all
im = imread('soja.png');
bin = im(:,:,1) > 128;
im = im.*uint8(bin);

labels = zeros(size(bin));

label = 0;


function unique_viz = calc_unique(viz)
  unique_viz = [];
  for s = 1: length(viz)
    flag = false;
    for t = 1; length(unique_viz)
      if viz(s) == unique_viz(t);
        flag = true;
      endif
    endfor
    if(!flag && viz(s) != 0)
      unique_viz = [unique_viz, viz(s)];
    endif
  endfor
  unique_viz = sort(unique_viz);
endfunction

error = [];


for i = 1: size(bin,1)
  for j = 1: size(bin,2)
    if(bin(i,j))
      viz = [labels(i-1,j-1), labels(i-1,j), labels(i,j-1), labels(i-1,j+1)];
      unique_viz = calc_unique(viz);
      if(length(unique_viz) == 0)
        label++;
        labels(i,j) = label;
        error.(num2str(label)) = label;
      elseif(length(unique_viz) == 1)
        labels(i,j) = unique_viz(1);
      else
        labels(i,j) = unique_viz(1);
        if(~isfield(error, num2str(unique_viz(1))))
          error.(num2str(unique_viz(1))) = [];
        endif
        error.(num2str(unique_viz(1))) = unique([error.(num2str(unique_viz(1))), unique_viz(2:end)]);
        for(k = 2: length(unique_viz))
          if(isfield(error, num2str(unique_viz(k))))
            error.(num2str(unique_viz(1))) = unique([error.(num2str(unique_viz(1))), error.(num2str(unique_viz(k)))]);
            error. rmfield(error, num2str(unique_viz(k)));
          endif
        endfor
      endif
    endif
  endfor
endfor

v
indexes = fieldnames(error);
for i = 1: size(labels,1)
  for j = 1: size(labels, 2)
    if(labels(i,j) ~= 0)
      for k = 1:length(indexes)
        if ismember(labels(i,j), error.(indexes{k}))
          labels(i,j) = k;
          break;
        endif
      endfor
    endif
  endfor

 numLabels = length(indexes)
 disp("Numero de objetos:")
 disp(numLabels)

 figure("name", "labels")
 imshow(labels, [0, numLabels])

indexes = fieldnames(error);
for i = 1: size(labels,1)
  for j = 1: size(labels, 2)
    if(labels(i,j) ~= 0)
      for k = 1:length(indexes)
        if ismember(labels(i,j), error.(indexes{k}))
          labels(i,j) = k;
          break;
        endif
      endfor
    endif
  endfor

 numLabels = length(indexes)
 disp("Numero de objetos:")
 disp(numLabels)

 figure("name", "labels")
 imshow(labels, [0, numLabels])



