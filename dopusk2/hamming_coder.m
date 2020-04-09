function [h_mes] = hamming_coder(d_mes)
    r = ceil(log2(log2(size(d_mes, 2)) + size(d_mes, 2) + 1));
    h_mes = zeros(size(d_mes, 1), size(d_mes, 2) + r);
    
    for i = 1:size(h_mes, 1)
        for j = 1:size(h_mes, 2)
            if (log2(j) - floor(log2(j))) ~= 0
                h_mes(i, j) = d_mes(i, j - ceil(log2(j)));
            end
        end
    end
    
    for i = 1:size(h_mes, 1)
        for j = 1:size(h_mes, 2)
            if h_mes(i, j) == 1
                bin = dec2bin(j);
                deg = 0;
                for k = size(bin, 2):-1:1
                    if bin(k) == '1'
                        h_mes(i, 2 ^ deg) = mod(h_mes(i, 2 ^ deg) + 1, 2);
                    end
                    deg = deg + 1;
                end
            end
        end
    end                                  
end