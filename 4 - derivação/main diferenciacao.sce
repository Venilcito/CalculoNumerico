clear(); clc();

printf("\n***** DIFERENCIAÇÃO NUMÉRICA - MÓDULO COMPLETO *****\n")

exec("01-progressiva_1a_ordem.sce", -1)
exec("02-regressiva_1a_ordem.sce", -1)
exec("03-centrada_2a_ordem_1aderv.sce", -1)
exec("04-centrada_2a_ordem_2aderv.sce", -1)
exec("05-lagrange_1o_caso.sce", -1)
exec("06-lagrange_2o_caso.sce", -1)
exec("07-lagrange_3o_caso.sce", -1)
exec("08-imprimir_erro.sce", -1)
exec("09-erro_truncamento.sce", -1)

X = [1.8, 1.9, 2.0, 2.1, 2.2]
Y = [10.889365, 12.703199, 14.778112, 17.148957, 19.855030]
k = 3

derivada_1a_exata = 22.167168
derivada_2a_exata = 29.556224
derivada_3a_exata = 36.945270
derivada_4a_exata = 44.334337

printf("\n>> Progressiva de 1a Ordem:")
Progressiva_1a_Ordem(X, Y, derivada_1a_exata, derivada_2a_exata)

printf("\n>> Regressiva de 1a Ordem:")
Regressiva_1a_Ordem(X, Y, k, derivada_1a_exata, derivada_2a_exata)

printf("\n>> Centrada de 2a Ordem (1a derivada):")
Centrada_2a_Ordem_1a(X, Y, k, derivada_1a_exata, derivada_3a_exata)

printf("\n>> Centrada de 2a Ordem (2a derivada):")
Centrada_2a_Ordem_2a(X, Y, k, derivada_2a_exata, derivada_4a_exata)

printf("\n>> Lagrange - 1o Caso:")
Lagrange_1o_Caso(X, Y, k, derivada_1a_exata)

printf("\n>> Lagrange - 2o Caso:")
Lagrange_2o_Caso(X, Y, k, derivada_1a_exata)

printf("\n>> Lagrange - 3o Caso:")
Lagrange_3o_Caso(X, Y, k, derivada_1a_exata)

printf("\n***** FIM DIFERENCIAÇÃO NUMÉRICA *****\n")
