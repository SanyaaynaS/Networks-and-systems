function [p_e_mean_arr, errors_dec, c_mes_control, tries] = simulation(m, snr_val, p, N)
    addit_zeros = 3;
    mes = gen_mes(m);
    c_mes = crc(mes, p);
    c_mes_control = c_mes;
    
    div_mes = divide_mes(c_mes);
    h_mes = hamming_coder(div_mes);
    hwz_mes = delete_zeros(h_mes, addit_zeros);
    
    hwz_mes = hwz_mes * (-2) + 1;
    
    p_e_mean_arr = zeros(1, length(snr_val));
    errors_dec = zeros(1, length(snr_val));
    ind = 1;
    tries = zeros(1, length(snr_val));
    n_mes = zeros(3, size(hwz_mes, 2));
    
    for snr = snr_val
        p_err = 0;
        res = 0;
        flag_of_change = true;
        num_of_tries = 0;
        for j = 1:N
            if flag_of_change
                number_of_mes = round(rand * (size(c_mes, 1) - 1)) + 1;
            end
            
            
%                 n_mes(i, :) = noise(hwz_mes(number_of_mes + i - 1, :), snr);
            num_of_conv_mes = number_of_mes + 2 * (number_of_mes - 1);
            for i = 1:3
            n_mes(i, :) = noise(hwz_mes(num_of_conv_mes + i - 1, :), snr);
            end
%             n_mes = hwz_mes(num_of_conv_mes:(num_of_conv_mes + 2), :);

            n_mes = n_mes < 0;
            
            h_mes = add_zeros(n_mes, addit_zeros);
            d_mes = hamming_decoder(h_mes, size(div_mes, 2));
            u_mes = unite_mes(d_mes); 
%             isequal(u_mes, c_mes(number_of_mes, :))
            [result, p_e] = check(u_mes, p, mes(number_of_mes, :), ...
                                  c_mes_control(number_of_mes, :));
            
            if result == 0
                flag_of_change = false;
            elseif result == 2
                flag_of_change = true;
                num_of_tries = num_of_tries + 1;
                result = mod(result, 2);   
            end
            
            p_err = p_err + p_e;
            res = res + result;
        end
        p_e_mean_arr(ind) = p_err / N;
        tries(ind) = num_of_tries;
        errors_dec(ind) = res / N;
        ind = ind + 1;
    end
end