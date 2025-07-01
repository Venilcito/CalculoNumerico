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
