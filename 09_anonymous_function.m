% Mendefinisikan fungsi anonim dua variabel dan satu variabel
perkalian = @(a, b) a * b;
kubik = @(x) x.^3;

% Evaluasi fungsi
hasil_kali = perkalian(6, 8)
hasil_tunggal = kubik(4)
hasil_vektor = kubik(1:5)
