function coef = dif_divididas(X, Y)
    n = length(X)
    coef = Y

    for j = 2:n
        for i = n:-1:j
            coef(i) = (coef(i) - coef(i-1)) / (X(i) - X(i-j+1))
        end
    end
endfunction