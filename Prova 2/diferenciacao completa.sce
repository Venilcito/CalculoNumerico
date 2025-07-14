clear(); clc();

function Progressiva_1a_Ordem(X, Y, k, derivada_1a_exata, derivada_2a_exata)
    h = abs(X(k+1) - X(k))
    derivada_numerica = (Y(k+1) - Y(k)) / h

    printf("\n   Cálculo da derivada de 1a ordem em x = %g pela fórmula Progressiva de 1a Ordem:\n", X(k))
    printf("   Aproximação: (f(xk+1) - f(xk)) / h\n")
    printf("   Computando: (%f - %f) / %f\n", Y(k+1), Y(k), h)
    printf("   Resultado: %f\n", derivada_numerica)

    Imprimir_Erro(derivada_1a_exata, derivada_numerica)
    Erro_Truncamento_P(h, derivada_2a_exata)
endfunction

function Regressiva_1a_Ordem(X, Y, k, derivada_1a_exata, derivada2a_exata)
    h = abs(X(k) - X(k-1))
    derivada_numerica = (Y(k) - Y(k-1)) / h
    
    printf("\n   Cálculo da derivada de 1a ordem em x = %g pela fórmula Regressiva de 1a Ordem:\n", X(k))
    printf("   Aproximação: (f(xk) - f(xk-1)) / h\n")
    printf("   Computando: (%f - %f) / %f\n", Y(k), Y(k-1), h)
    printf("   Resultado: %f\n", derivada_numerica)
    
    Imprimir_Erro(derivada_1a_exata, derivada_numerica)
    Erro_Truncamento_P(h, derivada2a_exata)
endfunction

function Centrada_2a_Ordem_1a(X, Y, k, derivada_1a_exata, derivada_3a_exata)
    h1 = abs(X(k+1) - X(k))
    h2 = abs(X(k) - X(k-1))
    h = h1 + h2
    derivada_numerica = (Y(k+1) - Y(k-1)) / h
    
    printf("\n   Cálculo da derivada de 1a ordem em x = %g pela fórmula Centrada de 2a Ordem:\n", X(k))
    printf("   Aproximação: (f(xk+1) - f(xk-1)) / (h1 + h2)\n")
    printf("   Computando: (%f - %f) / %f\n", Y(k+1), Y(k-1), h)
    printf("   Resultado: %f\n", derivada_numerica)
    
    Imprimir_Erro(derivada_1a_exata, derivada_numerica)
    Erro_Truncamento_C21(h/2, derivada_3a_exata)
endfunction

function Centrada_2a_Ordem_2a(X, Y, k, derivada_2a_exata, derivada_4a_exata)
    h1 = abs(X(k+1) - X(k))
    h2 = abs(X(k) - X(k-1))
    h_prod = h1 * h2
    derivada_numerica = (Y(k+1) - 2*Y(k) + Y(k-1)) / h_prod
    
    printf("\n   Cálculo da derivada de 2a ordem em x = %g pela fórmula Centrada de 2a Ordem:\n", X(k))
    printf("   Aproximação: (f(xk+1) - 2*f(xk) + f(xk-1)) / (h1 * h2)\n")
    printf("   Computando: (%f - 2*%f + %f) / %f\n", Y(k+1), Y(k), Y(k-1), h_prod)
    printf("   Resultado: %f\n", derivada_numerica)
    
    Imprimir_Erro(derivada_2a_exata, derivada_numerica)
    Erro_Truncamento_C(h_prod, derivada_4a_exata)
endfunction

function Lagrange_1o_Caso(X, Y, k, derivada_1a_exata)
    h1 = abs(X(k) - X(k+1))
    h2 = abs(X(k+1) - X(k+2))
    h = h1 + h2
    derivada_numerica = (-3*Y(k) + 4*Y(k+1) - Y(k+2)) / h
    
    printf("\n   Cálculo da derivada de 1a ordem em x = %g pelo Método de Lagrange - 1o caso:\n", X(k))
    printf("   Aproximação: (-3*f(xk) + 4*f(xk+1) - f(xk+2)) / h\n")
    printf("   Computando: (-3*%f + 4*%f - %f) / %f\n", Y(k), Y(k+1), Y(k+2), h)
    printf("   Resultado: %f\n", derivada_numerica)
    
    Imprimir_Erro(derivada_1a_exata, derivada_numerica)
endfunction

