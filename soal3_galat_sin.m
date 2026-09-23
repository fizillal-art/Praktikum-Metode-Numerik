% SOAL 3 - Galat sin(x) dengan deret Taylor, N = 1,2,3,4,5 dan x = 1
clc; clear;

x     = 1;
eksak = sin(x);                          % nilai sebenarnya

fprintf('Nilai eksak sin(%d) = %.15f\n\n', x, eksak);
fprintf('N   Hampiran       Galat Mutlak   Galat Rel.   Galat (%%)\n');

for N = 1:5                              % perulangan 1: variasi N
    p = 0;
    for n = 0:N                          % perulangan 2: jumlah suku deret
        p = p + (-1)^n * x^(2*n+1)/factorial(2*n+1);
    end
    galat = abs(eksak - p);
    rel   = galat/abs(eksak);
    fprintf('%-3d %-14.10f %-14.4e %-12.4e %-12.8f\n', ...
            N, p, galat, rel, rel*100);
end
