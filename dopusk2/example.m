clear all
close all

m = 8;
% p = [1, 0, 1, 1];
p = [1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1];
snr_val = -5:2:3;
N = 50000;


[p_e_mean_arr, errors_dec, c_mes_control, tries] = simulation(m, snr_val, p, N);

nfig = 1;

figure(nfig);
nfig = nfig + 1;
% plot(p_e_mean_arr);
soft = [0.088383333333332,0.022741666666667,0.001930000000000,2.833333333333333e-05,0];
q = erfc(sqrt(2 * 10 .^ (snr_val / 10)) ./ sqrt(2)) * 0.5;
semilogy(snr_val, soft, snr_val, p_e_mean_arr,  'LineWidth', 2);
legend('мягкое декодирование', 'жесткое декодирование');
title('CRC-16');
xlabel('E_{b}/N_{0}');
ylabel('P_{bit}');
% semilogy(snr_val, , 'LineWidth', 2);

% [T] = theor(m, N, 36, tries);
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

% figure(nfig);
% nfig = nfig + 1;
% semilogy(snr_val, T, snr_val, (m / 36) * ones(1, size(T, 2)));
% legend('с шумом', 'без шума');
% title('CRC-16');
% xlabel('E_{b}/N_{0}');
% ylabel('T');