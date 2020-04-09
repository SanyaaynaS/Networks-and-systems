function [d_mes] = hamming_decoder(n_mes, orig_size)
%     n_mes = [1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1];
%     co_mes = [1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1];
%     r = size(n_mes, 2) - orig_size;
    r = ceil(log2(size(n_mes, 2)));
    
    for i = 1:size(n_mes, 1)
        r_bits = zeros(1, r);
        for j = 1:size(n_mes, 2)
            if (n_mes(i, j) == 1) & ((log2(j) - floor(log2(j))) ~= 0)
                bin = dec2bin(j);
                deg = 1;
                for k = size(bin, 2):-1:1
                    if bin(k) == '1'
                        r_bits(deg) = mod(r_bits(deg) + 1, 2);
                    end
                    deg = deg + 1;
                end
            end
        end
        
        flag = true;
        err_index = 0;
        for k = 1:size(r_bits, 2)
            deg = k - 1;
            if r_bits(k) ~= n_mes(i, 2 ^ deg)
                flag = false;
                err_index = err_index + 2 ^ deg;
            end
        end
        
        if ~flag
            n_mes(i, err_index) = mod(n_mes(i, err_index) + 1, 2);
        end
    end   
%     isequal(n_mes, co_mes)
    d_mes = zeros(size(n_mes, 1), orig_size);
    
    for i = 1:size(n_mes, 1)
        for j = 1:size(n_mes, 2)
            if (log2(j) - floor(log2(j))) ~= 0
                d_mes(i, j - ceil(log2(j))) = n_mes(i, j);
            end
        end
    end
end