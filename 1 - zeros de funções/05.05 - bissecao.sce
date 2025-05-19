clear(); clc(); clf();

printf("*** APROXIMAÇÃO PELO MÉTODO DA BISSECÇÃO ***\n\n")

deff('y = f(x)','y = x^3-9*x+3')
ak = 0.0
bk = 1.0

epsilon1 = 1e-05
epsilon2 = 1e-05
k = 0
nMax = 100
xm = 0.5*(ak+bk)

printf(" k  |     xm     | abs(bk-ak) |   f(xm)    |\n")

while (k < nMax) & (abs(bk-ak) > epsilon1) & (abs(f(xm)) > epsilon2)
    xm = 0.5*(ak+bk)
    k = k+1
    printf(" %2.2i | %10.6f | %10.6f | %10.6f |\n", k, xm, abs(bk-ak), f(xm))
    
    if f(ak) * f(xm) < 0 then
        bk = xm
    else
        ak = xm
    end
end

printf("\nAprox. ""%8.6f"" à raiz, com ""%2.2i"" iterações", xm, k)