function Lagrange_2o_Caso(X, Y, k, derivada_1a_exata)
    h1 = abs(X(k+1) - X(k))
    h2 = abs(X(k) - X(k-1))
    h = h1 + h2
    derivada_numerica = (Y(k+1) - Y(k-1)) / h
    
    printf("\n   Cálculo da derivada de 1a ordem em x = %g pelo Método de Lagrange - 2o caso (centrado):\n", X(k))
    printf("   Aproximação: (f(xk+1) - f(xk-1)) / h\n")
    printf("   Computando: (%f - %f) / %f\n", Y(k+1), Y(k-1), h)
    printf("   Resultado: %f\n", derivada_numerica)
    
    Imprimir_Erro(derivada_1a_exata, derivada_numerica)
endfunction

function Lagrange_3o_Caso(X, Y, k, derivada_1a_exata)
    h1 = abs(X(k-2) - X(k-1))
    h2 = abs(X(k-1) - X(k))
    h = h1 + h2
    derivada_numerica = (Y(k-2) - 4*Y(k-1) + 3*Y(k)) / h
    
    printf("\n   Cálculo da derivada de 1a ordem em x = %g pelo Método de Lagrange - 3o caso:\n", X(k))
    printf("   Aproximação: (f(xk-2) - 4*f(xk-1) + 3*f(xk)) / h\n")
    printf("   Computando: (%f - 4*%f + 3*%f) / %f\n", Y(k+2), Y(k-1), Y(k), h)
    printf("   Resultado: %f\n", derivada_numerica)
    
    Imprimir_Erro(derivada_1a_exata, derivada_numerica)
endfunction

function Imprimir_Erro(derivada_exata, derivada_numerica)
    erro_percentual = abs((derivada_exata - derivada_numerica) / derivada_exata) * 100
    printf("   Erro relativo percentual: |(%f - %f) / %f| * 100%% = %f%%\n", derivada_exata, derivada_numerica, derivada_exata, erro_percentual)
endfunction

function Erro_Truncamento_P(h, derivada_2a_exata)
    erro_trunc = abs(- (h/2) * derivada_2a_exata)
    printf("   Erro de truncamento (progressiva 1a ordem): |-(h/2) * segundaDerivada| = %.6f\n", erro_trunc)
endfunction

function Erro_Truncamento_R(h, derivada_2a_exata)
    erro_trunc = abs((h/2) * derivada_2a_exata)
    printf("   Erro de truncamento (regressiva 1a ordem): |(h/2) * segundaDerivada| = %.6f\n", erro_trunc)
endfunction

function Erro_Truncamento_C21(h, derivada_3a_exata)
    erro_trunc = abs((h^2 / 6) * derivada_3a_exata)
    printf("   Erro de truncamento (centrada 2a ordem 1a derivada): (h^2/6) * terceiraDerivada| = %.6f\n", erro_trunc)
endfunction

function Erro_Truncamento_C(h, derivada_4a_exata)
    erro_trunc = abs((h / 12) * derivada_4a_exata)
    printf("   Erro de truncamento (centrada 2a ordem 2a derivada): (h/12) * quartaDerivada| = %.6f\n", erro_trunc)
endfunction

function diferenciacao_numerica_completa(X, Y, k, d1, d2, d3, d4)
    printf("\n***** DIFERENCIAÇÃO NUMÉRICA - MÓDULO COMPLETO *****\n")

    printf("\n>> Progressiva de 1a Ordem:")
    Progressiva_1a_Ordem(X, Y, k, d1, d2)

    printf("\n>> Regressiva de 1a Ordem:")
    Regressiva_1a_Ordem(X, Y, k, d1, d2)

    printf("\n>> Centrada de 2a Ordem (1a derivada):")
    Centrada_2a_Ordem_1a(X, Y, k, d1, d3)

    printf("\n>> Centrada de 2a Ordem (2a derivada):")
    Centrada_2a_Ordem_2a(X, Y, k, d2, d4)

    printf("\n>> Lagrange - 1o Caso:")
    Lagrange_1o_Caso(X, Y, k, d1)

    printf("\n>> Lagrange - 2o Caso:")
    Lagrange_2o_Caso(X, Y, k, d1)

    printf("\n>> Lagrange - 3o Caso:")
    Lagrange_3o_Caso(X, Y, k, d1)

    printf("\n***** FIM DIFERENCIAÇÃO NUMÉRICA *****\n")
endfunction

// Exercício 4

X = [1.6, 1.8, 2.0, 2.2, 2.4]
Y = [3.245,3.584,3.953,4.357,4.799]
k = find(X==2.0)

// Derivadas exatas
d1 = 1.359140
d2 = 0.679570
d3 = 0.339785
d4 = 0.169892

diferenciacao_numerica_completa(X, Y, k, d1, d2, d3, d4)