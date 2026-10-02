# Praktikum 05 – Sistem Persamaan Linear (Metode Numerik)

Laporan praktikum mata kuliah **Metode Numerik** tentang penyelesaian sistem persamaan linear (SPL) 3 × 3 dengan tiga metode: **Eliminasi Gauss**, **Eliminasi Gauss-Jordan**, dan **Dekomposisi LU**.

- **Penyusun:** L0325046 – Fizillal Kamal Arsad Purwanto
- **Program Studi:** Informatika, Fakultas Teknologi Informasi dan Sains Data, Universitas Sebelas Maret (2026)

---

## 1. Soal

Diberikan sistem persamaan linear:

```
 2x₁ +  x₂ −  x₃ = 3
 4x₁ + 3x₂ +  x₃ = 9
−2x₁ +  x₂ + 2x₃ = 4
```

Kerjakan dengan tiga metode (disertai program untuk masing-masing metode), lalu bandingkan hasil x₁, x₂, x₃. Ketiganya harus sama.

| Metode | Yang dikerjakan |
|---|---|
| a) Eliminasi Gauss | Forward elimination sampai segitiga atas, lalu substitusi mundur |
| b) Eliminasi Gauss-Jordan | Lanjutkan dengan backward elimination sampai matriks diagonal / identitas |
| c) Dekomposisi LU | Catat pengali untuk membentuk L dan U, tunjukkan A = LU, lalu selesaikan Ly = b dan Ux = y |

---

## 2. Hasil

Ketiga metode menghasilkan solusi yang sama:

| Variabel | Nilai desimal | Nilai pecahan |
|---|---|---|
| x₁ | −0,4 | −2/5 |
| x₂ | 3,6 | 18/5 |
| x₃ | −0,2 | −1/5 |

Verifikasi ke persamaan awal: hasilnya 3, 9, dan 4.

### Ringkasan perhitungan manual (tanpa pertukaran baris)

- **Pengali:** m₂₁ = 2, m₃₁ = −1, m₃₂ = 2
- **Segitiga atas (U):**

```
[ 2  1 −1 | 3 ]
[ 0  1  3 | 3 ]
[ 0  0 −5 | 1 ]
```

- **Matriks L:**

```
[  1  0  0 ]
[  2  1  0 ]
[ −1  2  1 ]
```

- **Ly = b:** y = [3; 3; 1]
- **Ux = y:** x₃ = −0,2; x₂ = 3,6; x₁ = −0,4

---

## 3. Isi Folder

| File | Keterangan |
|---|---|
| `PMN05_L0325046_Fizillal_Kamal_Arsad_Purwanto.docx` | Laporan lengkap (format mengikuti laporan PMN04) |
| `Gauss.m` | Fungsi `Gauss(A, b)` – Eliminasi Gauss |
| `EliminasiGaussJordan.m` | Fungsi `EliminasiGaussJordan(A, b)` – Eliminasi Gauss-Jordan |
| `LU_Solusi.m` | Fungsi `LU_Solusi(A, b)` – menyelesaikan SPL dengan LU |
| `LU_fwdelim.m` | Fungsi pembantu pembentuk L dan U (dipanggil oleh `LU_Solusi.m`) |
| `README.md` | Dokumen ini |

### Struktur laporan

- **Sampul**
- **Bab I – Analisis Source Code:** kode, penjelasan per baris, keluaran program, dan analisis hasil untuk tiap metode
- **Bab II – Analisis Numerik:** perhitungan manual tulis tangan (gambar) dan analisis hasil
- **Bab III – Analisis Praktikum:** kesimpulan dan tabel perbandingan ketiga metode

---

## 4. Cara Menjalankan Program

Program ditulis dalam **MATLAB** (kompatibel dengan Octave untuk perintah yang dipakai). Letakkan keempat file `.m` dalam satu folder, jadikan folder itu *Current Folder*, lalu jalankan di Command Window:

```matlab
A = [2 1 -1; 4 3 1; -2 1 2];
b = [3; 9; 4];

x = Gauss(A, b)                    % Eliminasi Gauss
x = EliminasiGaussJordan(A, b)     % Eliminasi Gauss-Jordan
x = LU_Solusi(A, b)                % Dekomposisi LU
```

Keluaran yang diharapkan pada setiap pemanggilan:

```
x =

   -0.4000
    3.6000
   -0.2000
```

---

## 5. Penjelasan Singkat Tiap Metode

**Eliminasi Gauss.** Matriks augmented [A | b] diubah menjadi bentuk segitiga atas dengan operasi baris (forward elimination), lalu variabel dicari dari persamaan paling bawah ke atas (back substitution).

**Eliminasi Gauss-Jordan.** Kelanjutan dari Gauss: elemen di atas pivot juga dinolkan (backward elimination) sehingga matriks koefisien menjadi diagonal. Setelah dibagi pivotnya, solusi terbaca langsung tanpa back substitution. Operasinya lebih banyak daripada Gauss.

**Dekomposisi LU.** Matriks A diuraikan menjadi L (segitiga bawah, diagonal 1) dan U (segitiga atas). Pengali dari forward elimination disimpan sebagai isi L. Sistem lalu diselesaikan dalam dua tahap: Ly = b (forward substitution) dan Ux = y (back substitution). Metode ini menguntungkan jika matriks A yang sama dipakai berulang dengan vektor b yang berbeda, karena L dan U cukup dihitung satu kali.

---

## 6. Catatan Penting

1. **Partial pivoting pada program.** Program mengikuti contoh di materi, yaitu menukar baris agar pivot selalu bernilai mutlak terbesar. Karena itu langkah antara pada program berbeda dengan hitungan manual (yang tanpa pertukaran baris):
   - Pengali program: 0,5; −0,5; −0,2 (manual: 2; −1; 2)
   - Segitiga atas program: diagonal 4; 2,5; −1 (manual: 2; 1; −5)
   - **Solusi akhir tetap sama.**
2. **Dekomposisi LU pada program** memenuhi **PA = LU** (P = matriks pertukaran baris), bukan A = LU. Hitungan manual (tanpa pertukaran baris) memenuhi A = LU.
3. **Perbedaan dari contoh di materi (dua perbaikan kecil pada `LU_fwdelim.m`):**
   - Kondisi `if A(k != 1)` diganti `if k ~= 1` karena sintaks aslinya tidak valid di MATLAB.
   - Baris matriks L ikut ditukar saat terjadi pertukaran baris agar L tetap konsisten dengan U.
4. **Keluaran program di Bab I** disusun dengan simulasi yang logikanya sama dengan kode, bukan dari tangkapan layar MATLAB langsung. Angka *Elapsed time* hanya perkiraan dan akan berbeda pada setiap komputer. Jalankan ulang di MATLAB jika ingin memakai tangkapan layar asli.
5. **Gambar Bab II** dibuat bergaya tulisan tangan untuk membantu penyusunan laporan. Ganti dengan foto tulisan tangan sendiri bila diperlukan.

---

## 7. Referensi

- Materi kuliah *Metode Numerik – Sistem Persamaan Linear* (UNS, Semester Gasal 2026/2027).
- Materi praktikum *Sistem Persamaan Linear 1*, Praktikum Metode Numerik.
- Chapra, S. C. *Applied Numerical Methods with MATLAB® for Engineers and Scientists*. 4th ed. New York: McGraw-Hill Education.
