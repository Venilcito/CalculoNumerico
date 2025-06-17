function [PolLagrange, CoefLagrange] = lagrange_poly(X, Y)
    n = length(X)
    x = poly(0, "X")
    PolLagrange = 0
    CoefLagrange = list()

    for i = 1:n
        Li = 1
        for j = 1:n
            if j <> i then
                Li = Li * (x - X(j)) / (X(i) - X(j))
            end
        end
        CoefLagrange(i) = Li
        PolLagrange = PolLagrange + Li * Y(i)
    end
endfunction