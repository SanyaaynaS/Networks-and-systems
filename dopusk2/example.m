clear all
close all

m = 8;
% p = [1, 0, 1, 1];
p = [1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1];
snr_val = -2:2:6;
N = 500000;


[p_e_mean_arr, errors_dec, c_mes_control, tries, k, n] = simulation(m, snr_val, p, N);

nfig = 1;

figure(nfig);
nfig = nfig + 1;
% plot(p_e_mean_arr);
q = erfc(sqrt(2 * 10 .^ (snr_val / 10)) ./ sqrt(2)) * 0.5;
semilogy(snr_val, p_e_mean_arr, snr_val, q,  'LineWidth', 2);
legend('с кодированием', 'без кодирования');
title('CRC-16');
xlabel('E_{b}/N_{0}');
ylabel('P_{bit}');
% semilogy(snr_val, , 'LineWidth', 2);

[T] = theor(m, N, 36, tries);
% [p_ed, p_ed_as, p_ed_super] = theor_ped(c_mes_control, m, q);

% wh = [1.100000000000000e-05,8.000000000000000e-06,4.000000000000000e-06];
% h = [1.600000000000000e-05,1.200000000000000e-05,0.700000000000000e-05];
% figure(nfig);
% nfig = nfig + 1;
% semilogy(snr_val, wh, snr_val, h);
% legend('с кодированием', 'без кодирования');
% title('CRC-16');
% xlabel('E_{b}/N_{0}');
% ylabel('P_{ED}');

figure(nfig);
nfig = nfig + 1;
semilogy(snr_val, T, snr_val, (m / 36) * ones(1, size(T, 2)));
legend('с шумом', 'без шума');
title('CRC-16');
xlabel('E_{b}/N_{0}');
ylabel('T');