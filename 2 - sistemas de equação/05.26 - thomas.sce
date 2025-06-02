clear(); clc()

printf("*** MÉTODO DIRETO: THOMAS (TDMA) - SISTEMAS TRIDIAGONAIS ***\n");

a = [0; -5; -5; -5]
b = [20; 15; 15; 19]
c = [-5; -5; -5; 0]
d = [1100; 100; 100; 100]

a_original = a
b_original = b
c_original = c
d_original = d

printf("\n Vetor a^T:"); disp(a')
printf("\n Vetor b^T:"); disp(b')
printf("\n Vetor c^T:"); disp(c')
printf("\n Vetor d^T:"); disp(d')

n = length(b)
if b(1) == 0 then
    error("Pivô nulo encontrado na primeira linha. Método falha.")
end

c(1) = c(1) / b(1)
d(1) = d(1) / b(1)

for i = 2:n-1
    temp = b(i) - a(i) * c(i-1)
    if temp == 0 then
        error("Pivô nulo encontrado na linha " + string(i) + ". Método falha.")
    end
    c(i) = c(i) / temp
    d(i) = (d(i) - a(i) * d(i-1)) / temp
end

temp = b(n) - a(n) * c(n-1)
if temp == 0 then
    error("Pivô nulo encontrado na última linha. Método falha.")
end
d(n) = (d(n) - a(n) * d(n-1)) / temp

X = zeros(n,1)
X(n) = d(n)
for i = n-1:-1:1
    X(i) = d(i) - c(i) * X(i+1)
end

printf("\n Solução X do sistema:\n")
mprintf("  x(%d) = %.6f\n", [(1:n)', X])

A = diag(b_original)
for i = 2:n
    A(i, i-1) = a_original(i)
end
for i = 1:n-1
    A(i, i+1) = c_original(i)
end

printf("\n Erro absoluto (A*X - d):")
erro = A * X - d_original
disp(erro)

printf("\n ********** TDMA FINALIZADO **********\n")
