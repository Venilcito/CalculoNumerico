clear(); clc()

printf("\n***** MÉTODO DIRETO: FATORAÇÃO LU por CROUT *****\n\n")

A_original = [3, 2, 4; 1, 1, 2; 4, 3, -2]
B_original = [1; 2; 3]

printf("Entrada - Matriz A (original):")
disp(A_original)

printf("\nEntrada - Vetor B (original):")
disp(B_original)

A_copia = A_original
n = length(B_original)

L = zeros(n,n)
U = zeros(n,n)

for i = 1:n
    L(i,i) = 1
end

j = 1
if A_copia(j,j) == 0 then
    error("Pivô nulo encontrado. Método sem pivoteamento falha")
end
for i = 1:n
    if i <= j then
        U(i,j) = A_copia(i,j)
    else
        L(i,j) = A_copia(i,j) / U(j,j)
    end
end

for i = 1:n
    for j = 2:n
        SumLU = 0
        for k = 1:j-1
            SumLU = SumLU + L(i,k) * U(k,j)
        end
        if i <= j then
            U(i,j) = A_copia(i,j) - SumLU
        else
            if U(j,j) == 0 then
                error("Pivô nulo encontrado durante a decomposição")
            end
            L(i,j) = (A_copia(i,j) - SumLU) / U(j,j)
        end
    end
end

Y = zeros(n,1)
Y(1) = B_original(1)

for i = 2:n
    SumLY = 0
    for j = 1:i-1
        SumLY = SumLY + L(i,j) * Y(j)
    end
    Y(i) = B_original(i) - SumLY
end

printf("\nSolução Y (LY = B):")
disp(Y)

X = zeros(n,1)
X(n) = Y(n) / U(n,n)

for i = n-1:-1:1
    SumUX = 0
    for j = i+1:n
        SumUX = SumUX + U(i,j) * X(j)
    end
    X(i) = (Y(i) - SumUX) / U(i,i)
end

printf("\nSolução X (UX = Y):\n")
mprintf(" x(%d) = %.6f\n", [(1:n)', X])

printf("\nVerificação dos resultados (AX = B):\n")

for i = 1:n
    s = 0
    for j = 1:n
        s = s + A_original(i,j) * X(j)
        if j < n then
            printf("(%d*%.6f) + ", A_original(i,j), X(j))
        else
            printf("(%d*%.6f) = ", A_original(i,j), X(j))
            printf("%.6f\n", s)
        end
    end
end

printf("\nErro absoluto (AX - B):")
erro = A_original * X - B_original
disp(erro)

printf("\n ********** FATORAÇÃO LU FINALIZADA **********\n")
