clear(); clc(); clf();

printf("\n** INTERPOLAÇÃO PELO MÉTODO DE NEWTON - Ver. MODULARIZADA **\n")

exec("dif_divididas.sce", -1)
exec("newton_poly.sce", -1)
exec("avaliar_polinomio.sce", -1)
exec("plotar_interpolador.sce", -1)

X = [0,1,2,3]
Y = [1,6,5,-8]
n = length(X)

printf("\n[1] TABELA DE DADOS:\n")
for i = 1:n
    printf("   x = %.6f; f(x) = %.6f\n", X(i), Y(i))
end

printf("\n[2] COEFICIENTES DAS DIFERENÇAS DIVIDIDAS:\n")
coef = dif_divididas(X, Y)
for i = 1:n
    printf("   a_%d = %.6f\n", i-1, coef(i))
end

PolNewton = newton_poly(X, coef)
printf("\n[3] CONSTRUÇÃO DO POLINÔMIO DE NEWTON:\n")
disp(PolNewton)

ponto = 3.0
valor_real = -8
[valor_aprox, erro_percentual] = avaliar_polinomio(PolNewton, ponto, valor_real)

printf("\n[4] VALOR APROXIMADO: p(%.2f) = %.6f\n", ponto, valor_aprox)
printf("\n[5] ERRO PERCENTUAL: %.3f%%\n", erro_percentual)

plotar_interpolador(X, Y, PolNewton)

printf("\n******** FIM DE INTERPOLAÇÃO POR NEWTON ********\n")