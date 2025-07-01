function Progressiva_1a_Ordem(X, Y, derivada_1a_exata, derivada_2a_exata)
    h = abs(X(k+1) - X(k))
    derivada_numerica = (Y(k+1) - Y(k)) / h
    
    printf("\n   Cálculo da derivada de 1a ordem em x = %g pela fórmula Progressiva de 1a Ordem:\n", X(k))
    printf("   Aproximação: (f(xk+1) - f(xk)) / h\n")
    printf("   Computando: (%f - %f) / %f\n", Y(k+1), Y(k), h)
    printf("   Resultado: %f\n", derivada_numerica)
    
    Imprimir_Erro(derivada_1a_exata, derivada_numerica)
    Erro_Truncamento_P(h, derivada_2a_exata)
endfunction
