clear(); clc(); clf()
printf("\n***** AJUSTE POLINOMIAL - MOM - Ver. MONOLÍTICA *****\n")

X = [0.2, 0.3, 0.6, 0.9, 1.1, 1.3, 1.4, 1.6]
Y = [0.050446, 0.098426, 0.332770, 0.726600, 1.097200, 1.569700, 1.848700, 2.501502]
ordem = 2

n = length(X)
printf("\n[1] TABELA DE DADOS:\n")
for i = 1:n
    printf("   x = %.6f   y(x) = %.6f\n", X(i), Y(i))
end

printf("\n[2] MATRIZ DO SISTEMA NORMAL (A):")
grau = ordem + 1
A = zeros(grau, grau)
B = zeros(grau, 1)

for i = 1:grau
    for j = 1:grau
        for k = 1:n
            A(i,j) = A(i,j) + X(k)^(i-1 + j-1)
        end
    end
end
disp(A)

printf("\n[3] VETOR DOS TERMOS INDEPENDENTES (B):")
for i = 1:grau
    for k = 1:n
        B(i) = B(i) + X(k)^(i-1) * Y(k)
    end
end
disp(B)

printf("\n[4] COEFICIENTES DO POLINÔMIO DE AJUSTE:\n")
M = A \ B
for i = 1:grau
    printf("   a_%d - %.6f\n", i-1, M(i))
end

printf("\n[5] POLINÔMIO DE AJUSTE:")
Pol_ajuste = poly(M, 'x', 'c')
disp(Pol_ajuste)

Ybar = mean(Y)
SSR = 0
SST = 0

for i = 1:n
    ajuste = horner(Pol_ajuste, X(i))
    SSR = SSR + (Y(i) - ajuste)^2
    SST = SST + (Y(i) - Ybar)^2
end
R2 = 1 - SSR/SST

printf("\n[6] SOMA DOS QUADRADOS DOS RESÍDUOS (SSR): %.6f\n", SSR)
printf("\n[7] COEFICIENTES DE DETERMINAÇÃO R^2: %.6f\n", R2)

xx = linspace(min(X), max(X), 300)
yy = horner(Pol_ajuste, xx)

plot(X, Y, 'ro', xx, yy, 'b', 'LineWidth', 3)
xgrid()
xtitle("Ajuste Polinomial por MOM", "x", "y(x)")
legend(["Dados observados", "Curva ajustada"], 2)

printf("\n******** FIM DO AJUSTE POLINOMIAL POR MOM ********\n")
