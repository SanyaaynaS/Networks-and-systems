function [n_mes] = hamming_decoder_adv(n_mes, orig_size, h)
s = mod(n_mes * h', 2);
    for i = 1:size(s, 1)
        err_bit = uint8(bin2dec(flip(sprintf('%d',s(i, :)))));
        if err_bit ~= 0
            n_mes(i, err_bit) = mod(n_mes(i, err_bit) + 1, 2);
        end
    end
end