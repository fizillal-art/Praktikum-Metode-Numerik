# Responsi 1 Praktikum Metode Numerik

Materi: **Galat, Sistem Persamaan Linear (SPL), dan Sistem Persamaan Non-Linear (SPNL)**

| | |
|---|---|
| Nama | Fizillal Kamal Arsad Purwanto |
| NIM | L0325046 |
| Program Studi | S1 Informatika (PSDKU Kebumen) |
| Fakultas / Universitas | Fakultas Teknologi Informasi dan Sains Data, Universitas Sebelas Maret |
| Bahasa / Alat | MATLAB |

Repositori ini berisi source code MATLAB untuk tiga kasus responsi. Laporan lengkap (analisis source code dan analisis praktikum) dikumpulkan dalam bentuk PDF melalui Classroom.

Isi Repositori
Berkas	Kasus	Metode
Kasus1_GelombangLaut.m	1. Galat / error pemotongan	Deret Maclaurin untuk cos(x) dan e^x, n = 23, 24, 25
Kasus2_SPL_GaussSeidel.m	2. SPL harga bahan makanan	Uji dominan diagonal, tukar baris, Gauss-Seidel
Kasus3_Tabung_Bola.m	3. Persamaan non-linear	Metode grafik + metode Biseksi
Cara Menjalankan
Buka MATLAB.
Buka salah satu berkas .m di atas, atau salin isinya ke Editor MATLAB.
Klik Run (atau tekan F5).
Hasil tabel tampil di Command Window, dan grafik muncul pada jendela Figure.

Setiap berkas berdiri sendiri, tidak memerlukan berkas lain maupun toolbox tambahan. Tiap berkas diawali clc; clear; close all; sehingga variabel dan gambar dari eksekusi sebelumnya dibersihkan.

Kasus 1 - Galat / Error Pemotongan (Gelombang Air Laut)
Soal singkat

Tinggi gelombang h = h0 (cos(t v / λ) + e^x) dihitung secara eksak dan dengan pendekatan deret Maclaurin:

cos(u) ≈ Σ (-1)^k u^(2k) / (2k)!
e^x ≈ Σ x^k / k!

dengan λ = 12, v = 36, x = 10, h0 = 5, batas iterasi n = {23, 24, 25}, dan 0 ≤ t ≤ 5. Diminta grafik perbandingan, rerata galat mutlak, dan keputusan apakah pendekatan layak dengan toleransi 1%.

Langkah penyelesaian
Penyederhanaan rumus. Karena v/λ = 36/12 = 3, argumen cosinus adalah u = 3t, sehingga h(t) = 5 (cos 3t + e^10). Nilai e^10 = 22026,465795, jadi h(t) berosilasi di sekitar 110.132 dengan amplitudo 5.
Arti n. n ditafsirkan sebagai banyak suku yang dijumlahkan (k = 0 sampai n-1).
Ukuran galat. Galat mutlak = |h_pendekatan - h_eksak|, galat relatif = galat mutlak / |h_eksak| x 100%. Karena toleransi diberikan dalam persen, keputusan memakai galat relatif.
Pembuatan data. t dibuat 501 titik (langkah 0,01) dengan linspace(0,5,501).
Isi kode
Baris	Fungsi
6-13	Data soal dan vektor waktu t, argumen u = t*v/lambda
15-16	Nilai eksak h_eksak
18-31	Dua perulangan bersarang: luar untuk n, dalam untuk k = 0..n-1 menjumlahkan suku cos dan e^x
33-38	Galat mutlak, galat relatif, rerata, dan toleransi
40-52	Pencetakan tabel dan keputusan Layak / Tidak layak
54-73	Gambar 1 (empat fungsi dalam satu plot) dan Gambar 2 (galat mutlak)
Hasil
e^x eksak (x = 10)  = 22026.465795

