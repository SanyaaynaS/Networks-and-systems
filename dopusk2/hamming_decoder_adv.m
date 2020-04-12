function [n_mes] = hamming_decoder_adv(n_mes, h, syn_table)
    n_mes(1, 14) = mod(n_mes(1, 14) + 1, 2);
%     n_mes(1, 15) = mod(n_mes(1, 15) + 1, 2);
%     n_mes(1, 7) = mod(n_mes(1, 7) + 1, 2);
%     n_mes(1, 4) = mod(n_mes(1, 4) + 1, 2);
    s = mod(n_mes * h', 2);
    
    for i = 1:size(s, 1)
        for j = 1:size(syn_table, 1)
            if sum(xor(s(i, :), syn_table(j, :))) == 0
                n_mes(i, j) = xor(n_mes(i, j), 1);
                break
            end
        end
    end
    
    
%     for i = 1:size(s, 1)
%         for j = 1:size(h, 2)
%             if sum(xor(s(i, :), h(:, j)')) == 0
%                 n_mes(i, j) = xor(n_mes(i, j), 1);
%                 break
%             end
%         end
%     end
end