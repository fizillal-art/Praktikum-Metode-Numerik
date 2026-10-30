# Responsi 1 Praktikum Metode Numerik

Materi: **Galat, Sistem Persamaan Linear (SPL), dan Sistem Persamaan Non-Linear (SPNL)**

| | |
|---|---|
| Nama | Fizillal Kamal Arsad Purwanto |
| NIM | L0325046 |
| Program Studi | S1 Informatika (PSDKU Kebumen) |
| Fakultas / Universitas | Fakultas Teknologi Informasi dan Sains Data, Universitas Sebelas Maret |
| Bahasa / Alat | MATLAB |

Repositori ini berisi source code MATLAB untuk tiga kasus responsi beserta laporan lengkapnya. Laporan terdiri dari **Bab I (Analisis Source Code)** dan **Bab II (Analisis Praktikum)** yang menjelaskan proses sebelum kode ditulis, saat kode ditulis, dan hasil akhirnya.

---

## Isi Repositori

```
.
├── Kasus1_GelombangLaut.m        # Kasus 1: galat / error pemotongan
├── Kasus2_SPL_GaussSeidel.m      # Kasus 2: SPL, Gauss-Seidel
├── Kasus3_Tabung_Bola.m          # Kasus 3: persamaan non-linear, grafik + Biseksi
├── RESPONSI_L0325046_Fizillal_Kamal_Arsad_Purwanto.pdf   # Laporan
└── README.md
```

## Cara Menjalankan

1. Buka MATLAB, lalu buka salah satu berkas `.m` (atau salin isinya ke Editor).
2. Klik **Run** (atau ketik nama berkas di Command Window, misalnya `Kasus1_GelombangLaut`).
3. Hasil berupa tabel di Command Window dan gambar (`figure`) akan muncul otomatis.

Catatan:
- Setiap berkas berdiri sendiri, tidak memerlukan berkas lain atau toolbox tambahan.
- Setiap berkas diawali `clc; clear; close all;` sehingga aman dijalankan berulang.
- Disarankan MATLAB R2016b atau lebih baru.

---

## Kasus 1 - Galat / Error Pemotongan (`Kasus1_GelombangLaut.m`)

**Soal.** Tinggi gelombang air laut

```
h = h0 * ( cos(t*v/lambda) + e^x )
```

dihitung secara eksak dan dengan pendekatan deret Maclaurin untuk `cos` dan `e^x`, dengan `lambda = 12`, `v = 36`, `x = 10`, `h0 = 5`, batas iterasi `n = {23, 24, 25}`, dan `0 <= t <= 5`. Bandingkan rerata galat mutlak ketiganya terhadap hasil eksak dan tentukan apakah pendekatan layak pada toleransi 1%.

**Langkah penyelesaian.**
1. Substitusi data: `t*v/lambda = 3t`, sehingga `h(t) = 5 (cos 3t + e^10)`.
2. Deret suku ke-(k+1), `k = 0, ..., n-1` (n suku):
   - `cos(u) ~ sum (-1)^k u^(2k) / (2k)!`
   - `e^x ~ sum x^k / k!`
3. Rentang `t` dibagi 501 titik (langkah 0,01).
4. Galat mutlak = `|h_pendekatan - h_eksak|`, galat relatif = galat mutlak / `|h_eksak|` x 100%. Keduanya dirata-ratakan pada seluruh `t`.
5. Gambar 1 memuat empat fungsi (eksak, n = 23, 24, 25) dalam satu plot, Gambar 2 memuat galat mutlak terhadap `t`.

**Hasil.**

| n | e^10 pendekatan | Rerata galat mutlak | Rerata galat relatif (%) | Keputusan (batas 1%) |
|---|---|---|---|---|
| 23 | 22019,951758 | 32,570160 | 0,029574 | Layak |
| 24 | 22023,819928 | 13,229335 | 0,012012 | Layak |
| 25 | 22025,431666 | 5,170645 | 0,004695 | Layak |

(`e^10` eksak = 22026,465795)

**Kesimpulan.** Rerata galat mutlak tampak besar (5 sampai 33) karena nilai `h` sekitar 110.000, tetapi galat relatifnya jauh di bawah 1%. Galat terutama berasal dari pemotongan deret `e^x`, sehingga garis galat mutlak hampir mendatar terhadap `t`. Metode pendekatan yang disarankan matematikawan **layak digunakan**.

---

## Kasus 2 - SPL Metode Langsung dan Tidak Langsung (`Kasus2_SPL_GaussSeidel.m`)

**Soal.** Empat mahasiswa (Adel, Briza, Caca, Dinda) membeli beras, telur, tepung, dan ayam dengan satuan berbeda. Tentukan harga tiap bahan per kilogram.

