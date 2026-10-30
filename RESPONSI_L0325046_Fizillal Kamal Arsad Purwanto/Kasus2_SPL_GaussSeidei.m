%% KASUS 2 - SPL: HARGA BAHAN MAKANAN PER KILOGRAM
% Variabel: x1 = beras, x2 = telur, x3 = tepung, x4 = ayam (Rp per kg)
clc; clear; close all;

%% 1. Faktor konversi satuan ke kilogram
kg = 1; hg = 0.1; dag = 0.01; gr = 0.001;

%% 2. Matriks koefisien A (baris: Adel, Briza, Caca, Dinda) dan vektor b
A = [2.5*kg    1500*gr   5*kg     500*gr;      % Adel
     40*hg     0.75*kg   1000*gr  2*kg;        % Briza
     2000*gr   15*hg     50*dag   6000*gr;     % Caca
     1*kg      4250*gr   20*hg    9*hg];       % Dinda
b = [161000; 149000; 251500; 173000];

disp('Matriks A (kg) dan vektor b (Rp):');
fprintf('%8.2f %8.2f %8.2f %8.2f | %10.0f\n', [A b]');

%% 3. Uji dominan diagonal (syarat cukup kekonvergenan Gauss-Seidel)
dominan = @(M) all(abs(diag(M)) > sum(abs(M),2) - abs(diag(M)));
fprintf('\nA awal dominan diagonal? %d (1 = ya, 0 = tidak)\n', dominan(A));

% Tukar baris: tiap kolom diberi baris dengan elemen terbesar di diagonal
[~, urutan] = max(abs(A), [], 1);
A2 = A(urutan, :);
b2 = b(urutan);
fprintf('Urutan baris baru = [%s]\n', num2str(urutan));
fprintf('A setelah tukar baris dominan diagonal? %d\n\n', dominan(A2));
fprintf('%8.2f %8.2f %8.2f %8.2f | %10.0f\n', [A2 b2]');

%% 4. Metode Gauss-Seidel
n = 4; maks_iter = 1000; tol = 1e-6;
xs = zeros(n,1);                     % tebakan awal
fprintf('%-5s %-13s %-13s %-13s %-13s %-12s\n', 'Iter', 'x1 (beras)', 'x2 (telur)', ...
        'x3 (tepung)', 'x4 (ayam)', 'Galat maks');
iter = 0;
if dominan(A2)
    for iter = 1:maks_iter
        x_lama = xs;
        for i = 1:n
            j = [1:i-1, i+1:n];
            xs(i) = (b2(i) - A2(i,j)*xs(j)) / A2(i,i);
        end
        galat = max(abs(xs - x_lama));
        fprintf('%-5d %-13.4f %-13.4f %-13.4f %-13.4f %-12.6f\n', iter, xs, galat);
        if galat < tol
            break;
        end
    end
else
    disp('Tidak dominan diagonal -> gunakan metode langsung (Gauss).');
    xs = A \ b;
end

%% 5. Hasil akhir dan verifikasi
fprintf('\nJumlah iterasi = %d\n', iter);
fprintf('Harga beras  per kg = Rp %10.2f\n', xs(1));
fprintf('Harga telur  per kg = Rp %10.2f\n', xs(2));
fprintf('Harga tepung per kg = Rp %10.2f\n', xs(3));
fprintf('Harga ayam   per kg = Rp %10.2f\n', xs(4));
fprintf('Residu max |A*x - b| = %.6e\n', max(abs(A*xs - b)));
fprintf('Pembanding A\\b      = %.4f  %.4f  %.4f  %.4f\n', A\b);

