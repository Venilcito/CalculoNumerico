function Trapezio_Dados(X, Y, integral_exata)
    num_pontos = length(X)
    h = X(2) - X(1)

    printf("\n   Intervalo de %g a %g com %d pontos igualmente espaçados\n", X(1), X(num_pontos), num_pontos)
    printf("   Fórmula: I ~ (h/2) * [f(x0) + 2*Σ f(xk) + f(xn)]\n")
    
    somatorio = sum(Y(2:num_pontos-1))
    integral_numerica = (h/2) * (Y(1) + 2*somatorio + Y(num_pontos))
    printf("   h = %f\n", h)
    printf("   Integral aproximada: %f\n", integral_numerica)

    erro_percentual = abs((integral_exata - integral_numerica) / integral_exata) * 100
    printf("   Erro relativo percentual: %.6f %%\n", erro_percentual)
endfunction