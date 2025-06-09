// https://www.wolframalpha.com/input?i=derivative
clear(); clc();

printf("*** APROXIMAÇÃO PELO MÉTODO DE NEWTON-RAPHSON ***\n\n")

function [xk, k] = newton_raphson(f, f1, a, b, epsilon1, epsilon2, nMax)
   
    xk = (a + b) / 2; 
    x0 = xk + 1;
    k = 0;
    
    printf(" k  |     xk     | abs(xk-x0) |    f(xk)   |   f1(xk)   |\n");
    
    while (k < nMax) & (abs(xk - x0) > epsilon1) & (abs(f(xk)) > epsilon2)
        x0 = xk;
        xk = x0 - f(x0) / f1(x0);
        k = k + 1;
        printf(" %2.2i | %10.6f | %10.6f | %10.6f | %10.6f |\n", k, xk, abs(xk - x0), f(xk), f1(xk));
    end
    
    printf("\nAproximação ""%8.6f"" à raiz, com ""%2.2i"" iterações\n\n", xk, k);
endfunction

//printf("EXERCÍCIO 01\n");
//deff('y=E(t)', 'y=162.5*t^3 - 243.75*t^2 + 130*t - 43.75')
//deff('y=E1(t)', 'y=487.5*t^2 - 487.5*t + 130');
//[xk, k] = newton_raphson(E, E1, 0.75, 1, 1e-6, 1e-6, 100);

//printf("EXERCÍCIO 02\n")
//deff('y=L(u)', 'y=4*u^3 - 30*u^2 + 85*u - 160')
//deff('y=L1(u)', 'y=12*u^2 - 60*u + 85')
//[xk, k] = newton_raphson(L, L1, 2.5, 5, 1e-6, 1e-6, 100)

//printf("EXERCÍCIO 03\n")
//deff('y=p(d)', 'y=25*d^2 + log(d) - 1.5')
//deff('y=p1(d)', 'y=50*d + 1/d')
//[xk, k] = newton_raphson(p, p1, 0.3, 0.4, 1e-6, 1e-6, 100)
