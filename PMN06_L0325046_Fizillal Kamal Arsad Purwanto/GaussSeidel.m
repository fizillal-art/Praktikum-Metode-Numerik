% ITERASI GAUSS-SEIDEL (nilai baru langsung dipakai dalam iterasi yang sama)
% Cara pakai: [x, iter, waktu, konv] = GaussSeidel(A, b, tol, max_iter)
function [x, iter, waktu, konv] = GaussSeidel(A, b, tol, max_iter)
tic
n = size(A, 1);
C = -A;
d = zeros(n, 1);
x = zeros(n, 1);
for i = 1 : n
    C(i, i) = 0;
    C(i, :) = C(i, :) / A(i, i);
    d(i) = b(i) / A(i, i);
    x(i) = b(i) / A(i, i);
end
iter = 0;
konv = false;
for k = 1 : max_iter
    xlama = x;
    for j = 1 : n
        x(j) = C(j, :) * x + d(j);
    end
    iter = k;
    if max(abs(x - xlama)) <= tol
        konv = true;
        break
    end
end
waktu = toc;
end
