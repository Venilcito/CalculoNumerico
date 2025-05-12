clear (); clc(); clf();

printf("\n **** MÉTODO GRÁFICO PARA ISOLAR AS RAÍZES DA FUNÇÃO ***** \n")
printf("\n ************* EXEMPLO COM A FUNÇÃO PADRÃO *************** \n")

x = -4:0.1:4
y = x^3-9*x+3

plot2d(x, y)
xtitle("Gráfico de f(x)=x^3-9x+3",...
       "Valores do domínio [-4;4]",...
       "Valores da função f")
xgrid()
