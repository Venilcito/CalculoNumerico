//https://www.wolframalpha.com/widgets/view.jsp?id=9951be8e8e72897baea23b49e96829d9

clear(); clc()
printf("\n***** INTEGRAÇÃO NUMÉRICA - MÓDULO COMPLETO *****\n")

exec("01-trapezio_dados.sce", -1)
exec("02-simpson_1_3_dados.sce", -1)
exec("03-simpson_3_8_dados.sce", -1)
exec("04-trapezio_funcao.sce", -1)

X = [0, 2, 4, 6]
Y = [1, 9, -65, 217]

integral_exata = 37.5

printf("\n>> Método do Trapézio Generalizado (dados tabulados):")
Trapezio_Dados(X, Y, integral_exata)

printf("\n>> Método de Simpson 1/3 Generalizado (dados tabulados):")
Simpson_1_3_Dados(X, Y, integral_exata)

printf("\n>> Método de Simpson 3/8 Generalizado (dados tabulados):")
Simpson_3_8_Dados(X, Y, integral_exata)

printf("\n>> Método do Trapézio Generalizado (função dada ou calculada):")
deff('y=f(x)', 'y = 1 + 97.5*x - 65*x^2 + 9.125*x^3')
x0 = 0.0
xn = 6.0
n = 1000
Trapezio_Funcao(f, x0, xn, n, integral_exata)

printf("\n***** FIM INTEGRAÇÃO NUMÉRICA *****\n")