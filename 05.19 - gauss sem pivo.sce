clear(); clc()

printf("\n* METODO DIRETO: GAUSS (ELIM. GAUSSIANA) SEM PIVOTEAMENTO *\n\n")

A_original = [3,2,4;
              1,1,2;
              4,3,-2]

B_original = [1; 2; 3]

printf("Entrada - Matris A (original):")
disp(A_original)

printf("\nEntrada - Vetor B (original):")
disp(B_original)

A_copia = A_original
B_copia = B_original

n = length(B_copia)

for k = 1 : n-1
    if A_copia(k,k) == 0 then
        error("Pivô nulo encontrado. Método sem pivoteamento falha")
    end
    for i = k+1 : n
        m = A_copia(i,k) / A_copia(k,k)
        A_copia(i,k) = 0
        for j = k+1 : n
            A_copia(i,j) = A_copia(i,j) - A_copia(k,j)*m
        end
        B_copia(1) = B_copia(i) - B_copia(k)*m
    end
end

X = zeros(n,1)
X(n) = B_copia(n) / A_copia(n,n)

for k = n-1 : -1 : 1
    soma = 0
    for j = k+1 : n
        soma = soma + A_copia(k,j) * X(j)
    end
    X(k) = (B_copia(k) - soma) / A_copia(k,k)
end

printf("\n Solução X do sistema:\n")
for i = 1 : n
    mprintf(" X(%d) = %.6f\n", i, X(i));
end

printf("\n Verificação dos resultados (AX = B):\n")

for i = 1 : n
    s = 0
    for j = 1 : n
        s = s + A_original(i,j) * X(j)
        if j < n then
            printf(" (%d*%.6f) + ", A_original(i,j), X(j))
        else
            printf(" (%d*%.6f) = ", A_original(i,j), X(j))
            printf(" %.6f\n", s)
        end
    end
end

printf("\n Erro absoluto (AX - B):")
erro = A_original * X - B_original
disp(erro)

printf("\n ********** ELIMINAÇÃO GAUSSIANA FINALIZADA **********\n")
