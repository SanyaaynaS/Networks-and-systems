function [h_mes] = add_zeros_adv(hwz_mes, addition_zeros)
h_mes = zeros(size(hwz_mes, 1), size(hwz_mes, 2) + addition_zeros);
rim = ceil(log2(size(h_mes, 2) + 1));

h_mes(:, 1:rim) = hwz_mes(:, 1:rim);
h_mes(:, (rim + 4):size(h_mes, 2)) = hwz_mes(:, (rim + 1):size(hwz_mes, 2));
end