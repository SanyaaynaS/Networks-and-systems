function [hwz_mes] = delete_zeros_adv(h_mes, addition_zeros)
hwz_mes = zeros(size(h_mes, 1), size(h_mes, 2) - addition_zeros);
rim = ceil(log2(size(h_mes, 2) + 1));

hwz_mes(:, 1:rim) = h_mes(:, 1:rim);
hwz_mes(:, (rim + 1):size(hwz_mes, 2)) = h_mes(:, (rim + 4):size(h_mes, 2));
end