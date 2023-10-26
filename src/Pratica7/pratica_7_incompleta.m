clear all
close all

bin = imread("space_invaders.png");
labels = zeros(size(bin));
label = 0;

function unique_viz = calc_unique (viz)
    unique_viz = [];
    for s = 1 : length(viz)
        flag = false;
        for t = 1 : length(unique_viz)
            if viz(s) == unique_viz(t)
                flag = true;
            endif
        endfor
        if(!flag && viz(s) != 0)
            unique_viz = [unique_viz, viz(s)];
        endif
    endfor
endfunction

errors = [];

for i = 1:size(bin,1)
    for j = 1:size(bin,2)
        if bin(i,j)
            viz = [labels(i-1,j), labels(i,j-1)];
            unique_viz = calc_unique(viz);
            if(length(unique_viz) == 0)
                label++;
                labels(i,j) = label;
            elseif(length(unique_viz) == 1)
                labels(i,j) = unique_viz(1);
            elseif(length(unique_viz) == 2)
                labels(i,j) = unique_viz(1);
                errors = [errors;unique_viz];
            end
        endif
    endfor
endfor

