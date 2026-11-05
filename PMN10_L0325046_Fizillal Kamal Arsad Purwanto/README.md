# Praktikum 10 – Persamaan Diferensial Biasa (Metode Numerik)

Menyelesaikan persamaan diferensial biasa orde 1 dengan solusi eksak (analitik), metode Euler, metode Heun (Runge-Kutta orde-2), dan Runge-Kutta orde-4.

**Penyusun:** L0325046 – Fizillal Kamal Arsad Purwanto
**Program Studi:** Informatika, Fakultas Teknologi Informasi dan Sains Data, Universitas Sebelas Maret

## Soal

$$\frac{dy}{dx} = \frac{4x^3 - 2x + 1}{2 + y}, \qquad y(0) = 1$$

1. Cari y(2) dengan metode analitik (eksak), Euler, Heun, dan Runge-Kutta orde-4 dengan jumlah iterasi n = 15.
2. Cari galat absolut dan galat relatif dari masing-masing pendekatan.

Ukuran langkah: h = (2 − 0)/15 = 2/15 ≈ 0,1333.

## Solusi eksak

Dengan pemisahan variabel dan kondisi awal y(0) = 1:

$$y(x) = \sqrt{2x^4 - 2x^2 + 2x + 9} - 2 \quad\Rightarrow\quad y(2) = \sqrt{37} - 2 \approx 4{,}082763$$

## Hasil (n = 15)

| Metode | y(2) | Galat absolut | Galat relatif |
|---|---|---|---|
| Eksak | 4,082763 | – | – |
| Euler | 3,873692 | 0,209071 | 5,1208% |
| Heun (RK-2) | 4,095312 | 0,012549 | 0,3074% |
| Runge-Kutta orde-4 | 4,082773 | 0,000011 | 0,0003% |

Semakin tinggi orde metode, semakin kecil galatnya (galat global Euler ~ h, Heun ~ h², RK4 ~ h⁴), dengan biaya 15, 30, dan 60 evaluasi f.

## Isi folder

| Berkas | Keterangan |
|---|---|
| `euler.m`, `heun.m`, `rk4.m` | Kode MATLAB/Octave untuk tiap metode |
| `euler.py`, `heun.py`, `rk4.py` | Versi Python dengan logika dan format keluaran yang sama |
| `PMN10_L0325046_Fizillal_Kamal_Arsad_Purwanto.docx` | Laporan praktikum (Bab I Analisis Source Code, Bab II Analisis Numerik, Bab III Analisis Praktikum) |
| `Tugas_PDB_L0325046_Fizillal_Kamal_Arsad_Purwanto.docx` | Versi laporan sebelumnya (format responsi) |

## Cara menjalankan

**MATLAB / Octave**

Buka folder berisi file `.m`, lalu ketik nama file di Command Window:

```matlab
euler
heun
rk4
```

**Python 3**

Hanya memerlukan pustaka standar (`math`):

```bash
python euler.py
python heun.py
python rk4.py
```

Setiap program mencetak tabel iterasi (i, xᵢ, yᵢ, kemiringan, yᵢ₊₁), lalu perbandingan dengan solusi eksak berikut galat absolut dan galat relatif (enam angka desimal).

## Struktur kode

Ketiga file memakai kerangka yang sama:

1. Data soal: `f(x,y)`, `solusi_eksak(x)`, `x_awal`, `y_awal`, `x_target`, `N`, dan `h`.
2. Iterasi metode (Euler: 1 kemiringan; Heun: 2 kemiringan `k1`, `k2`; RK4: 4 kemiringan `k1`–`k4`).
3. Pencetakan tabel iterasi.
4. Perhitungan dan pencetakan galat terhadap solusi eksak.

## Catatan

- Versi `.m` ditulis dengan fungsi dan sintaks dasar (fungsi anonim, `for`, `fprintf`, `repmat`) sehingga dapat berjalan di MATLAB maupun Octave.
- "Galat abstrak" pada soal dibaca sebagai galat absolut.
