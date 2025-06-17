clear(); clc(); clf();

printf("\n** INTERPOLAÇÃO PELO MÉTODO DE LAGRANGE - Ver. MODULARIZADA **\n")

exec("lagrange_poly.sce", -1)
exec("avaliar_polinomio.sce", -1)
exec("plotar_interpolador.sce", -1)

X = [0,1,2,3]
Y = [1,6,5,-8]
n = length(X)
grau_polinomio = n-1

printf("\n[1] TABELA DE DADOS:\n")
for i = 1:n
    printf("   x = %.6f; f(x) = %.6f\n", X(i), Y(i))
end

printf("\n[2] POLINÔMIOS DE BASE DE LAGRANGE:\n")
[PolLagrange, CoefLagrange] = lagrange_poly(X, Y)
for i = 1:n
    pol_str = pol2str(CoefLagrange(i))
    printf("   L_%d(x) = %s\n", i-1, pol_str)
end

printf("\n[3] POLINÔMIO INTERPOLADOR POR LAGRANGE:")
disp(PolLagrange)

ponto = 3.0
valor_real = -8
[valor_aprox, erro_percentual] = avaliar_polinomio(PolLagrange, ponto, valor_real)

printf("\n[4] VALOR APROXIMADO: p(%.2f) = %.6f\n", ponto, valor_aprox)
printf("\n[5] ERRO PERCENTUAL: %.3f%%\n", erro_percentual)

plotar_interpolador(X, Y, PolLagrange)

printf("\n******** FIM DE INTERPOLAÇÃO POR LAGRANGE ********\n")
