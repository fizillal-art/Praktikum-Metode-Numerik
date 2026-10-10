% ITERASI JACOBI (nilai baru dihitung dari seluruh nilai iterasi sebelumnya)
% Cara pakai: [x, iter, waktu, konv] = Jacobi(A, b, tol, max_iter)
function [x, iter, waktu, konv] = Jacobi(A, b, tol, max_iter)
tic
n = size(A, 1);
C = -A;
d = zeros(n, 1);
xlama = zeros(n, 1);
for i = 1 : n
    C(i, i) = 0;
    C(i, :) = C(i, :) / A(i, i);
    d(i) = b(i) / A(i, i);
    xlama(i) = b(i) / A(i, i);
end
x = xlama;
iter = 0;
konv = false;
for k = 1 : max_iter
    xbaru = C * xlama + d;
    iter = k;
    x = xbaru;
    if max(abs(xbaru - xlama)) <= tol
        konv = true;
        break
    end
    xlama = xbaru;
end
waktu = toc;
end
