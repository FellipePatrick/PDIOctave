clear all
close all

% Lê a imagem "soja.png" e converte para binário
im = imread("soja.png");
bin = im(:,:,1) > 128; %para uma imagem ja binarizada não é necessario isso
im = im.*uint8(bin);
% Cria uma matriz de rótulos com o mesmo tamanho da imagem binária
labels = zeros(size(bin));

% Inicializa o rótulo com zero
label = 0;

% Função que retorna os valores únicos de um vetor
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
    unique_viz = sort(unique_viz);
endfunction

% Cria uma estrutura para armazenar os erros de rótulos
error = struct();

% Percorre a imagem binária pixel a pixel
for i = 1:size(bin,1)
    for j = 1:size(bin,2)
        % Se o pixel é branco
        if bin(i,j)
            % Obtém os rótulos dos pixels vizinhos
            viz = [labels(i-1,j-1), labels(i-1,j), labels(i,j-1), labels(i-1,j+1)];
            % Obtém os rótulos únicos dos pixels vizinhos
            unique_viz = calc_unique(viz);
            % Se não há rótulos vizinhos
            if(length(unique_viz) == 0)
                % Cria um novo rótulo
                label++;
                labels(i,j) = label;
                % Adiciona o rótulo na estrutura de erros
                error.(num2str(label)) = label;
            % Se há apenas um rótulo vizinho
            elseif(length(unique_viz) == 1)
                % Usa o mesmo rótulo
                labels(i,j) = unique_viz(1);
            % Se há mais de um rótulo vizinho
            else
                % Usa o menor rótulo vizinho
                labels(i,j) = unique_viz(1);
                % Adiciona os outros rótulos na estrutura de erros
                if(~isfield(error, num2str(unique_viz(1))))
                    error.(num2str(unique_viz(1))) = [];
                endif
                error.(num2str(unique_viz(1))) = unique([error.(num2str(unique_viz(1))), unique_viz(2:end)]);
                % Verifica se os outros rótulos vizinhos também possuem erros
                for(k = 2:length(unique_viz))
                    if(isfield(error, num2str(unique_viz(k))))
                        error.(num2str(unique_viz(1))) = unique([error.(num2str(unique_viz(1))), error.(num2str(unique_viz(k)))]);
                        error = rmfield(error, num2str(unique_viz(k)));
                    endif
                end
            end
        endif
    endfor
endfor


% Percorre a imagem labels e armazena o index da struct onde cada valor não-zero aparece
% Este trecho de código percorre a imagem "labels" e armazena o índice da struct onde cada valor não-zero aparece.

indexes = fieldnames(error);
for i = 1:size(labels,1)
    for j = 1:size(labels,2)
        if(labels(i,j) ~= 0)
            for k = 1:length(indexes)
                if ismember(labels(i,j), error.(indexes{k}))
                    labels(i,j) = k;
                    break;
                end
            end
        end
    end
end

numLabels = length(indexes);
disp("Número de objetos:")
disp(numLabels)

figure('name', 'labels')
imshow(labels, [0, numLabels])

%DESAFIO

% Inicializa os valores mínimos e máximos das linhas e colunas para cada objeto
% Este trecho de código inicializa os valores mínimos e máximos das linhas e colunas para cada objeto.

minRow = Inf * ones(numLabels, 1);
maxRow = -Inf * ones(numLabels, 1);
minCol = Inf * ones(numLabels, 1);
maxCol = -Inf * ones(numLabels, 1);

% Percorre a imagem bin e atualiza os valores mínimos e máximos das linhas e colunas para cada objeto
% Este trecho de código percorre a imagem "bin" e atualiza os valores mínimos e máximos das linhas e colunas para cada objeto.

for i = 1:size(bin,1)
    for j = 1:size(bin,2)
        label = labels(i, j);
        if label ~= 0
            minRow(label) = min(minRow(label), i);
            maxRow(label) = max(maxRow(label), i);
            minCol(label) = min(minCol(label), j);
            maxCol(label) = max(maxCol(label), j);
        end
    end
end

% Cria uma matriz com as coordenadas dos retângulos delimitadores de cada objeto
% Este trecho de código cria uma matriz com as coordenadas dos retângulos delimitadores de cada objeto.

boundingBoxes = [minRow, minCol, maxRow, maxCol];

% Mostra a imagem original com os retângulos delimitadores de cada objeto
% Este trecho de código mostra a imagem original com os retângulos delimitadores de cada objeto.

figure('name', 'bounding boxes')
imshow(im)
for i=1:numLabels
    rectangle('Position', [boundingBoxes(i,2), boundingBoxes(i,1), boundingBoxes(i,4) - boundingBoxes(i,2), boundingBoxes(i,3) - boundingBoxes(i,1)], 'EdgeColor', 'r');
end

% Mostra cada objeto isoladamente
% Este trecho de código mostra cada objeto isoladamente.

for i=1:numLabels
    figure('name', ['object ', num2str(i)])
    imshow(im(boundingBoxes(i,1):boundingBoxes(i,3), boundingBoxes(i,2):boundingBoxes(i,4), :))
end

