clear(); clc(); clf();

printf("\n** INTERPOLAÇÃO PELO MÉTODO DE NEWTON - Ver. MODULARIZADA **\n")

//exec("dif_divididas.sce", -1)
function coef = dif_divididas(X, Y)
    n = length(X)
    coef = Y

    for j = 2:n
        for i = n:-1:j
            coef(i) = (coef(i) - coef(i-1)) / (X(i) - X(i-j+1))
        end
    end
endfunction
//exec("newton_poly.sce", -1)
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

function interpolacao_por_newton(X, Y, PONTOS)
    n = length(X);

    printf("\n[1] TABELA DE DADOS:\n")
    for i = 1:n
        printf("   x = %.6f; f(x) = %.6f\n", X(i), Y(i))
    end

    printf("\n[2] COEFICIENTES DAS DIFERENÇAS DIVIDIDAS:\n")
    coef = dif_divididas(X, Y);
    for i = 1:n
        printf("   a_%d = %.6f\n", i-1, coef(i))
    end

    PolNewton = newton_poly(X, coef);
    printf("\n[3] CONSTRUÇÃO DO POLINÔMIO DE NEWTON:\n")
    disp(PolNewton)

    // Avaliar todos os pontos fornecidos
    for i = 1:length(PONTOS)
        ponto = PONTOS(i);
        valor_real = horner(PolNewton, ponto);
        [valor_aprox, erro_percentual] = avaliar_polinomio(PolNewton, ponto, valor_real);
        printf("\n[4] VALOR APROXIMADO: p(%.2f) = %.6f\n", ponto, valor_aprox)
        printf("[5] ERRO PERCENTUAL: %.3f%%\n", erro_percentual)
    end

    plotar_interpolador(X, Y, PolNewton, PONTOS);
    printf("\n******** FIM DE INTERPOLAÇÃO POR NEWTON ********\n")
endfunction

// Exercício 1
// Número de falhas nos dias 4 e 8
//X = [1,3,6,10]
//Y = [2.1,5.8,11.9,20.7]
//PONTOS = [4,8]
//interpolacao_por_newton(X, Y, PONTOS)

// Exercício 3
// Tempo de compressão de arquivos com 3 e 6 núcleos
X = [1,2,4,8]
Y = [240,125,70,42]
PONTOS = [3,6]
interpolacao_por_newton(X, Y, PONTOS)