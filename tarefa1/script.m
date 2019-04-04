warning off MATLAB:tifflib:TIFFReadDirectory:libraryWarning
t = Tiff('scene_raw.dng','r');
offsets = getTag(t,'SubIFD');
setSubDirectory(t,offsets(1));
cfa = read(t);
close(t);

numLinhas = 2622;
numColunas = 3948;
numArray = 3; % RGB;

RED = 1;
GREEN = 2;
BLUE = 3;


RGB = zeros(numLinhas, numColunas, numArray);


% montando array bidimensional incompleto RGB
for linhaIDX = 1:numLinhas
    for colunaIDX = 1:numColunas
        if mod(linhaIDX,2) ~= 0 % LINHA IMPAR
            if mod(linhaIDX+colunaIDX, 2) == 0 % Se a soma dos indices for par, entao RED
                RGB(linhaIDX, colunaIDX, RED) = cfa(linhaIDX,colunaIDX);
            else % Se a soma dos indices for impar, entao green
            	RGB(linhaIDX, colunaIDX, GREEN) = cfa(linhaIDX,colunaIDX);
            end
        else % LINHA PAR
            if mod(linhaIDX+colunaIDX, 2) ~= 0 % Se a soma dos indices for impar, entao GREEN
                RGB(linhaIDX, colunaIDX, GREEN) = cfa(linhaIDX,colunaIDX);
            else % Se a soma dos indices for par, entao blue
            	RGB(linhaIDX, colunaIDX, BLUE) = cfa(linhaIDX,colunaIDX);
            end
        end
  
    end
end


r = zeros(numLinhas, numColunas);
g = zeros(numLinhas, numColunas);
b = zeros(numLinhas, numColunas);

% Gerando a matrix de interpolacao inicial (completando a matrix incompleta de R, G E B.
for linhaIDX = 1:numLinhas
    for colunaIDX = 1:numColunas
      if mod(linhaIDX,2) ~= 0 % LINHA IMPAR
            if mod(linhaIDX+colunaIDX, 2) == 0 % Se a soma dos indices for par, ent�o red
                [sumG, sumB, countG, countB] = sumAdjacent(linhaIDX, colunaIDX, numLinhas, numColunas, GREEN, BLUE, RGB);
                g(linhaIDX, colunaIDX) = sumG / countG;
                b(linhaIDX, colunaIDX) = sumB / countB;
            else % Se a soma dos indices for impar, ent�o green
                [sumR, sumB, countR, countB] = sumAdjacent(linhaIDX, colunaIDX, numLinhas, numColunas, RED, BLUE, RGB);
                r(linhaIDX, colunaIDX) = sumR / countR;
                b(linhaIDX, colunaIDX) = sumB / countB;
            end
      else % LINHA PAR
            if mod(linhaIDX+colunaIDX, 2) ~= 0 % Se a soma dos indices for impar, ent�o green
                [sumR, sumB, countR, countB] = sumAdjacent(linhaIDX, colunaIDX, numLinhas, numColunas, RED, BLUE, RGB);
                r(linhaIDX, colunaIDX) = sumR / countR;
                b(linhaIDX, colunaIDX) = sumB / countB;            
            else % Se a soma dos indices for par, ent�o blue
            	[sumG, sumR, countG, countR] = sumAdjacent(linhaIDX, colunaIDX, numLinhas, numColunas, GREEN, RED, RGB);
                g(linhaIDX, colunaIDX) = sumG / countG;
                r(linhaIDX, colunaIDX) = sumR / countR;
            end
      end

    end
end

% somando a matrix incompleta com a interpolada para obter a matrix RGB final
RGB(:, :, RED) = r + RGB(:, :, RED);
RGB(:, :, GREEN) = g + RGB(:, :, GREEN);
RGB(:, :, BLUE) = b + RGB(:, :, BLUE);


%Posição do pixel para fazer o white balancing
positionPixelX = 2384;
positionPixelY= 1880;

%Normalizar Array
RGB = RGB ./ max(RGB(:));

% whiteBalancing 
RGB(:,:,RED) = RGB(:, :, RED) / RGB(positionPixelX, positionPixelY, RED);
RGB(:,:,BLUE) = RGB(:, :, BLUE) / RGB(positionPixelX, positionPixelY, BLUE);
RGB(:,:,GREEN) = RGB(:, :, GREEN)/ RGB(positionPixelX, positionPixelY, GREEN);


% whiteBalancing 2
%RGB = whiteBalancing(RGB, numLinhas, numColunas);

%gamma correction
%gamma = 0.5;
%RGBGAMMA = RGB.^(1/gamma); 


RGBGAMMA = RGB.^(1/2.2);
%RGBGAMMA = uint8(RGBGAMMA);

imtool(RGBGAMMA);


