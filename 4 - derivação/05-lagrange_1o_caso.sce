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