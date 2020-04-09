function [hwz_mes] = delete_zeros(h_mes, addition_zeros)
    hwz_mes = zeros(size(h_mes, 1), size(h_mes, 2) - addition_zeros);
    redudant_ind = zeros(1, addition_zeros);

    redudant_ind(1) = 3;
    for i = 2:addition_zeros
        redudant_ind(i) = 4 + i - 1;
    end

    for i = 1:size(h_mes, 1)
        for j = 1:size(h_mes, 2)
%             ismember(j, redudant_ind)
            if sum(j == redudant_ind) > 0
                continue
            end

            if j < 4
                hwz_mes(i, j) = h_mes(i, j);
            elseif j == 4
                hwz_mes(i, j - 1) = h_mes(i, j);
            elseif j > 4
                hwz_mes(i, j - addition_zeros) = h_mes(i, j);
            end
        end
    end
end