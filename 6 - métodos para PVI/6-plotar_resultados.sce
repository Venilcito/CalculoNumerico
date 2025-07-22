function plotar_resultado_aproximado(X, Y, pontos_destacados, titulo, rotulo_x, rotulo_y)
    x_min = min(X); x_max = max(X)
    delta = 0.05 * (x_max - x_min)
    xx = linspace(x_min - delta, x_max + delta, 300)
    yy = interp1(X, Y, xx, "linear")

    if argn(2) >= 3 & ~isempty(pontos_destacados) then
        yy_dest = interp1(X, Y, pontos_destacados, "linear")
        destacar = %T
    else
        destacar = %F
    end

    clf()
    if destacar then
        plot(X, Y, 'ro', xx, yy, 'b', pontos_destacados, yy_dest, 'rs', 'LineWidth', 3.5)
        legend(["Aproximações", "Visualização contínua", "Pontos destacados"], "in_upper_left")
    else
        plot(X, Y, 'ro', xx, yy, 'b', 'LineWidth', 3.5)
        legend(["Aproximações", "Visualização contínua"], "in_upper_left")
    end

    xtitle(titulo, rotulo_x, rotulo_y)

    xgrid(1)
    a = gca()
    a.title.font_size = 4.5
    a.x_label.font_size = 4.5
    a.y_label.font_size = 4.5
endfunction