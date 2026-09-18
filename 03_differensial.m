pkg load symbolic
syms x

f = input('Masukkan bentuk persamaan f(x) = ', 's');
f_asli = sym(f);
f_turunan = diff(f_asli, 'x');

disp('Fungsi Asli:');
disp(f_asli);
disp('Hasil Turunan:');
disp(f_turunan);
% Contoh input saat dijalankan: 3*x^3 - 4*x^2 + 2*x - 5
