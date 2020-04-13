function [p_e_mean_arr, errors_dec, c_mes_control, tries] = simulation(m, snr_val, p, N)
    addit_zeros = 3;
    mes = gen_mes(m);
    c_mes = crc(mes, p);
    c_mes_control = c_mes;
    
    div_mes = divide_mes(c_mes);
    
    r = ceil(log2(log2(size(div_mes, 2)) + size(div_mes, 2) + 1));
    [h, g] = hammgen(r);    
    h_mes = hamming_coder_adv(div_mes, g);
    
    hwz_mes = delete_zeros_adv(h_mes, addit_zeros);
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
        num_of_res = 0;
        for j = 1:N
            if flag_of_change || (num_of_res >= 30)
                number_of_mes = round(rand * (size(c_mes, 1) - 1)) + 1;
            else
                num_of_res = num_of_res + 1;
            end
            
            num_of_conv_mes = number_of_mes + 2 * (number_of_mes - 1);
            for i = 1:3
            n_mes(i, :) = noise(hwz_mes(num_of_conv_mes + i - 1, :), snr);
            end

            n_mes = double(n_mes < 0);
            
            h_mes = add_zeros_adv(n_mes, addit_zeros);
            d_mes = hamming_decoder_adv(h_mes, h);
            u_mes = unite_mes_adv(d_mes, r); 
            [result, p_e] = check(u_mes, p, mes(number_of_mes, :), ...
                                  c_mes_control(number_of_mes, :));
            
            if result == 0
                flag_of_change = false;
            elseif result == 2
                flag_of_change = true;
                num_of_res = 0;
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
