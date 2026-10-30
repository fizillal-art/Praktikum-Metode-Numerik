# Responsi 1 - Metode Numerik (2026)

Repositori ini berisi implementasi kode MATLAB untuk menyelesaikan **Responsi 1 Mata Kuliah Metode Numerik**. Terdiri dari tiga kasus komputasi numerik yang mencakup perhitungan galat (error), penyelesaian Sistem Persamaan Linear (SPL), dan pencarian akar persamaan non-linear.

## 👤 Identitas Penulis
- **Nama:** Fizillal Kamal Arsad Purwanto
- **NIM:** L0325046
- **Program Studi:** Informatika PSDKU Kebumen
- **Fakultas:** Teknologi Informasi dan Sains Data
- **Universitas:** Universitas Sebelas Maret

---

## 📁 Daftar Isi Repositori

1. `Kasus1_GelombangLaut.m` - Penyelesaian galat/error pemotongan Deret Maclaurin.
2. `Kasus2_SPL_GaussSeidel.m` - Penyelesaian SPL menggunakan metode iteratif Gauss-Seidel.
3. `Kasus3_Tabung_Bola.m` - Penyelesaian persamaan non-linear menggunakan Metode Biseksi.

---

## 📝 Analisis Kasus & Hasil

### Kasus 1: Galat/Error Pemotongan (Gelombang Air Laut)
**File:** `Kasus1_GelombangLaut.m`

**Deskripsi:**
Menghitung tinggi gelombang laut berdasarkan rumus eksak dan membandingkannya dengan pendekatan menggunakan Deret Maclaurin.
Persamaan tinggi gelombang:
$$h(t) = h_0 \left( \cos\left(\frac{tv}{\lambda}\right) + e^x \right)$$
Diketahui $\lambda = 12$, $v = 36$, $x = 10$, dan $h_0 = 5$. Fungsi $\cos$ dan $e^x$ didekati dengan deret Maclaurin sebanyak $n$ suku ($n = 23, 24, 25$).

**Hasil Eksekusi:**
- Rerata galat mutlak yang dihasilkan adalah $32.570160$ ($n = 23$), $13.229335$ ($n = 24$), dan $5.170645$ ($n = 25$).
- Rerata galat relatif masing-masing adalah $0.0296\%$, $0.0120\%$, dan $0.0047\%$.
- **Kesimpulan:** Karena galat relatif rata-rata jauh di bawah batas toleransi $1\%$, metode pendekatan Deret Maclaurin sangat **layak** untuk digunakan. Pilihan paling efisien adalah $n = 23$, sementara $n = 25$ memberikan ketelitian paling tinggi.

### Kasus 2: SPL Harga Bahan Makanan (Metode Tidak Langsung)
**File:** `Kasus2_SPL_GaussSeidel.m`

**Deskripsi:**
Menentukan harga per kilogram untuk empat bahan makanan (Beras, Telur, Tepung, Ayam) berdasarkan daftar belanja empat orang (Adel, Briza, Caca, Dinda) yang satuan beratnya masih bervariasi (gram, dekagram, hektogram, kilogram).

**Metode:**
Setelah diseragamkan ke satuan *kilogram*, dibentuk Sistem Persamaan Linear (SPL). Matriks koefisien awal *tidak* dominan diagonal. Oleh karena itu, dilakukan penukaran baris secara otomatis di dalam kode (urutan menjadi Briza–Dinda–Adel–Caca) agar matriks memenuhi syarat dominan diagonal dominan ketat, sehingga metode iteratif **Gauss-Seidel** dijamin konvergen. Batas toleransi ditetapkan pada $10^{-6}$.

**Hasil Eksekusi (Dicapai dalam 18 Iterasi):**
| Bahan | Harga per kg |
| :--- | :--- |
| Beras ($x_1$) | Rp 14.000 |
| Telur ($x_2$) | Rp 24.000 |
| Tepung ($x_3$) | Rp 15.000 |
| Ayam ($x_4$) | Rp 30.000 |
*Residu maksimum yang didapat sangat kecil ($7.146 \times 10^{-7}$), membuktikan hasil tersebut akurat.*

### Kasus 3: Persamaan Non-Linear Bola dalam Tabung
**File:** `Kasus3_Tabung_Bola.m`

**Deskripsi:**
Sebuah bola menyentuh dinding, alas, dan tutup sebuah tabung (sehingga jari-jari tabung $r$ sama dengan jari-jari bola, dan tinggi tabung $t = 2r$). Diketahui volume bola adalah $300\text{ cm}^3$. Kita diminta mencari ukuran jari-jari bola/tabung, tinggi tabung, dan volume tabung di luar bola.

**Metode:**
Model matematika direpresentasikan sebagai pencarian akar dari:
$$f(r) = \frac{4}{3}\pi r^3 - 300 = 0$$
Interval awal ditentukan melalui **Metode Grafik**, yang menunjukkan bahwa akar berada pada interval $[4, 5]$. Setelah itu, pencarian akar yang presisi dilakukan menggunakan **Metode Biseksi** dengan toleransi $10^{-6}$.

**Hasil Eksekusi:**
- **Jari-jari (r):** $4.152831\text{ cm}$ (didapat pada iterasi ke-20)
- **Tinggi tabung (t):** $8.305662\text{ cm}$
- **Volume tabung total:** $450\text{ cm}^3$
- **Volume tabung di luar bola:** $150\text{ cm}^3$
*Hasil numerik konsisten dengan pengecekan analitik, dengan margin galat $4.855 \times 10^{-7}$.*

---
