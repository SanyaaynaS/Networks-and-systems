function [h_mes] = hamming_coder_adv(d_mes, g)
    h_mes = mod(d_mes * g, 2);
end