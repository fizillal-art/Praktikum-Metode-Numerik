# Program Metode Numerik: Biseksi, Regula-Falsi, dan Grafik Persamaan

## Deskripsi

Repositori ini berisi program GNU Octave/MATLAB untuk mencari akar persamaan nonlinear menggunakan **metode Biseksi** dan **metode Regula-Falsi**, serta beberapa skrip untuk menggambar grafik fungsi dan kurva pembanding.

Program utama mencetak tabel iterasi yang memuat batas interval, nilai fungsi pada batas, perkiraan akar, dan nilai fungsi pada perkiraan akar.

## Daftar File

| File | Kegunaan |
|---|---|
| `ProgramBiseksiRegulasiFalsi.m` | Program utama yang memuat fungsi Biseksi, fungsi Regula-Falsi, dan pengujian untuk tiga persamaan. |
| `GrafikTunggal1.m` | Menggambar grafik \(y=3x^3-5x^2+4x-8\). |
| `GrafikTunggal2.m` | Menggambar grafik \(y=e^x-x^2\). |
| `GrafikGanda1.m` | Membandingkan \(y=3x^3-5x^2+4x-7\) dengan garis \(y=1\). Perpotongannya setara dengan penyelesaian \(3x^3-5x^2+4x-8=0\). |
| `GrafikGanda2.m` | Membandingkan \(y=e^x\) dan \(y=x^2\). Titik potongnya berkaitan dengan \(e^x-x^2=0\). |
| `GrafikGanda3.m` | Membandingkan \(y=\log(x+2)\) dan \(y=-2x+3\). Titik potongnya berkaitan dengan \(\log(x+2)+2x-3=0\). |

## Persamaan yang Diuji

Program utama menguji tiga persamaan berikut.

1. **Persamaan 1**
   \[
   3x^3-5x^2+4x-8=0
   \]
   Interval awal: \([1,2]\).

2. **Persamaan 2**
   \[
   e^x-x^2=0
   \]
   Interval awal: \([-1,0]\).

3. **Persamaan 3**
   \[
   \log(x+2)+2x-3=0
   \]
   Interval awal: \([0,2]\).

Pengaturan pada program utama adalah maksimum **20 iterasi** dan toleransi **\(10^{-4}\)**. Fungsi yang digunakan untuk persamaan ketiga adalah `log(x+2)`; di GNU Octave/MATLAB, `log` berarti logaritma natural.

## Metode Numerik

### 1. Metode Biseksi

Metode Biseksi membagi interval yang mengapit akar menjadi dua bagian. Titik tengah dihitung dengan:

\[
c=\frac{a+b}{2}
\]

Jika \(f(a)\) dan \(f(c)\) memiliki tanda berbeda, interval baru menjadi \([a,c]\). Jika tidak, interval baru menjadi \([c,b]\). Proses diulang sampai toleransi terpenuhi atau jumlah iterasi maksimum tercapai.

Syarat awal yang diperiksa program adalah \(f(a)f(b)\leq 0\). Jika \(f(a)\) dan \(f(b)\) bertanda sama, program menampilkan error karena interval tersebut tidak menjamin adanya akar.

### 2. Metode Regula-Falsi

Metode Regula-Falsi memperkirakan akar menggunakan titik potong garis yang menghubungkan \((a,f(a))\) dan \((b,f(b))\):

\[
c=\frac{a f(b)-b f(a)}{f(b)-f(a)}
\]

Setelah nilai \(c\) dan \(f(c)\) dihitung, interval diperbarui berdasarkan perubahan tanda fungsi, seperti pada metode Biseksi. Metode ini dapat menghasilkan perkiraan yang berbeda dari Biseksi karena titik kandidatnya bukan selalu titik tengah.

## Cara Menjalankan

### Menggunakan GNU Octave

1. Simpan seluruh file `.m` ke dalam satu folder.
2. Buka GNU Octave dan atur *Current Directory* ke folder tersebut.
3. Jalankan program utama dengan perintah:

   ```matlab
   ProgramBiseksiRegulasiFalsi
   ```

4. Tabel iterasi untuk setiap persamaan akan ditampilkan di jendela Command Window.

Untuk menampilkan grafik, jalankan salah satu skrip grafik, misalnya:

```matlab
GrafikTunggal1
```

atau:

```matlab
GrafikGanda1
```

Skrip lainnya dapat dijalankan dengan cara yang sama sesuai nama file.

### Menggunakan MATLAB

Buka folder yang berisi file, lalu jalankan nama skrip dari Command Window. Pastikan folder tersebut menjadi *Current Folder* MATLAB.

## Keluaran Program

Untuk setiap metode dan persamaan, program menampilkan kolom:

- `Iter`: nomor iterasi.
- `a` dan `b`: batas interval saat ini.
- `fa` dan `fb`: nilai fungsi pada batas interval.
- `c`: perkiraan akar pada iterasi tersebut.
- `fc`: nilai fungsi pada perkiraan akar.

Variabel `c` yang dicetak setelah pemanggilan fungsi merupakan perkiraan akar terakhir yang diperoleh sebelum proses berhenti.

## Catatan

- Gunakan interval awal yang mengapit akar, biasanya ditandai oleh \(f(a)f(b)<0\).
- Toleransi yang lebih kecil umumnya menuntut ketelitian lebih tinggi dan dapat membutuhkan lebih banyak iterasi.
- Skrip grafik menggunakan rentang \(x\) yang telah ditentukan di dalam masing-masing file; rentang tersebut dapat diubah bila ingin melihat bagian kurva yang berbeda.
- `GrafikGanda1.m` menampilkan fungsi \(3x^3-5x^2+4x-7\) dan garis \(y=1\). Ini ekuivalen untuk melihat titik potong persamaan \(3x^3-5x^2+4x-8=0\).
- README ini disusun berdasarkan enam file program `.m` yang tersedia. Berkas laporan tertulis terpisah tidak disertakan dalam kumpulan file yang diterima, sehingga isi laporan tersebut tidak dirangkum secara khusus di sini.

## Pengembangan Lebih Lanjut

Program dapat dikembangkan dengan menampilkan ringkasan akar akhir dalam format yang lebih rapi, menghitung galat relatif antariterasi, atau menyimpan tabel iterasi ke file untuk dimasukkan ke laporan.
