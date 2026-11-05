%% Soal: dy/dx = (4x^3 - 2x + 1) / (2 + y),  y(0) = 1,  cari y(2) = ...?
% Sudah berbentuk dy/dx = f(x,y):
%     f(x,y) = (4x^3 - 2x + 1) / (2 + y)
clc; clear; close all;

%% 1. Data soal dan solusi eksak
f = @(x,y) (4*x.^3 - 2*x + 1) ./ (2 + y);
solusi_eksak = @(x) sqrt(2*x.^4 - 2*x.^2 + 2*x + 9) - 2;

x_awal = 0;  y_awal = 1;
x_target = 2;
N = 15;
h = (x_target - x_awal) / N;    % ukuran langkah

%% 2. Metode Euler
x = x_awal;  y = y_awal;
tabel = zeros(N, 5);
for i = 0:N-1
    fi = f(x, y);
    y_next = y + h * fi;
    tabel(i+1, :) = [i x y fi y_next];
    x = x + h;
    y = y_next;
end
y_euler = y;    % y terakhir = hasil pendekatan y(x_target)

%% 3. Tabel iterasi
fprintf('     Tabel Iterasi Metode Euler  \n\n');
fprintf('%-3s%-10s%-12s%-14s%-12s\n', 'i', 'xi', 'yi', 'f(xi,yi)', 'yi+1');
fprintf('%s\n', repmat('.', 1, 51));
for k = 1:N
    fprintf('%-3d%-10.4f%-12.4f%-14.4f%-12.4f\n', tabel(k, :));
end

%% 4. Perbandingan dengan solusi eksak
y_eksak = solusi_eksak(x_target);
galat_absolut = abs(y_eksak - y_euler);
galat_relatif = galat_absolut / y_eksak * 100;

fprintf('\n       Perbandingan Solusi Eksak\n');
fprintf('Solusi eksak y%d = sqrt(37) - 2 = %.6f\n', x_target, y_eksak);
fprintf('Metode Euler y%d              = %.6f\n', x_target, y_euler);
fprintf('Galat absolut                        = %.6f\n', galat_absolut);
fprintf('Galat relatif                        = %.6f%%\n', galat_relatif);
