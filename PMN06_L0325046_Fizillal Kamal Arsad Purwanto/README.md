# Praktikum Metode Numerik 06 – Sistem Persamaan Linear

Program MATLAB/Octave untuk menyelesaikan SPL 5 variabel (p, q, r, s, t) dengan lima metode,
menghitung galat, dan mengukur running time.

**Penyusun:** L0325046 – Fizillal Kamal Arsad Purwanto
**Program Studi:** Informatika PSDKU Kebumen, Universitas Sebelas Maret

## Soal

```
 5p -  q -  r           = -1
-p  + 5q -  r -  s      =  2
-p  -  q + 4r -  s - t  =  6
            r + 4s - 2t =  2
      q  -  r +  s + 4t = -1
```

Matriks koefisien dominan diagonal lemah (baris 3: 4 = 1+1+1+1), tetapi Jacobi dan
Gauss-Seidel tetap konvergen. Determinan A = 1521, sehingga solusinya tunggal.

Solusi eksak: p = 55/169 ≈ 0,3254; q = 422/507 ≈ 0,8323; r = 70/39 ≈ 1,7949;
s = 7/169 ≈ 0,0414; t = −10/507 ≈ −0,0197.

## Daftar file

| File | Jenis | Fungsi |
|---|---|---|
| `Gauss.m` | fungsi | Eliminasi Gauss (partial pivoting + substitusi mundur) |
| `EliminasiGaussJordan.m` | fungsi | Eliminasi Gauss-Jordan (eliminasi maju + eliminasi mundur) |
| `LU_fwdelim.m` | fungsi | Membentuk matriks L dan U (dipanggil `LU_Solusi.m`) |
| `LU_Solusi.m` | fungsi | Dekomposisi LU: `L z = b` lalu `U x = z` |
| `Jacobi.m` | fungsi | Iterasi Jacobi |
| `GaussSeidel.m` | fungsi | Iterasi Gauss-Seidel |
| `Soal2.m` | skrip | Galat mutlak metode langsung dan iteratif |
| `Soal3.m` | skrip | Running time kelima metode (rata-rata 1000 kali) |

Semua file harus berada dalam **satu folder**, dan folder itu harus menjadi *Current Folder*
(atau ditambahkan lewat `addpath`).

## Cara menjalankan

Soal 1 – panggil fungsi satu per satu:

```matlab
A = [5 -1 -1 0 0; -1 5 -1 -1 0; -1 -1 4 -1 -1; 0 0 1 4 -2; 0 1 -1 1 4];
b = [-1; 2; 6; 2; -1];

[x, waktu, U]           = Gauss(A, b)
[x, waktu, D]           = EliminasiGaussJordan(A, b)
[x, waktu, L, U, bp]    = LU_Solusi(A, b)
[x, iter, waktu, konv]  = Jacobi(A, b, 0.001, 20)
[x, iter, waktu, konv]  = GaussSeidel(A, b, 0.001, 20)
```

Soal 2 dan Soal 3:

```matlab
Soal2    % tabel galat mutlak
Soal3    % running time rata-rata
```

## Keluaran fungsi

| Fungsi | Keluaran |
|---|---|
| `Gauss` | `x` solusi, `waktu` (detik), `U` matriks segitiga atas |
| `EliminasiGaussJordan` | `x`, `waktu`, `D` matriks diagonal |
| `LU_Solusi` | `x`, `waktu`, `L`, `U`, `bp` (b setelah pertukaran baris) |
| `Jacobi`, `GaussSeidel` | `x`, `iter` (jumlah iterasi), `waktu`, `konv` (true jika konvergen) |

Parameter metode iteratif: `tol` = batas toleransi (0,001) dan `max_iter` = maksimum iterasi (20).
Iterasi berhenti jika `max(abs(x_baru - x_lama)) <= tol`.

## Catatan implementasi

- **Tanpa input/output di dalam algoritma.** Fungsi tidak mencetak apa pun, dan `tic`/`toc`
  hanya membungkus proses algoritma, sesuai petunjuk Soal 3.
- **Galat (Soal 2)** dihitung sebagai `abs(nilai eksak - nilai hampiran)`, dengan nilai eksak dari
  `Gauss`. Galat Gauss-Jordan dan LU hanya galat pembulatan (orde 1e-16).
- **Running time (Soal 3):** satu kali pemanggilan terlalu singkat untuk diukur stabil, sehingga
  `Soal3.m` mengulang tiap metode `N = 1000` kali dan mencetak rata-ratanya.
- **Tebakan awal** metode iteratif adalah `b(i)/A(i,i)` (sama dengan contoh kode pada materi),
  yang setara dengan iterasi ke-1 dari tebakan nol pada perhitungan manual.

## Hasil yang diharapkan

| Metode | p | q | r | s | t | Iterasi |
|---|---|---|---|---|---|---|
| Gauss / Gauss-Jordan / LU | 0,3254 | 0,8323 | 1,7949 | 0,0414 | −0,0197 | – |
| Jacobi | 0,3251 | 0,8320 | 1,7945 | 0,0416 | −0,0199 | 8 |
| Gauss-Seidel | 0,3255 | 0,8323 | 1,7948 | 0,0415 | −0,0197 | 6 |

Galat maksimum: Jacobi ≈ 3,8×10⁻⁴, Gauss-Seidel ≈ 4,4×10⁻⁵.

Nilai `waktu` dan hasil `Soal3` bergantung pada komputer dan versi MATLAB/Octave, sehingga
berbeda pada tiap percobaan.

## Kompatibilitas

Ditulis untuk MATLAB dan kompatibel dengan GNU Octave. Tanda `~` pada `Soal3.m` dipakai untuk
mengabaikan keluaran fungsi yang tidak diperlukan.
