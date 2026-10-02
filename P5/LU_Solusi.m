% DEKOMPOSISI LU: menyelesaikan L z = b (forward) lalu U x = z (backward)
% Cara pakai: x = LU_Solusi(A, b)
function x = LU_Solusi(A, b)
tic
fprintf('Hasil dekomposisi LU\n')
[L, U, b] = LU_fwdelim(A, b)
[n, m] = size(L);
z = zeros(n, 1);
x = zeros(n, 1);
z(1) = b(1) / L(1, 1);
for i = 2 : n
    z(i) = (b(i) - L(i, 1:i-1) * z(1:i-1)) / L(i, i);
end
x(n) = z(n) / U(n, n);
for i = n-1 : -1 : 1
    x(i) = (z(i) - U(i, i+1:n) * x(i+1:n)) / U(i, i);
end
toc
