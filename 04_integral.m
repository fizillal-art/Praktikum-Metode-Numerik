pkg load symbolic
syms x

f = input('Masukkan bentuk persamaan f(x) = ', 's');
f_asli = sym(f);
f_integral = int(f_asli, 'x');

disp('Fungsi Asli:');
disp(f_asli);
disp('Hasil Integral:');
disp(f_integral);
% Contoh input saat dijalankan: cos(4*x) + 3*x^2
