function [n_mes] = hamming_decoder_adv(n_mes, h)
    s = mod(n_mes * h', 2);
    for i = 1:size(s, 1)
        for j = 1:size(h, 2)
            if sum(xor(s(i, :), h(:, j)')) == 0
                n_mes(i, j) = mod(n_mes(i, j) + 1, 2);
                break
            end
        end
    end
end