n    e^10 pendekatan  Galat e^10     Rerata galat mutlak Rerata rel.(%) Keputusan
23   22019.951758     6.514037       32.570160          0.029574       Layak
24   22023.819928     2.645867       13.229335          0.012012       Layak
25   22025.431666     1.034129       5.170645           0.004695       Layak
Analisis
Keempat kurva berbentuk sama (osilasi cosinus), hanya bergeser vertikal. Kurva eksak paling atas, lalu n = 25, n = 24, dan n = 23 paling bawah.
Pergeseran berasal dari pemotongan deret e^x (semua sukunya positif, sehingga pendekatan selalu lebih kecil dari nilai eksak). Galat cosinus sangat kecil (maksimum 2,1 x 10^-4 untuk n = 23).
Karena itu galat mutlak hampir konstan terhadap t, kira-kira 5 kali galat e^10.
Galat mutlak 32,57 tampak besar, tetapi nilai h sekitar 110.000. Galat relatif rata-rata hanya 0,0296%, 0,0120%, dan 0,0047%.
Kesimpulan: ketiganya jauh di bawah toleransi 1%, sehingga metode pendekatan yang disarankan matematikawan layak digunakan. n = 23 sudah cukup; n = 25 bila diinginkan ketelitian lebih tinggi.
Kasus 2 - SPL: Harga Bahan Makanan per Kilogram
Soal singkat

Adel, Briza, Caca, dan Dinda membeli beras, telur, tepung, dan ayam dengan satuan berbeda-beda. Diminta harga tiap bahan per kilogram, dengan rumusan SPL, analisis apakah metode numerik (tidak langsung) dapat dipakai, lalu penyelesaiannya.

Langkah penyelesaian

1. Konversi satuan ke kilogram (1 hg = 0,1 kg; 1 dag = 0,01 kg; 1 g = 0,001 kg):

Nama	Beras (kg)	Telur (kg)	Tepung (kg)	Ayam (kg)	Total (Rp)
Adel	2,5	1,5	5	0,5	161.000
Briza	4	0,75	1	2	149.000
Caca	2	1,5	0,5	6	251.500
Dinda	1	4,25	2	0,9	173.000

2. Bentuk SPL dengan x1 = beras, x2 = telur, x3 = tepung, x4 = ayam (Rp per kg):

2,5 x1 + 1,5  x2 + 5   x3 + 0,5 x4 = 161000
4   x1 + 0,75 x2 + 1   x3 + 2   x4 = 149000
2   x1 + 1,5  x2 + 0,5 x3 + 6   x4 = 251500
1   x1 + 4,25 x2 + 2   x3 + 0,9 x4 = 173000

3. Apakah bisa dengan metode numerik? Syarat cukup konvergensi Gauss-Seidel adalah matriks dominan diagonal ketat. Pada urutan awal syarat gagal di keempat baris. Namun urutan persamaan boleh ditukar tanpa mengubah solusi. Dengan urutan Briza, Dinda, Adel, Caca, diagonalnya 4; 4,25; 5; 6 dan syaratnya terpenuhi (4 > 3,75; 4,25 > 3,9; 5 > 4,5; 6 > 4). Jadi masalah ini bisa diselesaikan dengan metode numerik, dan dipilih Gauss-Seidel.

4. Rumus iterasi:

x1 = (149000 - 0,75 x2 - x3 - 2 x4) / 4
x2 = (173000 - x1 - 2 x3 - 0,9 x4) / 4,25
x3 = (161000 - 2,5 x1 - 1,5 x2 - 0,5 x4) / 5
x4 = (251500 - 2 x1 - 1,5 x2 - 0,5 x3) / 6

Tebakan awal (0, 0, 0, 0), iterasi berhenti bila galat maksimum < 10^-6.

Isi kode
Baris	Fungsi
5-6	Faktor konversi satuan
8-16	Matriks A dan vektor b (angka ditulis sesuai soal x faktor konversi)
18-28	Uji dominan diagonal, tukar baris otomatis dengan max(abs(A),[],1)
30-52	Gauss-Seidel (variabel diperbarui di tempat); cabang else untuk metode langsung
54-61	Hasil, residu, dan pembanding A\b
Hasil
Jumlah iterasi = 18
Harga beras  per kg = Rp   14000.00
Harga telur  per kg = Rp   24000.00
Harga tepung per kg = Rp   15000.00
Harga ayam   per kg = Rp   30000.00
Residu max |A*x - b| = 7.145863e-07

Iterasi 1 menghasilkan x = (37250,0000; 31941,1765; 3992,6471; 21181,9853), sama dengan hitungan manual.

