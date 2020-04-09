function [mes] = gen_mes(m)
    d = 0:(2 ^ m - 1);
    nums = str2num(dec2bin(d));
    mes = zeros(2 ^ m, m);
    for i = 1:(2 ^ m)
        j = 0;
        rem = nums(i, 1);
        while rem > 0
            mes(i, size(mes, 2) - j) = mod(rem, 10);
            rem = fix(rem / 10);
            j = j + 1;
        end
    end
end