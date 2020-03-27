clear all
close all

m = 5;
% p = [1, 0, 1, 1];
p = [1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1];
snr_val = 0:5:20;
N = 1500000;

[p_e_mean_arr, errors_dec, c_mes_control] = simulation(m, snr_val, p, N);

nfig = 1;

figure(nfig);
nfig = nfig + 1;
% plot(p_e_mean_arr);
q = erfc(sqrt(2 * 10 .^ (snr_val / 10)) ./ sqrt(2)) * 0.5;
semilogy(snr_val, p_e_mean_arr, snr_val, q,  'LineWidth', 2);
legend('практика', 'теория');
title('CRC-16');
xlabel('E_{b}/N_{0}');
ylabel('SNR');
% semilogy(snr_val, , 'LineWidth', 2);


[p_ed, p_ed_as, p_ed_super] = theor_ped(c_mes_control, m, q);

figure(nfig);
nfig = nfig + 1;
% hold on
semilogy(snr_val, errors_dec, snr_val, p_ed_as, snr_val, p_ed, snr_val, p_ed_super);
legend('практическая', 'асимптотическая','точная', 'верхняя точная');
title('CRC-16');
xlabel('E_{b}/N_{0}');
ylabel('P_{ED}');
% hold off

% plot(snr_val, p_ed);


% figure(nfig);
% nfig = nfig + 1;
% sqrt(2 * snr_val)
% / sqrt(2)
% plot(erfc(sqrt(2 * snr_val) ./ sqrt(2)) * 0.5);
