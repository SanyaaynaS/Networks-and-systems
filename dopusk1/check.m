function [check_res, p_e] = check(n_mes, p, mes, c_mes)
    z = zeros(1, size(n_mes, 2));
    check_res = 0;
    [q, s] = deconv(n_mes, p);
    s = mod(s, 2);

    if isequal(s, z)
      if ~isequal(n_mes(1:size(mes, 2)), mes)
          check_res = 1;
      end
    end
    p_e = sum(mod(n_mes + c_mes, 2)) / size(n_mes, 2);
   
end