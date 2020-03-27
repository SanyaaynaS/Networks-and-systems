function [p_e_mean_arr, errors_dec, c_mes_control] = simulation(m, snr_val, p, N)
    mes = gen_mes(m);
    c_mes = crc(mes, p);
    c_mes_control = c_mes;

    c_mes = c_mes * (-2) + 1;

    p_e_mean_arr = zeros(1, length(snr_val));
    errors_dec = zeros(1, length(snr_val));

    i = 1;
    for snr = snr_val
        p_err = 0;
        res = 0;
        for j = 1:N
            number_of_mes = round(rand * (size(c_mes, 1) - 1)) + 1;
            n_mes = noise(c_mes(number_of_mes, :), snr);
            n_mes = n_mes < 0;
            [result, p_e] = check(n_mes, p, mes(number_of_mes, :), ...
                                  c_mes_control(number_of_mes, :));
            
            p_err = p_err + p_e;
            res = res + result;
        end
        p_e_mean_arr(i) = p_err / N;
        errors_dec(i) = res / N;
        i = i + 1;
    end
end