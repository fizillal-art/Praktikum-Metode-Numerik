x = -6:0.4:6;
y = x;
[X, Y] = meshgrid(x, y);

% Menambahkan offset kecil agar tidak terjadi pembagian dengan nol
R = sqrt(X.^2 + Y.^2) + 0.0001;
Z = cos(R) ./ R;

mesh(X, Y, Z);
