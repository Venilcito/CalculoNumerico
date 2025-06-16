function plotar_interpolador(X, Y, COEF)
    if typeof(COEF) == "polynomial" then
        COEF = coeff(COEF)
    end

    Pol = poly(COEF, 'x', 'c')

    xx = linspace(X(1), X($), 300)
    yy = horner(Pol, xx)

    titulo = "Polinômio Interpolador: p_n(x) = " + pol2str(Pol)

    clf()
    plot(X, Y, 'ro', xx, yy, 'b', 'LineWidth', 3)
    xgrid()
    xtitle(titulo, "x", "f(x)")

    a = gca()
    a.title.font_size = 4
    a.x_label.font_size = 4
    a.y_label.font_size = 4
endfunction