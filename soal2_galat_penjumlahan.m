% SOAL 2 - Galat pada penjumlahan 1/1 + 1/2 + ... + 1/20
clc; clear;

N = 20;
L = 232792560;                           % KPK dari 1,2,...,20

% (a) Eksak: tiap suku dijadikan pecahan berpenyebut L, dijumlah
%     sebagai bilangan bulat, lalu dibagi L satu kali saja
eksak = sum(L./(1:N))/L;
fprintf('Eksak (a)       = %.15f\n', eksak);

% (b) Setiap pembagian dibulatkan ke d desimal
desimal = [2 3 4];
for j = 1:numel(desimal)                 % perulangan 1: variasi desimal
    d = desimal(j);
    s = 0;
    for k = 1:N                          % perulangan 2: jumlah suku
        s = s + round((1/k)*10^d)/10^d;
    end
    fprintf('(b) %d desimal   = %.15f | galat = %.15f\n', ...
            d, s, abs(eksak - s));
end

% (c) Tanpa perulangan, memakai fungsi sum
hasil_c = sum(1./(1:N));
fprintf('(c) fungsi sum  = %.15f | galat = %.15f\n', ...
        hasil_c, abs(eksak - hasil_c));
