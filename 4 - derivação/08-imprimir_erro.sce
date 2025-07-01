function Imprimir_Erro(derivada_exata, derivada_numerica)
    erro_percentual = abs((derivada_exata - derivada_numerica) / derivada_exata) * 100
    printf("   Erro relativo percentual: |(%f - %f) / %f| * 100%% = %f%%\n", derivada_exata, derivada_numerica, derivada_exata, erro_percentual)
endfunction