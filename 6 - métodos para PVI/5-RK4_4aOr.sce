function [x, y] = rk4_4a_ordem(f, x0, y0, h, n)
    x = zeros(1, n+1)
    y = zeros(1, n+1)
    x(1) = x0
    y(1) = y0

    for i = 1:n
        xi = x(i)
        yi = y(i)

        k1 = h * f(xi, yi)
        k2 = h * f(xi + 0.5*h, yi + 0.5*k1)
        k3 = h * f(xi + 0.5*h, yi + 0.5*k2)
        k4 = h * f(xi + h, yi + k3)

        x(i+1) = x(i) + h
        y(i+1) = y(i) + (1/6)*(k1 + 2*k2 + 2*k3 + k4)
    end
endfunction

/* TESTE COM EXEMPLO
function dy = f(x, y)
    dy = x - 2*y
endfunction

a = 0.0; b = 0.5
x0 = a; y0 = 1.0
h = 0.1
n = int((b - a) / h)

[x, y] = rk4_4a_ordem(f, x0, y0, h, n)

printf("\n")
printf("============================================================\n")
printf("   MÉTODO DE RUNGE-KUTTA 4ª ORDEM - APROXIMAÇÕES NUMÉRICAS\n")
printf("============================================================\n")
printf("            i              x(i)              y(i)\n")
printf("------------------------------------------------------------\n")
for i = 1:(n+1)
    mprintf("          %3d          %9.4f          %9.6f\n", i-1, x(i), y(i))
end
printf("------------------------------------------------------------\n")
printf("  Aproximação final: y(%.1f) ≈ %.6f\n", x($), y($))
printf("============================================================\n")

exec("6-plotar_resultados.sce", -1)
plotar_resultado_aproximado(x, y, [], "Método de Runge-Kutta 4ª Ordem", "Variável independente", "Solução aproximada y(x)")
*/