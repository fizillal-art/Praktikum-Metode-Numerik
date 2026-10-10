% SOAL 2: galat = abs(nilai eksak - nilai hampiran)
% Nilai eksak diambil dari metode langsung (Eliminasi Gauss)
% Cara pakai: ketik Soal2 pada Command Window
clc; clear;
A = [ 5 -1 -1  0  0;
     -1  5 -1 -1  0;
     -1 -1  4 -1 -1;
      0  0  1  4 -2;
      0  1 -1  1  4];
b = [-1; 2; 6; 2; -1];
tol = 0.001;
max_iter = 20;
xeksak = Gauss(A, b);
x2 = EliminasiGaussJordan(A, b);
x3 = LU_Solusi(A, b);
[x4, i4] = Jacobi(A, b, tol, max_iter);
[x5, i5] = GaussSeidel(A, b, tol, max_iter);
G = [abs(xeksak - x2), abs(xeksak - x3), ...
     abs(xeksak - x4), abs(xeksak - x5)];
f1 = '%-4s %12s %12s %12s %12s\n';
f2 = '%-4c %12.4e %12.4e %12.4e %12.4e\n';
f3 = '%-4s %12.4e %12.4e %12.4e %12.4e\n';
fprintf('Galat mutlak terhadap nilai eksak (Gauss)\n');
fprintf(f1, 'Var', 'Gauss-Jordan', 'LU', 'Jacobi', 'Gauss-Seidel');
nama = 'pqrst';
for i = 1 : 5
    fprintf(f2, nama(i), G(i,1), G(i,2), G(i,3), G(i,4));
end
fprintf(f3, 'maks', max(G(:,1)), max(G(:,2)), ...
        max(G(:,3)), max(G(:,4)));
