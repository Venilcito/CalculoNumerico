function P = newton_poly(X, coef)
    n = length(X)
    x = poly(0, "x")
    P = coef(1)
    px = 1

    for i = 2:n
        px = px * (x - X(i-1))
        P = P + coef(i) * px
    end
endfunction
