clear(); clc(); clf();

printf("\n** INTERPOLAÇÃO PELO MÉTODO DE LAGRANGE - Ver. MODULARIZADA **\n")

exec("03-lagrange_poly.sce", -1)
exec("-avaliar_polinomio.sce", -1)
exec("-plotar_interpolador.sce", -1)

// PROBLEMA 1 INTEGRAIS!!!!!
//X = [0,1,2,3,4,5,6]
//Y = [5.04,5.93,12.08,26.01,44.91,70.21,100.87]

// PROBLEMA 2 INTEGRAIS!!!!!
//X = [0,1,2,3,4,5,6]
//Y = [0.01,0.69,1.09,1.40,1.60,1.79,1.95]

// PROBLEMA 3 INTEGRAIS!!!!!
//X = [0,0.1667,0.3333,0.5,0.6667,0.8333,1]
//Y = [0,0.515,0.866,1,0.866,0.515,0.01]

// PROBLEMA 4 INTEGRAIS!!!!!
//X = [0,1,2,3,4,5,6]
//Y = [1,0.49,0.2,0.099,0.06,0.038,0.027]

// PROBLEMA 5 INTEGRAIS!!!!!
// polinômio não consegue inferir função, propor solução usando mais pontos
//X = [0,1,2,3,4,5,6]
//Y = [1,0.44,-0.23,-0.47,-0.24,0.13,0.27]

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

// Um oferecimento Castamann Códigos™
// Ao usar este código, o usuário concorda com os termos e condições e pode ceder nota de trabalhos e provas para o Vinicius Castamann