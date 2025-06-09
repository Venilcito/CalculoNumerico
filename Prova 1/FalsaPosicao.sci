clear(); clc()

printf("*** APROXIMAÇÃO PELO MÉTODO DA FALSA-POSIÇÃO ***\n\n")

function [xk, k] = falsa_posicao(f, a, b, epsilon1, epsilon2, nMax)
    k = 0;
    xk = (a * f(b) - b * f(a)) / (f(b) - f(a));
    
    printf(" k  |     xk     | abs(b-a)   |    f(xk)   |\n");
    
    while (k < nMax) & (abs(b - a) > epsilon1) & (abs(f(xk)) > epsilon2)
        xk = (a * f(b) - b * f(a)) / (f(b) - f(a));
        k = k + 1;
        printf(" %2.2i | %10.6f | %10.6f | %10.6f |\n", k, xk, abs(b - a), f(xk));
        
        if f(a) * f(xk) < 0 then
            b = xk;
        else
            a = xk;
        end
    end
    
    // Exibir resultado final
    printf("\nAproximação ""%8.6f"" à raiz, com ""%2.2i"" iterações\n", xk, k);
endfunction

//printf("EXERCÍCIO 01\n");
//deff('y=E(t)', 'y=162.5*t^3 - 243.75*t^2 + 130*t - 43.75')
//[xk, k] = falsa_posicao(E, 0.75, 1, 1e-6, 1e-6, 100);

//printf("EXERCÍCIO 02\n")
//deff('y=L(u)', 'y=4*u^3 - 30*u^2 + 85*u - 160')
//[xk, k] = falsa_posicao(L, 2.5, 5, 1e-6, 1e-6, 100)

//printf("EXERCÍCIO 03\n")
//deff('y=p(d)', 'y=25*d^2 + log(d) - 1.5')
//[xk, k] = falsa_posicao(p, 0.3, 0.4, 1e-6, 1e-6, 100)
