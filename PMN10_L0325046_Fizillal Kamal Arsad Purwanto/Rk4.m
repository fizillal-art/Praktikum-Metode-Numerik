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

%% 2. Metode Runge-Kutta orde-4
x = x_awal;  y = y_awal;
tabel = zeros(N, 8);
for i = 0:N-1
    k1 = f(x, y);
    k2 = f(x + h/2, y + k1 * h/2);
    k3 = f(x + h/2, y + k2 * h/2);
    k4 = f(x + h, y + k3 * h);
    y_next = y + (h / 6) * (k1 + 2*k2 + 2*k3 + k4);
    tabel(i+1, :) = [i x y k1 k2 k3 k4 y_next];
    x = x + h;
    y = y_next;
end
y_rk4 = y;      % y terakhir = hasil pendekatan y(x_target)

%% 3. Tabel iterasi
fprintf('     Tabel Iterasi Metode Runge-Kutta Orde-4  \n\n');
fprintf('%-3s%-9s%-10s%-9s%-9s%-9s%-9s%-10s\n', 'i', 'xi', 'yi', 'k1', 'k2', 'k3', 'k4', 'yi+1');
fprintf('%s\n', repmat('.', 1, 68));
for k = 1:N
    fprintf('%-3d%-9.4f%-10.4f%-9.4f%-9.4f%-9.4f%-9.4f%-10.4f\n', tabel(k, :));
end

%% 4. Perbandingan dengan solusi eksak
y_eksak = solusi_eksak(x_target);
galat_absolut = abs(y_eksak - y_rk4);
galat_relatif = galat_absolut / y_eksak * 100;

fprintf('\n       Perbandingan Solusi Eksak\n');
fprintf('Solusi eksak y%d = sqrt(37) - 2 = %.6f\n', x_target, y_eksak);
fprintf('Metode RK4   y%d              = %.6f\n', x_target, y_rk4);
fprintf('Galat absolut                        = %.6f\n', galat_absolut);
fprintf('Galat relatif                        = %.6f%%\n', galat_relatif);

