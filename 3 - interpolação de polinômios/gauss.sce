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