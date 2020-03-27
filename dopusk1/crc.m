function [new_mes] = crc(mes, p)
    new_mes = zeros(size(mes, 1), size(mes, 2) + size(p, 2) - 1);
    new_mes(1:size(mes, 1), 1:size(mes, 2)) = mes;
%     rem_mes = zeros(size(mes, 1), size(new_mes, 2) - size(mes, 2));
    for i = 2:size(new_mes, 1)
%         a = new_mes(i, 1:size(new_mes, 2));
        [q, r] = deconv(new_mes(i, 1:size(new_mes, 2)), p);
        r = mod(r, 2);  
        new_mes(i, (size(mes, 2) + 1):size(new_mes, 2)) = ...
        r(size(mes, 2) + 1:size(new_mes,2));
    end
end