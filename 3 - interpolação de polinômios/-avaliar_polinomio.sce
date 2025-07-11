function [valor_aprox, erro_percentual] = avaliar_polinomio(POL, ponto, valor_real)
    valor_aprox = horner(POL, ponto)
    
    if argn(2) == 3 then
        erro_percentual = abs((valor_aprox - valor_real) / valor_real) * 100
    else
        erro_percentual = %nan;
    end
endfunction
        