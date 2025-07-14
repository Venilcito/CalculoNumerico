clear(); clc(); clf()

printf("\n** INTERPOLAÇÃO POR SISTEMA DE EQUAÇÕES - Ver. MODULARIZADA **\n")

function [COEF] = gauss(mat_vander, vetor_Y)

    n = length(vetor_Y)
    COEF = zeros(n, 1)

    for k = 1:n-1
        for i = k+1:n
            m = mat_vander(i, k) / mat_vander(k, k)
            mat_vander(i, k) = 0
            for j = k+1:n
                mat_vander(i, j) = mat_vander(i, j) - m * mat_vander(k, j)
            end
            vetor_Y(i) = vetor_Y(i) - m * vetor_Y(k)
        end
    end

    for k = n:-1:1
        soma = 0
        for j = k+1:n
            soma = soma + COEF(j) * mat_vander(k, j)
        end
        COEF(k) = (vetor_Y(k) - soma) / mat_vander(k, k)
    end
endfunction

function V = vander_matrix(X)
    n = length(X)
    V = zeros(n, n)

    for i = 1:n
        for j = 1:n
            V(i, j) = X(i)^(j-1)
        end
    end
endfunction

function [valor_aprox, erro_percentual] = avaliar_polinomio(POL, ponto, valor_real)
    valor_aprox = horner(POL, ponto)
    
    if argn(2) == 3 then
        erro_percentual = abs((valor_aprox - valor_real) / valor_real) * 100
    else
        erro_percentual = %nan;
    end
endfunction
        
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
    plot(X, Y, 'ro')                      // Pontos dados
    plot(xx, yy, 'b', 'LineWidth', 2)     // Curva do polinômio
    plot(PONTOS, yp, 'mo.')               // Pontos interpolados (marcados com 'x' verde)
    h.mark_style = 9;                     // círculo preenchido
    h.mark_size = 8;                      // tamanho grande
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

function interpolacao_por_sistema(X, Y, PONTOS)
    n = length(X);
    grau_polinomio = n - 1;

    printf("\n[1] TABELA DE DADOS:\n")
    for i = 1:n
        printf("   x = %.6f; f(x) = %.6f\n", X(i), Y(i))
    end

    Vander = vander_matrix(X);

    printf("\n[2] MATRIZ DE VANDERMONDE:\n")
    disp(Vander)
    COEF = gauss(Vander, Y);

    printf("\n[3] COEFICIENTES DO POLINÔMIO:\n")
    coef_labels = ['a0', 'a1', 'a2', 'a3', 'a4', 'a5'];
    for i = 1:n
        mprintf("   %s = %.6f\n", coef_labels(i), COEF(i))
    end

    Pol = poly(COEF, 'x', 'c');

    printf("\n[4] POLINÔMIO INTERPOLADOR:\n")
    disp(Pol)

    // Avaliação dos pontos fornecidos
    for i = 1:length(PONTOS)
        ponto = PONTOS(i);
        valor_real = horner(Pol, ponto);
        [valor_aprox, erro_percentual] = avaliar_polinomio(Pol, ponto, valor_real);
        printf("\n[5] VALOR APROXIMADO: p(%.2f) = %.6f\n", ponto, valor_aprox);
        printf("[6] ERRO PERCENTUAL: %.3f%%\n", erro_percentual);
    end

    // Gráfico com todos os pontos estimados
    plotar_interpolador(X, Y, COEF, PONTOS);
    printf("\n***** FIM DE INTERPOLAÇÃO POR SISTEMA DE EQUAÇÕES *****\n")
endfunction

// Exercício 1
// Número de falhas nos dias 4 e 8
//X = [1,3,6,10]
//Y = [2.1,5.8,11.9,20.7]
//PONTOS = [4,8]
//interpolacao_por_sistema(X, Y, PONTOS)

// Exercício 3
// Tempo de compressão de arquivos com 3 e 6 núcleos
X = [1,2,4,8]
Y = [240,125,70,42]
PONTOS = [3,6]
interpolacao_por_sistema(X, Y, PONTOS)