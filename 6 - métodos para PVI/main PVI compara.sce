clear(); clc()

exec("1-euler_1aOr.sce", -1)
exec("2-euler_1aMOD.sce", -1)
exec("3-taylor_2aOr.sce", -1)
exec("4-RK3_3aOr.sce", -1)
exec("5-RK4_4aOr.sce", -1)
exec("6-plotar_resultados.sce", -1)

// PROBLEMA 1 DO TRABALHO!!!!!
//a = 0.0; b = 1.0
//x0 = a; y0 = 50
//k = 1.5; Tmax = 200
//h = 0.2

// PROBLEMA 2 DO TRABALHO!!!!!
//a = 0.0; b = 5.0
//x0 = a; y0 = 20
//h = 0.2

// PROBLEMA 3 DO TRABALHO!!!!!
//a = 0.0; b = 3.0
//x0 = a; y0 = 0
//h = 0.2

// PROBLEMA 4 DO TRABALHO!!!!!
//a = 0.0; b = 10.0
//x0 = a; y0 = 80
//h = 0.2

// PROBLEMA 5 DO TRABALHO!!!!!


n = int((b - a) / h)

function dy = f(x,y)
    //dy = x - 2*y
    //dy = k*(Tmax - y)                    // PROBLEMA 1
    //dy = (50 - y) / 10                   // PROBLEMA 2
    //dy = (5 - y) / 2                     // PROBLEMA 3
    //dy = -0.1*(y - 20)                   // PROBLEMA 4
endfunction

function d2y = df(x,y)
    //d2y = 1 - 2*x + 4*y
    //d2y = -k^2*(Tmax - y)                // PROBLEMA 1
    //d2y = -(1/10) * ((50-y)/10)          // PROBLEMA 2
    //d2y = -(1/2) * ((5-y)/2)             // PROBLEMA 3
    //d2y = -0.1 * (-0.1*(y-20))           // PROBLEMA 4
endfunction

function yex = y_exata(x)
    //yex = x/2 - 1/4 + 5/4*exp(-2*x)
    //yex = Tmax - (Tmax - y0)*exp(-k*x)   // PROBLEMA 1
    //yex = 50 - 30*exp(-x/10)             // PROBLEMA 2
    //yex = 5 - 5*exp(-x/2)                // PROBLEMA 3
    //yex = 20 + 60*exp(-0.1*x)            // PROBLEMA 4
endfunction

[x1, y1] = euler_1a_ordem(f, x0, y0, h, n)
[x2, y2] = euler_modificado(f, x0, y0, h, n)
[x3, y3] = taylor_2a_ordem(f, df, x0, y0, h, n)
[x4, y4] = rk3_3a_ordem(f, x0, y0, h, n)
[x5, y5] = rk4_4a_ordem(f, x0, y0, h, n)

yex = y_exata(x1)

printf("\n================ ERROS FINAIS EM y(x0) ================\n")
mprintf("Metodo                     y(x0)      Erro relativo (%%)\n")
mprintf("-------------------------------------------------------\n")
mprintf("Euler 1a Ordem           %9.6f      %10.6f\n", y1($), 100 * abs((y1($) - yex($)) / yex($)))
mprintf("Euler Modificado         %9.6f      %10.6f\n", y2($), 100 * abs((y2($) - yex($)) / yex($)))
mprintf("Taylor 2a Ordem          %9.6f      %10.6f\n", y3($), 100 * abs((y3($) - yex($)) / yex($)))
mprintf("Runge-Kutta 3a Ordem     %9.6f      %10.6f\n", y4($), 100 * abs((y4($) - yex($)) / yex($)))
mprintf("Runge_Kutta 4a Ordem     %9.6f      %10.6f\n", y5($), 100 * abs((y5($) - yex($)) / yex($)))
mprintf("-------------------------------------------------------\n")
mprintf("Solução Exata            %9.6f", yex($))
printf("\n=======================================================\n\n")

clf()
plot(x1, y1, 'r-o', x2, y2, 'g-x', x3, y3, 'm-+', x4, y4, 'c-s', x5, y5, 'b-*', x1, yex, 'k--')
xgrid(1)
xtitle("Comparação de Métodos para o PVI: [MIOTTINI]", "x", "Solução y(x)")
legend(["Euler 1a Ordem", "Euler Modificado", "Taylor 2a Ordem", "Runge-Kutta 3a Ordem", "Runge-Kutta 4a Ordem", "Solução Exata"], "in_upper_left")

// Um oferecimento Castamann Códigos™
// Ao usar este código, o usuário concorda com os termos e condições e pode ceder nota de trabalhos e provas para o Vinicius Castamann