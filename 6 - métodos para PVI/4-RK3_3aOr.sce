function [x, y] = rk3_3a_ordem(f, x0, y0, h, n)
    x = zeros(1, n+1)
    y = zeros(1, n+1)
    x(1) = x0
    y(1) = y0

    for i = 1:n
        xi = x(i)
        yi = y(i)

        k1 = h * f(xi, yi)
        k2 = h * f(xi + 0.5*h, yi + 0.5*k1)
        k3 = h * f(xi + 0.75*h, yi + 0.75*k2)

        x(i+1) = x(i) + h
        y(i+1) = y(i) + (2/9)*k1 + (1/3)*k2 + (4/9)*k3
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

[x, y] = rk3_3a_ordem(f, x0, y0, h, n)

printf("\n")
printf("============================================================\n")
printf("   MÉTODO DE RUNGE-KUTTA 3ª ORDEM - APROXIMAÇÕES NUMÉRICAS\n")
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
plotar_resultado_aproximado(x, y, [], "Método de Runge-Kutta 3ª Ordem", "Variável independente", "Solução aproximada y(x)")
*/