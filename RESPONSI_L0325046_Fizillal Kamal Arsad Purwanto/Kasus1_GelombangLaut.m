%% KASUS 1 - GALAT / ERROR PEMOTONGAN (GELOMBANG AIR LAUT)
% h(t) = h0 * ( cos(t*v/lambda) + e^x )
% cos(u) dan e^x didekati dengan deret Maclaurin sebanyak n suku
clc; clear; close all;

%% 1. Data soal
lambda = 12;            % panjang gelombang
v      = 36;            % kecepatan
x      = 10;            % nilai x pada e^x
h0     = 5;             % amplitudo
N      = [23 24 25];    % banyak suku (batas iterasi) deret
t      = linspace(0, 5, 501);   % 0 <= t <= 5 (501 titik, langkah 0,01)
u      = t*v/lambda;            % argumen cos, u = 3t

%% 2. Hasil eksak
h_eksak = h0*(cos(u) + exp(x));

%% 3. Hasil pendekatan deret Maclaurin
h_aprox = zeros(numel(N), numel(t));
e_aprox = zeros(1, numel(N));
for m = 1:numel(N)
    n     = N(m);
    cos_n = zeros(size(t));
    e_n   = 0;
    for k = 0:n-1
        cos_n = cos_n + (-1)^k * u.^(2*k) / factorial(2*k);   % suku ke-(k+1) cos
        e_n   = e_n   + x^k / factorial(k);                    % suku ke-(k+1) e^x
    end
    e_aprox(m)   = e_n;
    h_aprox(m,:) = h0*(cos_n + e_n);
end

%% 4. Galat
galat_mutlak = abs(h_aprox - repmat(h_eksak, numel(N), 1));
galat_relatif = galat_mutlak ./ repmat(abs(h_eksak), numel(N), 1) * 100;   % dalam persen
rerata_mutlak  = mean(galat_mutlak, 2);
rerata_relatif = mean(galat_relatif, 2);
toleransi = 1;   % batas toleransi 1%

%% 5. Tampilkan hasil
fprintf('e^x eksak (x = 10)  = %.6f\n\n', exp(x));
fprintf('%-4s %-16s %-14s %-18s %-14s %-12s\n', 'n', 'e^10 pendekatan', 'Galat e^10', ...
        'Rerata galat mutlak', 'Rerata rel.(%)', 'Keputusan');
for m = 1:numel(N)
    if rerata_relatif(m) < toleransi
        keputusan = 'Layak';
    else
        keputusan = 'Tidak layak';
    end
    fprintf('%-4d %-16.6f %-14.6f %-18.6f %-14.6f %-12s\n', N(m), e_aprox(m), ...
            exp(x) - e_aprox(m), rerata_mutlak(m), rerata_relatif(m), keputusan);
end

%% 6. Grafik perbandingan keempat fungsi
figure(1);
plot(t, h_eksak,      'k-',  'LineWidth', 2.5); hold on;
plot(t, h_aprox(1,:), 'r--', 'LineWidth', 1.5);
plot(t, h_aprox(2,:), 'g-.', 'LineWidth', 1.5);
plot(t, h_aprox(3,:), 'b:',  'LineWidth', 1.8);
hold off; grid on;
xlabel('t'); ylabel('h(t)');
title('Perbandingan h(t) eksak dan pendekatan deret Maclaurin');
legend('Eksak', 'n = 23', 'n = 24', 'n = 25', 'Location', 'best');

%% 7. Grafik galat mutlak
figure(2);
plot(t, galat_mutlak(1,:), 'r--', 'LineWidth', 1.5); hold on;
plot(t, galat_mutlak(2,:), 'g-.', 'LineWidth', 1.5);
plot(t, galat_mutlak(3,:), 'b:',  'LineWidth', 1.8);
hold off; grid on;
xlabel('t'); ylabel('Galat mutlak');
title('Galat mutlak tiap pendekatan terhadap nilai eksak');
legend('n = 23', 'n = 24', 'n = 25', 'Location', 'best');

