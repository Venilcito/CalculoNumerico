function Trapezio_Funcao(f, x0, xn, n, integral_exata)
    h = (xn - x0) / n
    soma_interna = 0
    for i = 1:(n-1)
        soma_interna = soma_interna + f(x0 + i*h)
    end
    integral_numerica = (h/2) * (f(x0) + 2*soma_interna + f(xn))

    printf("\n   Intervalo de %g a %g com %d subintervalos (n=%d)\n", x0, xn, n+1, n)
    printf("   Integral aproximada: %f\n", integral_numerica)

    erro_percentual = abs((integral_exata - integral_numerica) / integral_exata) * 100
    printf("   Erro relativo percentual: %.6f %%\n", erro_percentual)
endfunction