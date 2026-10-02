% ELIMINASI GAUSS-JORDAN (Forward + Backward Elimination)
% Cara pakai: x = EliminasiGaussJordan(A, b)
function x = EliminasiGaussJordan(A, b)
tic
[n, l] = size(A);
for i = 1 : n-1
    [pivot, k] = max(abs(A(i:n, i)))
    if k ~= 1
        temp1 = A(i, :);
        temp2 = b(i, :);
        A(i, :) = A(i + k - 1, :);
        b(i, :) = b(i + k - 1, :);
        A(i + k - 1, :) = temp1;
        b(i + k - 1, :) = temp2;
    end
    for h = i+1 : n
        m = A(h, i) / A(i, i);
        A(h, :) = A(h, :) - m * A(i, :);
        b(h, :) = b(h, :) - m * b(i, :);
    end
end
fprintf('Hasil forward elimination:\n')
A
for i = n : -1 : 2
    for h = i-1 : -1 : 1
        m = A(h, i) / A(i, i);
        A(h, :) = A(h, :) - m * A(i, :);
        b(h, :) = b(h, :) - m * b(i, :);
    end
end
fprintf('Hasil backwards elimination:\n')
A
for i = 1 : n
    x(i, :) = b(i, :) / A(i, i);
end
toc
