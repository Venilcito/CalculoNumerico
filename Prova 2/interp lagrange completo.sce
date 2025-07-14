clear(); clc(); clf();

printf("\n** INTERPOLAÇÃO PELO MÉTODO DE LAGRANGE - Ver. MODULARIZADA **\n")

//exec("lagrange_poly.sce", -1)
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
//exec("avaliar_polinomio.sce", -1)
function [valor_aprox, erro_percentual] = avaliar_polinomio(POL, ponto, valor_real)
    valor_aprox = horner(POL, ponto)
    
    if argn(2) == 3 then
        erro_percentual = abs((valor_aprox - valor_real) / valor_real) * 100
    else
        erro_percentual = %nan;
    end
endfunction
//exec("plotar_interpolador.sce", -1)
function plotar_interpolador(X, Y, COEF, PONTOS)
    if typeof(COEF) == "polynomial" then
        COEF = coeff(COEF)
    end

    Pol = poly(COEF, 'x', 'c')

    // Curva de interpolação
    xx = linspace(X(1), X($), 300)
    yy = horner(Pol, xx)

    // Avaliar o polinômio nos pontos desejados
    yp = horner(Pol, PONTOS)

    // Título do gráfico
    titulo = "Polinômio Interpolador: p_n(x) = " + pol2str(Pol)

    // Gráfico
    clf()
    plot(X, Y, 'ro')                  // Pontos dados
    plot(xx, yy, 'b', 'LineWidth', 2) // Curva do polinômio
    plot(PONTOS, yp, 'mo.')            // Pontos interpolados (marcados com 'x' verde)
    h.mark_style = 9;                    // círculo preenchido
    h.mark_size = 8;                     // tamanho grande
    h.mark_foreground = color("magenta");
    h.mark_background = color("magenta");
    

    // Eixos e grade
    xgrid()
    xtitle(titulo, "x", "f(x)")

    // Legenda
    legend(["Pontos dados", "Polinômio interpolador", "Pontos estimados"])

    // Ajuste de fontes
    a = gca()
    a.title.font_size = 4
    a.x_label.font_size = 4
    a.y_label.font_size = 4
endfunction

function interpolacao_por_lagrange(X, Y, PONTOS)
    n = length(X);
    grau_polinomio = n - 1;

    printf("\n[1] TABELA DE DADOS:\n");
    for i = 1:n
        printf("   x = %.6f; f(x) = %.6f\n", X(i), Y(i));
    end

    printf("\n[2] POLINÔMIOS DE BASE DE LAGRANGE:\n");
    [PolLagrange, CoefLagrange] = lagrange_poly(X, Y);
    for i = 1:n
        pol_str = pol2str(CoefLagrange(i));
        printf("   L_%d(x) = %s\n", i-1, pol_str);
    end

    printf("\n[3] POLINÔMIO INTERPOLADOR POR LAGRANGE:\n");
    disp(PolLagrange);

    // Avaliação dos pontos fornecidos
    for i = 1:length(PONTOS)
        ponto = PONTOS(i);
        valor_real = horner(PolLagrange, ponto); // ou fornecido manualmente
        [valor_aprox, erro_percentual] = avaliar_polinomio(PolLagrange, ponto, valor_real);

        printf("\n[4] VALOR APROXIMADO: p(%.2f) = %.6f\n", ponto, valor_aprox);
        printf("[5] ERRO PERCENTUAL: %.3f%%\n", erro_percentual);
    end

    plotar_interpolador(X, Y, PolLagrange, PONTOS);
    printf("\n******** FIM DE INTERPOLAÇÃO POR LAGRANGE ********\n");
endfunction

// Exercício 3
// Tempo de compressão de arquivos com 3 e 6 núcleos
X = [1,2,4,8]
Y = [240,125,70,42]
PONTOS = [3,6]
interpolacao_por_lagrange(X, Y, PONTOS)