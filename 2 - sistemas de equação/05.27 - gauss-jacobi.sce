clear(); clc()

printf("*** MÉTODO ITERATIVO: GAUSS-JACOBI (REORDENAÇÃO GULOSA) ***\n")

A = [0.1, 0.2, 1.0, 0.3;
     0.3, 2.0, -0.3, -0.9;
     4.0, 2.0, -0.3, 0.8;
     0.6, 3.2, -1.8, 0.4]
B = [4.0; 7.5; 4.4; 10.0]

n = size(A,1)
Nmax = 100
epsilon = 1.0e-6
X0 = zeros(n,1)
X = X0
A_original = A
B_original = B

printf("\n Matriz A original:")
disp(A_original)
printf("\n Vetor B original:")
disp(B_original)

function [A_greedy, B_greedy, sucesso, ordem] = reordenar_greedy(A, B)
    n = size(A,1)
    usados = zeros(n,1)
    ordem = zeros(n,1)
    sucesso = %T
    
    for j = 1:n
        maior = -%inf
        linha_melhor = -1
        for i = 1:n
            if usados(i) == 0 then
                if abs(A(i,j)) > maior then
                    maior = abs(A(i,j))
                    linha_melhor = i
                end
            end
        end
        if linha_melhor == -1 then
            sucesso = %F
            A_greedy = A
            B_greedy = B
            return
        end
        ordem(j) = linha_melhor
        usados(linha_melhor) = 1
    end
    
    A_greedy = A(ordem, :)
    B_greedy = B(ordem)
endfunction

[A, B, sucesso, ordem_linhas] = reordenar_greedy(A,B)

if sucesso then
    printf("\n Reordenação Gulosa aplicada com sucesso.\n")
    printf(" Ordem das linhas escolhida:")
    disp(ordem_linhas')
    
    printf("\n Matriz A após reordenação:")
    disp(A)
    printf("\n Vetor B após ordenação:")
    disp(B)
else
    error(" Não foi possível aplicar a reordenação gulosa.")
end

for k = 1:Nmax
    for i = 1:n
        S = 0
        for j = 1:n
            if i <> j then
                S = S + A(i,j) * X0(j)
            end
        end
        X(i) = (B(i) - S) / A(i,i)
    end
    erro = max(abs(X-X0))
    if erro < epsilon then
        break
    end
    X0 = X
end

printf("\n Número de iterações: %d\n", k)
printf("\n Vetor solução aproximada:\n")
mprintf(" x(%d) = %.6f\n", [(1:n)', X])

printf("\n Verificação dos resultados (A*X ≈ B):\n")
for i = i:n
    s = 0
    for j = 1:n
        s = s + A(i,j) * X(j)
        if j < n then
            printf(" (%.1f*%.6f) +", A(i,j), X(j))
        else
            printf(" (%.1f*%.6f) = ", A(i,j), X(j))
            printf("%.6f\n", s)
        end
    end
end

printf("\n***** ENCERRAMENTO DO GAUSS-JACOBI COM MÉTODO GULOSO *****\n")
