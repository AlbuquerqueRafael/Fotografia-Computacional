%Função para somar os adjacentes diferentes de 0
function [sumParam1, sumParam2, countParam1, countParam2] = sumAdjacent(linhaIDX, colunaIDX, numLinhas, numColunas, param1, param2, RGB)
    sumParam1 = 0;
    sumParam2 = 0;
    countParam1 = 0;
    countParam2 = 0;
    for innerLinhaIDX = linhaIDX-1:linhaIDX+1
        for innerColunaIDX = colunaIDX-1:colunaIDX+1
            if innerLinhaIDX >=1 && innerLinhaIDX <= numLinhas && innerColunaIDX >= 1 && innerColunaIDX <= numColunas
                if (RGB(innerLinhaIDX, innerColunaIDX, param1) ~= 0)
                    countParam1 = countParam1 + 1;
                    sumParam1 = sumParam1 + RGB(innerLinhaIDX, innerColunaIDX, param1);
                end
                if (RGB(innerLinhaIDX, innerColunaIDX, param2) ~= 0)
                    countParam2 = countParam2 + 1;
                    sumParam2 = sumParam2 + RGB(innerLinhaIDX, innerColunaIDX, param2);
                end
            end
        end
    end
end
