% SOAL 1 - Galat e^(0.3) dengan deret Taylor, n = 0,1,2,3,4
clc; clear;

x     = 0.3;
eksak = exp(x);                          % nilai sebenarnya

fprintf('Nilai eksak e^%.1f = %.15f\n\n', x, eksak);
fprintf('n   Hampiran       Galat Mutlak   Galat Rel.   Galat (%%)\n');

for n = 0:4                              % perulangan 1: variasi n
    p = 0;
    for i = 0:n                          % perulangan 2: jumlah suku deret
        p = p + x^i/factorial(i);
    end
    galat = abs(eksak - p);              % galat mutlak
    rel   = galat/abs(eksak);            % galat relatif
    fprintf('%-3d %-14.10f %-14.10f %-12.8f %-12.6f\n', ...
            n, p, galat, rel, rel*100);
end
