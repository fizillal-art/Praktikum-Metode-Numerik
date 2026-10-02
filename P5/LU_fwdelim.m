% FORWARD ELIMINATION untuk membentuk matriks L dan U (A diuraikan menjadi L*U)
% Dipanggil oleh LU_Solusi.m
function [L, U, b] = LU_fwdelim(A, b)
[n, l] = size(A);
L = zeros(n);
for i = 1 : n-1
    [pivot, k] = max(abs(A(i:n, i)));
    if k ~= 1
        temp1 = A(i, :);
        temp2 = b(i, :);
        temp3 = L(i, :);
        A(i, :) = A(i + k - 1, :);
        b(i, :) = b(i + k - 1, :);
        L(i, :) = L(i + k - 1, :);
        A(i + k - 1, :) = temp1;
        b(i + k - 1, :) = temp2;
        L(i + k - 1, :) = temp3;
    end
    for h = i+1 : n
        m = A(h, i) / A(i, i);
        L(h, i) = m;
        A(h, :) = A(h, :) - m * A(i, :);
    end
end
L = L + eye(n);
U = A;
end