Analisis
Galat turun stabil sekitar 3-4 kali tiap iterasi di awal hingga di bawah toleransi pada iterasi 18.
Hasil identik dengan operator A\b dan lolos substitusi balik (misalnya Adel: 35.000 + 36.000 + 75.000 + 15.000 = 161.000).
Bahan	Harga per kg
Beras	Rp 14.000
Telur	Rp 24.000
Tepung	Rp 15.000
Ayam	Rp 30.000
Kasus 3 - Persamaan Non-Linear: Bola dalam Tabung
Soal singkat

Sebuah bola berada di dalam tabung dengan volume bola 300 (volume, bersatuan cm^3; soal menulis cm^2). Diminta persamaan non-linear untuk mencari jari-jari, lalu penyelesaiannya dengan Biseksi atau Regula-Falsi dengan nilai awal dari metode grafik.

Langkah penyelesaian
Model geometri. Bola menyentuh dinding, alas, dan tutup tabung, sehingga jari-jari tabung = jari-jari bola = r dan tinggi tabung t = 2r.
V_bola = (4/3) π r^3
V_tabung = π r^2 (2r) = 2 π r^3
V_luar = V_tabung - V_bola = (2/3) π r^3 (sesuai rumus pada soal)
Persamaan non-linear. Dengan V_bola = 300: f(r) = (4/3) π r^3 - 300 = 0.
Metode grafik. f(0) = -300, f(4) = -31,92, f(5) = +223,60. Karena berbeda tanda, akar berada di [4, 5].
Biseksi. c = (a+b)/2; bila f(a)·f(c) < 0 maka b = c, selain itu a = c. Berhenti bila setengah lebar interval < 10^-6 (maksimum 50 iterasi).
Isi kode
Baris	Fungsi
6-7	Volume bola dan fungsi anonim f(r)
9-25	Grafik tunggal f(r) dan grafik ganda y1 = (4/3) π r^3 dengan y2 = 300
27-48	Metode Biseksi pada [4, 5] beserta tabel iterasi
50-63	Jari-jari, tinggi, volume tabung, volume di luar bola, dan pembanding analitik
Hasil
Jumlah iterasi        = 20
Jari-jari bola/tabung = 4.152831 cm
Tinggi tabung t = 2r  = 8.305662 cm
Volume tabung         = 450.000158 cm^3
Volume tabung di luar bola = 150.000158 cm^3
Cek rumus (2/3)*pi*r^3     = 150.000053 cm^3
Jari-jari analitik (pembanding) = 4.152831 cm, galat = 4.855e-07
Analisis
Iterasi 1: c = 4,5 dengan f(c) = 81,70 > 0 sehingga interval menjadi [4; 4,5]. Iterasi 2: c = 4,25 (f = 21,56) sehingga [4; 4,25]. Iterasi 3: c = 4,125 (f = -5,99) sehingga [4,125; 4,25], dan seterusnya.
Hasil Biseksi hanya berbeda 4,9 x 10^-7 dari rumus analitik r = (225/π)^(1/3) = 4,152831.
Karena V_bola : V_tabung = 2 : 3, volume tabung selalu 1,5 kali volume bola (450 cm^3) dan volume di luar bola selalu setengah volume bola (150 cm^3), sesuai keluaran program.
Kesimpulan: r ≈ 4,1528 cm dan volume tabung di luar bola ≈ 150 cm^3.
Rangkuman Hasil
Kasus	Metode	Hasil utama
1. Galat pemotongan	Deret Maclaurin n = 23, 24, 25	Galat relatif rata-rata 0,0296%; 0,0120%; 0,0047% (< 1%), pendekatan layak
2. SPL harga bahan	Gauss-Seidel (setelah tukar baris, 18 iterasi)	Beras Rp 14.000; telur Rp 24.000; tepung Rp 15.000; ayam Rp 30.000 per kg
3. Bola dalam tabung	Grafik + Biseksi (20 iterasi)	r = 4,152831 cm; volume di luar bola ≈ 150 cm^3
Catatan
Tampilan kode yang tampak "kosong" di MATLAB biasanya disebabkan warna teks biasa pada preferensi editor yang diset putih. Ubah di Home > Preferences > Colors, atau pilih skema warna Default.
Laporan lengkap berformat PDF dikumpulkan melalui Classroom.
