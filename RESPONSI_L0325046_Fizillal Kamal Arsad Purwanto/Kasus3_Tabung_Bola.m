%% KASUS 3 - PERSAMAAN NON-LINEAR: BOLA DALAM TABUNG
% Bola menyinggung tabung: jari-jari sama (r), tinggi tabung t = 2r
% V_bola = 4/3*pi*r^3 = 300  ->  f(r) = 4/3*pi*r^3 - 300 = 0
clc; clear; close all;

Vbola = 300;
f = @(r) (4/3)*pi*r.^3 - Vbola;

%% 1. Metode grafik untuk menentukan interval awal
r = linspace(0, 6, 300);

figure(1);                                  % grafik tunggal f(r)
plot(r, f(r), 'b', 'LineWidth', 1.5); hold on;
line([0 6], [0 0], 'Color', 'k');           % sumbu r
hold off; grid on;
xlabel('r (cm)'); ylabel('f(r)');
title('Grafik tunggal f(r) = (4/3)\pi r^3 - 300');

figure(2);                                  % grafik ganda y1 dan y2
plot(r, (4/3)*pi*r.^3, 'b', 'LineWidth', 1.5); hold on;
plot(r, Vbola*ones(size(r)), 'r', 'LineWidth', 1.5);
hold off; grid on;
xlabel('r (cm)'); ylabel('Volume (cm^3)');
title('Grafik ganda y_1 = (4/3)\pi r^3 dan y_2 = 300');
legend('y_1 = (4/3)\pi r^3', 'y_2 = 300', 'Location', 'northwest');

%% 2. Metode Biseksi pada interval awal [4, 5]
a = 4; bb = 5; n_maks = 50; tol = 1e-6;
fa = f(a); fb = f(bb);
fprintf('f(%g) = %.6f ; f(%g) = %.6f ; f(a)*f(b) = %.6f\n\n', a, fa, bb, fb, fa*fb);
if fa*fb > 0
    error('Tidak ada jaminan akar: f(a) dan f(b) bertanda sama.');
end

fprintf('%-5s %-10s %-10s %-10s %-12s %-12s %-12s\n', 'Iter', 'a', 'b', 'c', 'f(a)', 'f(b)', 'f(c)');
for i = 1:n_maks
    c  = (a + bb)/2;
    fc = f(c);
    fprintf('%-5d %-10.6f %-10.6f %-10.6f %-12.6f %-12.6f %-12.6f\n', i, a, bb, c, fa, fb, fc);
    if fc == 0 || (bb - a)/2 < tol
        break;
    end
    if fa*fc < 0
        bb = c; fb = fc;
    else
        a = c; fa = fc;
    end
end

%% 3. Hasil: jari-jari, volume tabung, dan volume tabung di luar bola
r_hasil   = c;
t_tabung  = 2*r_hasil;
V_tabung  = pi*r_hasil^2*t_tabung;
V_luar    = V_tabung - Vbola;
r_eksak   = (3*Vbola/(4*pi))^(1/3);

fprintf('\nJumlah iterasi        = %d\n', i);
fprintf('Jari-jari bola/tabung = %.6f cm\n', r_hasil);
fprintf('Tinggi tabung t = 2r  = %.6f cm\n', t_tabung);
fprintf('Volume tabung         = %.6f cm^3\n', V_tabung);
fprintf('Volume tabung di luar bola = %.6f cm^3\n', V_luar);
fprintf('Cek rumus (2/3)*pi*r^3     = %.6f cm^3\n', (2/3)*pi*r_hasil^3);
fprintf('Jari-jari analitik (pembanding) = %.6f cm, galat = %.3e\n', r_eksak, abs(r_hasil - r_eksak));

