clear(); clc();
function ajuste_polinomial_mom(X, Y, ordem)
    n = length(X);
    
    printf("\n***** AJUSTE POLINOMIAL - MOM - Ver. MONOLÍTICA *****\n")
    printf("\n[1] TABELA DE DADOS:\n");
    for i = 1:n
        printf("   x = %.6f   y(x) = %.6f\n", X(i), Y(i));
    end

    grau = ordem + 1;
    A = zeros(grau, grau);
    B = zeros(grau, 1);

    // Montando matriz A
    for i = 1:grau
        for j = 1:grau
            for k = 1:n
                A(i,j) = A(i,j) + X(k)^(i-1 + j-1);
            end
        end
    end
    printf("\n[2] MATRIZ DO SISTEMA NORMAL (A):\n");
    disp(A);

    // Montando vetor B
    for i = 1:grau
        for k = 1:n
            B(i) = B(i) + X(k)^(i-1) * Y(k);
        end
    end
    printf("\n[3] VETOR DOS TERMOS INDEPENDENTES (B):\n");
    disp(B);

    // Resolvendo o sistema
    M = A \ B;
    printf("\n[4] COEFICIENTES DO POLINÔMIO DE AJUSTE:\n");
    for i = 1:grau
        printf("   a_%d - %.6f\n", i-1, M(i));
    end

    Pol_ajuste = poly(M, 'x', 'c');
    printf("\n[5] POLINÔMIO DE AJUSTE:\n");
    disp(Pol_ajuste);

    // Cálculo de SSR e R^2
    Ybar = mean(Y);
    SSR = 0;
    SST = 0;

    for i = 1:n
        ajuste = horner(Pol_ajuste, X(i));
        SSR = SSR + (Y(i) - ajuste)^2;
        SST = SST + (Y(i) - Ybar)^2;
    end

    R2 = 1 - SSR/SST;
    printf("\n[6] SOMA DOS QUADRADOS DOS RESÍDUOS (SSR): %.6f\n", SSR);
    printf("[7] COEFICIENTE DE DETERMINAÇÃO R²: %.6f\n", R2);

    // Plotagem
    xx = linspace(min(X), max(X), 300);
    yy = horner(Pol_ajuste, xx);

    clf();
    plot(X, Y, 'ro', xx, yy, 'b', 'LineWidth', 3);
    xgrid();
    xtitle("Ajuste Polinomial por MOM", "x", "y(x)");
    legend(["Dados observados", "Curva ajustada"], 2);

    printf("\n******** FIM DO AJUSTE POLINOMIAL POR MOM ********\n");
endfunction

// Exercício 2

// GRAU 1
//X = [1,2,3,4,5,6,7,8,9,10,11,12]
//Y = [1.8,3.6,5.7,7.9,10.3,12.1,13.8,16.2,18.4,20.3,22.9,24.1]
//grau = 1
//ajuste_polinomial_mom(X, Y, grau)

// GRAU 2
//grau = 2
//ajuste_polinomial_mom(X, Y, grau)

// GRAU 3
//grau = 3
//ajuste_polinomial_mom(X, Y, grau)


// Exercício 3

// GRAU 1
X = [1,1/2,1/4,1/8]
Y = [240,125,70,42]
//grau = 1
//ajuste_polinomial_mom(X, Y, grau)

// GRAU 2
//grau = 2
//ajuste_polinomial_mom(X, Y, grau)

// GRAU 3
grau = 3
ajuste_polinomial_mom(X, Y, grau)