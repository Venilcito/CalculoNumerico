clear(); clc(); clf()

printf("\n** INTERPOLAÇÃO POR SISTEMA DE EQUAÇÕES - Ver. MODULARIZADA **\n")

exec("gauss.sce", -1)
exec("vander_matrix.sce", -1)
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

Vander = vander_matrix(X)

printf("\n[2] MATRIZ DE VANDERMONDE:")
disp(Vander)
COEF = gauss(Vander, Y)

printf("\n[3] COEFICIENTES DO POLINÔMIO:\n")
coef_labels = ['a0', 'a1', 'a2', 'a3', 'a4', 'a5']
for i = 1:n
	mprintf("   %s = %.6f\n", coef_labels(i), COEF(i))
end

Pol = poly(COEF, 'x', 'c')

printf("\n[4] POLINÔMIO INTERPOLADOR:\n")
disp(Pol)
ponto = -3.0
valor_real = -9
[valor_aprox, erro_percentual] = avaliar_polinomio(Pol, ponto, valor_real)

printf("\n[5] VALOR APROXIMADO: p(%.2f) = %.6f\n", ponto, valor_aprox)
printf("\n[6] ERRO PERCENTUAL: %.3f%%\n", erro_percentual)

plotar_interpolador(X, Y, COEF)
printf("\n***** FIM DE INTERPOLAÇÃO POR SISTEMA DE EQUAÇÕES *****\n")