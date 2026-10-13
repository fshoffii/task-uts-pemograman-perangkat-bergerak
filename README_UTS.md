# UTS PEMOGRAMAN PERANGKAT BERGERAK

## 1. Daftar tugas dan UI responsif. Lengkapi halaman daftar agar menampilkan judul tugas, mata kuliah, status selesai/belum selesai, dan ringkasan jumlah tugas.
Tampilkan empty state bila belum ada data. Pada lebar 360 px gunakan layout yang tidak overflow; pada lebar 700 px atau 
lebih tampilkan kartu dalam dua kolom. (KAD-1) Tambahkan komentar kata UTS dan Datetime saat program dibuat.
- Jawaban: Pada bagian ini, antarmuka daftar tugas dirancang agar informatif dan responsif dengan menampilkan judul tugas, mata kuliah, indikator status selesai/belum selesai, serta ringkasan total dan progres tugas di bagian atas. Tampilan empty state disiapkan secara khusus agar layar tetap rapi ketika belum ada data yang tersimpan. Pengujian responsivitas menunjukkan bahwa pada layar smartphone (lebar 360 px), tata letak tersusun rapi secara vertikal 1 kolom tanpa kendala overflow, sedangkan pada layar tablet atau perangkat dengan lebar 700 px ke atas, komponen kartu tugas otomatis bertransformasi menjadi susunan 2 kolom. Halaman daftar tugas telah dirancang menggunakan komponen LayoutBuilder, GridView/Column adaptif, dan komponen kartu tugas yang mendukung berbagai ukuran perangkat tanpa kendala overflow. Tapi saya sempat mengalami kendala overflow yang di sebabkan oleh logika SharePreference yang kurang tepat. Ada function Expanded yang digunakan untuk mengisi sisa ruang kosong yang tersedia agar terlihat dleksibel di dalam widget susuanan linear seperti Row, Column, atau Flex.
- *Bukti dokumentasi*
<table>
  <tr>
    <td align="center">
      <img src="/dokumentasi/tampilan_devices_hp.png" alt="Tampilan HP" height="350">
      <br>
      <em>Tampilan HP</em>
    </td>
    <td align="center">
      <img src="/dokumentasi/tampilan_hp_setelah_task_diisi.png" alt="Tampilan HP Terisi" height="350">
      <br>
      <em>HP Setelah Diisi</em>
    </td>
    <td align="center">
      <img src="/dokumentasi/tampilan_tablet.png" alt="Tampilan Tablet" height="350">
      <br>
      <em>Tampilan Tablet</em>
    </td>
    <td align="center">
      <img src="/dokumentasi/tampilan_tablet_landscape.png" alt="Tablet Landscape" height="350">
      <br>
      <em>Tablet Landscape</em>
    </td>
    <td align="center">
      <img src="/dokumentasi/error_overflow.png" alt="Error Overflow" height="350">
      <br>
      <em>Error Overflow</em>
    </td>
  </tr>
</table>

## 2. Form, validasi, dan navigasi. Lengkapi form tambah tugas dan halaman detail. Judul dan mata kuliah wajib diisi setelah spasi di awal/akhir dibuang. 
Buka halaman menggunakan Navigator.push. Saat Simpan, kembalikan Task ke halaman daftar dengan Navigator.pop; saat 
Batal, kembali tanpa mengubah daftar. (KAD-2) Tambahkan komentar kata UTS dan Datetime saat program dibuat.
- Jawaban: Pada nomer ini saya di perintahkan untuk mengerjakan formulir dan navigasi yang berfokus pada perpindahan halaman dan pemastian kualitas input dan pengguna. Aplikasi ini memanfaatkan `Navigator.push` untuk membuka halaman formulir penambahan tugas, dimana inout judul dan mata kuliah diwajibkan serta diproses menggunakan `trims()` untuk menghapus spasi tak terpakai di awal maupun akhir teks sebelum validasi dilakukan. Ketiks tombol `Simpan` di tekan, data Task baru dikembalikan ke halaman utama menggunakan `Navigator.pop`  (result) sehingga daftar tugas langsung di perbarui, sedangkan tombol `Batal` akan mengembalikan pengguna ke halaman utama.
- *Bukti dokumentasi*
<table>
  <tr>
    <td align="center">
      <img src="/dokumentasi/kondisi_jika_tidak_ada_data_yang_disimpan.png" alt="Validasi Kosong" height="350">
      <br>
      <em>Validasi Kosong</em>
    </td>
    <td align="center">
      <img src="/dokumentasi/kondisi_jika_ada_spasi_akan_dirapikan.png" alt="Input dengan Spasi" height="350">
      <br>
      <em>Input dengan Spasi</em>
    </td>
    <td align="center">
      <img src="/dokumentasi/disimpan.png" alt="Hasil Disimpan Rapi" height="350">
      <br>
      <em>Hasil Disimpan Rapi</em>
    </td>
  </tr>
</table>

