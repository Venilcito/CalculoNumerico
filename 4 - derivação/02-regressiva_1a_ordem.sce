function Regressiva_1a_Ordem(X, Y, k, derivada_1a_exata, derivada2a_exata)
    h = abs(X(k) - X(k-1))
    derivada_numerica = (Y(k) - Y(k-1)) / h
    
    printf("\n   Cálculo da derivada de 1a ordem em x = %g pela fórmula Regressiva de 1a Ordem:\n", X(k))
    printf("   Aproximação: (f(xk) - f(xk-1)) / h\n")
    printf("   Computando: (%f - %f) / %f\n", Y(k), Y(k-1), h)
    printf("   Resultado: %f\n", derivada_numerica)
    
    Imprimir_Erro(derivada_1a_exata, derivada_numerica)
    Erro_Truncamento_P(h, derivada_2a_exata)
endfunction
