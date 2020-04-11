function [u_mes] = unite_mes_adv(div_mes, r)
u_mes = zeros(round(size(div_mes, 1) / 3), (size(div_mes, 2) - 3 - r) * 3);
delta = (size(div_mes, 2) - 3 - r);
j = 1;
for i = 1:size(u_mes, 1)
    rim = 1;
    for k = 0:2
        u_mes(i, rim:(rim + delta - 1)) = ...
                div_mes(j + k, (3 + r + 1):size(div_mes, 2));
        rim = rim + delta;
    end
    j = j + k + 1;
end
end