## 3. State dan interaksi daftar. Pastikan tugas baru langsung muncul pada daftar. 
Sediakan aksi untuk menandai tugas selesai atau belum selesai. Perubahan status harus langsung terlihat pada kartu dan ringkasan jumlah tugas. (KAD-3) Tambahkan komentar kata UTS dan Datetime saat program dibuat.
- Jawaban: Sistem pengelolaan state diterapkan untuk memastikan setiap interaksi pengguna pada daftar tugas langsung tecermin pada antarmuka secara real-time. Begitu tugas baru ditambahkan dari halaman formulir, state aplikasi diperbarui sehingga data baru langsung muncul di daftar tanpa memerlukan muat ulang (refresh) manual. Disediakan pula aksi interaktif untuk memperbarui status tugas menjadi selesai atau belum selesai, di mana perubahan tersebut tidak hanya mengubah tampilan visual pada kartu tugas terkait, tetapi juga secara otomatis mengalkulasi ulang statistik pada kartu ringkasan tugas. 

 
## 4. Operasi asynchronous dan state UI. Muat daftar melalui operasi asynchronous. 
Tampilkan indikator loading selama proses; setelah selesai, tampilkan empty state atau daftar data. Jika 
pembacaan gagal, tampilkan pesan error yang mudah dipahami dan tombol Coba Lagi. Gunakan 
kontrol simulasi yang tersedia pada starter untuk menguji kondisi error. (KAD-4) Tambahkan komentar kata UTS dan Datetime saat program dibuat.
- Jawaban:Proses pemuatan data dari latar belakang dijalankan secara asynchronous untuk menjaga kelancaran antarmuka dan mencegah aplikasi membeku (freeze). Selama proses pembacaan data berlangsung, aplikasi secara otomatis menampilkan indikator pemuatan (loading indicator), yang kemudian berpindah ke tampilan empty state atau daftar tugas setelah proses selesai. Jika terjadi kegagalan pemuatan data, sistem tidak mengalami penutupan paksa (crash), melainkan menampilkan pesan error yang komunikatif dilengkapi tombol `Coba Lagi` untuk melakukan pemicuan ulang. Pengujian kondisi error ini telah diverifikasi menggunakan kontrol simulasi yang tersedia pada proyek starter.
*Bukti dokumentasi*
<table>
  <tr>
    <td align="center">
      <img src="/dokumentasi/error_simulator.png" alt="Tampilan Coba Lagi saat Error" height="350">
      <br>
      <em>Tampilan Error dan Tombol Coba Lagi</em>
    </td>
  </tr>
</table>


## 5. Penyimpanan lokal dan verifikasi. Simpan daftar menggunakan SharedPreferences dalam bentuk JSON.
Baca kembali data saat aplikasi dimulai, termasuk status setiap tugas. Uji tambah tugas, 
ubah status, tutup dan jalankan ulang aplikasi. Jalankan pada ukuran telepon dan tablet serta 
flutter analyze. Siapkan berkas pengumpulan sesuai instruksi. (KAD-5) Tambahkan komentar kata UTS dan Datetime saat program dibuat. 
- Jawaban: Penyimpanan data jangka panjang diimplementasikan menggunakan paket SharedPreferences dengan mengonversi daftar objek tugas ke dalam format JSON agar data tidak hilang saat aplikasi ditutup. Ketika aplikasi pertama kali dijalankan, sistem secara otomatis membaca kembali berkas JSON dari penyimpanan lokal dan merekonstruksinya menjadi state daftar tugas beserta status masing-masing. Pengujian menyeluruh telah dilakukan melalui alur penambahan tugas, perubahan status, hingga menutup dan membuka kembali aplikasi baik pada ukuran layar telepon maupun tablet, serta dipastikan lolos verifikasi perintah flutter analyze tanpa adanya warning atau error. 
- *Bukti dokumentasi*
<table>
  <tr>
    <td align="center">
      <img src="/dokumentasi/flutter_analyze_dan_flutter_devices.png" alt="Flutter Analyze dan Devices" height="350">
      <br>
      <em>Hasil Flutter Analyze & Devices</em>
    </td>
  </tr>
</table>

## ERROR!!!
- Pada saat file `starter-uts` baru saya jalankan terjadi error yang di sebabkan gradle yang tidak kompatibel dengan Java.
- *Bukti dokumentasi*
<table>
  <tr>
    <td align="center">
      <img src="/dokumentasi/error_gradle.png" alt="Tampilan Error Gradle" height="350">
      <br>
      <em>Kendala & Penanganan Error Gradle</em>
    </td>
  </tr>
</table>

* Didalam errornya tercatat bahwa versi gradle dan Java tidak kompatibel sehingga menyebabkan error tersebut di mana gradle dan Java versinya harus di sesuaikan.
- Maka dari itu saya sudah menyesuaikan versinya supaya proyek bisa berjalan, ini berlaku jika menggunakan emulator dari `Android Studio` dan `Handphone` kita dimana versinya harus di setting dan di sesuaikan.Sebenarnya juga bisa menggunakan `Chrome` supaya gradle bisa di sesuaikan kalo melalui `Chrome`
- *Bukti dokumentasi*
<table>
  <tr>
    <td align="center">
      <img src="/dokumentasi/perbaikan_error_gradle.png" alt="Pesan Error Gradle di Terminal" height="350">
      <br>
      <em>Error Gradle di Terminal</em>
    </td>
    <td align="center">
      <img src="/dokumentasi/properties_gradle.png" alt="Penyesuaian Versi Gradle Properties" height="350">
      <br>
      <em>Konfigurasi gradle-wrapper.properties</em>
    </td>
    <td align="center">
      <img src="/dokumentasi/setting_gradle_plugin.png" alt="Penyesuaian settings.gradle.kts" height="350">
      <br>
      <em>Konfigurasi settings.gradle.kts</em>
    </td>
  </tr>
</table>
- Setelahnya error dapat teratasi.