clear(); clc();

printf("*** APROXIMAÇÃO PELO MÉTODO DA BISSEÇÃO ***\n\n")

function xm = bissecao(f, a, b, epsilon1, epsilon2, nMax)
    
    ak = a;
    bk = b;
    k = 0;
    xm = 0.5 * (ak + bk);

    printf("\n  k |     xm     | abs(bk-ak) |   f(xm)      | \n");
    printf("-----------------------------------------------\n");

    while (k < nMax) & (abs(bk - ak) > epsilon1) & (abs(f(xm)) > epsilon2)
        xm = 0.5 * (ak + bk);
        k = k + 1;

        printf(" %2d | %10.6f | %10.6f | %10.6f   |\n", k, xm, abs(bk - ak), f(xm));

        if f(ak) * f(xm) < 0 then
            bk = xm;
        else
            ak = xm;
        end
    end

    printf("-----------------------------------------------\n");
    printf("Aproximadamente: %8.6f é a raiz, com %2d iterações\n", xm, k);            //marca ponto da //raiz aproximada
endfunction

//printf("EXERCÍCIO 01\n");
//deff('y=E(t)', 'y=162.5*t^3 - 243.75*t^2 + 130*t - 43.75')
//xm = bissecao(E, 0.75, 1, 1e-6, 1e-6, 100)

//printf("EXERCÍCIO 02\n")
//deff('y=L(u)', 'y=4*u^3 - 30*u^2 + 85*u - 160')
//xm = bissecao(L, 2.5, 5, 1e-6, 1e-6, 100)

//printf("EXERCÍCIO 03\n")
//deff('y=p(d)', 'y=25*d^2 + log(d) - 1.5')
//xm = bissecao(p, 0.3, 0.4, 1e-6, 1e-6, 100)