**Langkah penyelesaian.**
1. Konversi satuan ke kg: `1 hg = 0,1 kg`, `1 dag = 0,01 kg`, `1 g = 0,001 kg`.
2. Misalkan `x1, x2, x3, x4` = harga beras, telur, tepung, ayam per kg:

```
2,5 x1 + 1,5  x2 + 5   x3 + 0,5 x4 = 161000   (Adel)
4   x1 + 0,75 x2 + 1   x3 + 2   x4 = 149000   (Briza)
2   x1 + 1,5  x2 + 0,5 x3 + 6   x4 = 251500   (Caca)
1   x1 + 4,25 x2 + 2   x3 + 0,9 x4 = 173000   (Dinda)
```

3. Uji kelayakan metode iteratif dengan syarat dominan diagonal. Urutan awal **tidak** dominan diagonal, tetapi setelah baris ditukar menjadi Briza, Dinda, Adel, Caca (urutan `[2 4 1 3]`) diagonalnya 4; 4,25; 5; 6 dan syarat terpenuhi. Jadi masalah **dapat diselesaikan dengan metode numerik** (Gauss-Seidel).
4. Gauss-Seidel dengan tebakan awal nol, toleransi `1e-6` pada selisih terbesar antar-iterasi, maksimum 1000 iterasi.
5. Verifikasi dengan residu `|Ax - b|` dan perbandingan dengan operator `A\b`.

**Hasil (18 iterasi).**

| Bahan | Harga per kg |
|---|---|
| Beras | Rp 14.000 |
| Telur | Rp 24.000 |
| Tepung | Rp 15.000 |
| Ayam | Rp 30.000 |

Residu maksimum sekitar `7,1e-7`, dan hasil sama dengan `A\b`. Substitusi balik ke keempat total belanja juga cocok.

---

## Kasus 3 - Persamaan Non-Linear, Bola dalam Tabung (`Kasus3_Tabung_Bola.m`)

**Soal.** Bola di dalam tabung (jari-jari sama, tinggi tabung `t = 2r`) bervolume 300 cm³. Tentukan jari-jari dan volume bagian tabung di luar bola.

**Langkah penyelesaian.**
1. Perbandingan volume:
   - `V_bola = (4/3) pi r^3`
   - `V_tabung = pi r^2 (2r) = 2 pi r^3`
   - `V_luar = V_tabung - V_bola = (2/3) pi r^3` (sesuai rumus pada soal)
2. Persamaan non-linear dari `V_bola = 300`:

```
f(r) = (4/3) pi r^3 - 300 = 0
```

3. Metode grafik (grafik tunggal `f(r)` dan grafik ganda `y1 = (4/3) pi r^3` dengan `y2 = 300`) menunjukkan akar di antara 4 dan 5: `f(4) = -31,92` dan `f(5) = +223,60`.
4. Metode Biseksi pada `[4, 5]` dengan toleransi `1e-6` pada setengah lebar interval dan maksimum 50 iterasi.
5. Hasil dibandingkan dengan jari-jari analitik `r = (3*300 / (4 pi))^(1/3)`.

**Hasil (20 iterasi).**

| Besaran | Nilai |
|---|---|
| Jari-jari bola dan tabung `r` | 4,152831 cm |
| Tinggi tabung `t = 2r` | 8,305662 cm |
| Volume tabung | 450,000158 cm³ |
| Volume tabung di luar bola | 150,000158 cm³ |
| Jari-jari analitik (pembanding) | 4,152831 cm (selisih 4,9e-7) |

Secara teori `V_bola : V_tabung = 2 : 3`, sehingga volume tabung 450 cm³ dan volume di luar bola 150 cm³, sesuai keluaran program.

---

## Rangkuman

| Kasus | Metode | Hasil utama |
|---|---|---|
| 1. Galat pemotongan | Deret Maclaurin n = 23, 24, 25 | Galat relatif rata-rata 0,0296%; 0,0120%; 0,0047% (< 1%), layak |
| 2. SPL harga bahan | Gauss-Seidel (setelah tukar baris, 18 iterasi) | Beras 14.000; telur 24.000; tepung 15.000; ayam 30.000 (Rp/kg) |
| 3. Bola dalam tabung | Metode grafik + Biseksi (20 iterasi) | r = 4,152831 cm; volume di luar bola = 150 cm³ |

## Asumsi

- Batas iterasi `n` pada Kasus 1 ditafsirkan sebagai **banyaknya suku** deret (`k = 0` sampai `n-1`).
- Volume bola pada soal Kasus 3 tertulis "cm²", dibaca sebagai cm³ karena merupakan volume.
- Angka pada tabel di atas adalah keluaran program pada pengaturan default (`format short`, `fprintf` dengan format yang tertulis di kode).

## Laporan

Penjelasan lengkap tiap langkah (analisis source code per baris, proses sebelum/saat memasukkan ke kode, grafik, dan analisis hasil) ada PDF laporan di Classroom.
