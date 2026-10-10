% SOAL 3: running time lima metode (hanya algoritma, tanpa input/output)
% Waktu diukur dengan tic-toc di dalam masing-masing fungsi
% Cara pakai: ketik Soal3 pada Command Window
clc; clear;
A = [ 5 -1 -1  0  0;
     -1  5 -1 -1  0;
     -1 -1  4 -1 -1;
      0  0  1  4 -2;
      0  1 -1  1  4];
b = [-1; 2; 6; 2; -1];
tol = 0.001;
max_iter = 20;
N = 1000;
w = zeros(N, 5);
for k = 1 : N
    [~, w(k,1)] = Gauss(A, b);
    [~, w(k,2)] = EliminasiGaussJordan(A, b);
    [~, w(k,3)] = LU_Solusi(A, b);
    [~, ~, w(k,4)] = Jacobi(A, b, tol, max_iter);
    [~, ~, w(k,5)] = GaussSeidel(A, b, tol, max_iter);
end
rata = mean(w);
fprintf('Running time (detik), rata-rata dari %d kali percobaan\n', N);
fprintf('Eliminasi Gauss        : %.8f\n', rata(1));
fprintf('Eliminasi Gauss-Jordan : %.8f\n', rata(2));
fprintf('Dekomposisi LU         : %.8f\n', rata(3));
fprintf('Iterasi Jacobi         : %.8f\n', rata(4));
fprintf('Iterasi Gauss-Seidel   : %.8f\n', rata(5));
