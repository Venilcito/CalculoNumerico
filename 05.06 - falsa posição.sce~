clear(); clc();

printf("*** APROXIMAÇÃO PELO MÉTODO DA FALSA POSIÇÃO ***\n\n")

deff('y=f(x)','y=x^3-9*x+3')
ak = 0.0
bk = 1.0

epsilon1 = 1e-05
epsilon2 = 1e-05
k = 0
nMax = 100
xk = (ak*f(bk)-bk*f(ak))/(f(bk)-f(ak))

printf(" k  |     xk     | abs(xb-xa) |    f(xk)   |\n")

while (k < nMax) & (abs(bk-ak) > epsilon1) & (abs(f(xk)) > epsilon2)
    xk = (ak*f(bk)-bk*f(ak))/(f(bk)-f(ak))
    k = k + 1
    printf(" %2.2i | %10.6f | %10.6f | %10.6f |\n", k, xk, abs(bk-ak), f(xk))
    
    if f(ak) * f(xk) < 0 then
        bk = xk
    else
        ak = xk
    end
end

printf("\nAprox. ""%8.6f"" à raiz, com ""%2.2i"" iterações", xk, k)
