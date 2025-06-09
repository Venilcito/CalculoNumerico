clear(); clc();

printf("*** APROXIMAÇÃO PELO MÉTODO DA SECANTE ***\n\n")
function [xk, k] = secante(f, x0, x1, epsilon1, epsilon2, nMax)
   
    k = 0;
    xk = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));
    
    printf(" k  |     xk     | abs(xk-x1) |    f(xk)   |\n");

    while (k < nMax) & (abs(xk - x1) > epsilon1) & (abs(f(xk)) > epsilon2)
        x0 = x1;
        x1 = xk;
        xk = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));
        k = k + 1;
        printf(" %2.2i | %10.6f | %10.6f | %10.6f |\n", k, xk, abs(xk - x1), f(xk));
    end
    
    printf("\nAproximação ""%8.6f"" à raiz, com ""%2.2i"" iterações\n", xk, k);
endfunction

//printf("EXERCÍCIO 01\n");
//deff('y=E(t)', 'y=162.5*t^3 - 243.75*t^2 + 130*t - 43.75')
//[xk, k] = secante(E, 0.2, 0.3, 1e-5, 1e-5, 100);

//printf("EXERCÍCIO 02\n")
//deff('y=L(u)', 'y=4*u^3 - 30*u^2 + 85*u - 160')
//[xk, k] = secante(L, 2.5, 5, 1e-6, 1e-6, 100)

//printf("EXERCÍCIO 03\n")
//deff('y=p(d)', 'y=25*d^2 + log(d) - 1.5')
//[xk, k] = secante(p, 0.3, 0.4, 1e-6, 1e-6, 100)
