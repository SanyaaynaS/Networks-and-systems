function [div_mes] = divide_mes(c_mes)
    div_mes = zeros(size(c_mes, 1) * 3, round(size(c_mes, 2) / 3) + 3);
    delta = round(size(c_mes, 2) / 3) - 1;
    j = 1;
    for i = 1:size(c_mes, 1)
        rim = 1;
        for k = 0:2
            div_mes(j + k, 4:size(div_mes, 2)) = c_mes(i, rim:(rim + delta));
            rim = (rim + delta) + 1;
        end
        j = j + k + 1;
    end
end