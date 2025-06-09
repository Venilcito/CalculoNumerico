clear();clc();

function gerarGrafico(minha_func, x0, x1, a, b, raiz_aprox, func_expr)
   
    //Geração dos pontos do gráfico completo
    x_total = linspace(x0, x1, 1000);
    y_total = minha_func(x_total);

    //Intervalo destacado
    x_destacado = linspace(a, b, 300);
    y_destacado = minha_func(x_destacado);

    //Plotagem iniciada
    clf();
    plot(x_total, y_total, "b-", "LineWidth", 2); // Função em azul
    xgrid();

    //Título perfumado
    titulo = "f(x) = " + func_expr + " com intervalo [" + string(a) + "; " + string(b) + "] destacado";
    xtitle(titulo, "x", "f(x)");

    //Intervalo destacado
    plot(x_destacado, y_destacado, "r-", "LineWidth", 3); // Intervalo em vermelho

    //Marcando raiz apoximada
    plot(raiz_aprox, minha_func(raiz_aprox), "ko", "MarkerSize", 8, "MarkerFaceColor", "k"); // pequeno círculo preto, não preenchido

    //linha horizontal y = 0
    plot(x_total, zeros(x_total), "k--");
endfunction

//printf("EXERCÍCIO 01\n");
//deff('y=f(x)', 'y=162.5*x^3 - 243.75*x^2 + 130*x - 43.75')
//gerarGrafico(f, 0, 1, 0.75, 1, 0.958381, "162.5x^3 - 243.75x^2 + 130x - 43.75")

//printf("EXERCÍCIO 02\n");
//deff('y=f(x)', 'y=4*x^3 - 30*x^2 + 85*x - 160')
//gerarGrafico(f, -5, 5, 2.5, 5, 4.811275, "4x^3 - 30x^2 + 85x - 160")

//printf("EXERCÍCIO 03\n")
//deff('y=f(x)', 'y=25*x^2 + log(x) - 1.5')
//gerarGrafico(f, 0.2, 0.6, 0.3, 0.4, 0,324135, "25x^2 + log(x) - 1.5")
