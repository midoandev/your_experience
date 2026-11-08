# Roadmap & Checklist Data Portfolio

Dokumen ini untuk dicicil. Isi bagian data kapan saja kamu sudah punya datanya,
lalu kirim. Bagian yang datanya masih kosong **tidak akan ditampilkan** di situs,
jadi tidak ada section "kosong" yang terlihat setengah jadi.

Status: ☐ belum · ◐ sebagian · ☑ lengkap

---

## A. Bisa dikerjakan sekarang (tanpa data baru)

| # | Pekerjaan | Kenapa penting |
|---|---|---|
| A1 | ☑ **Kompres gambar ke WebP** | Selesai: 19,8 MB → 1,3 MB. File asli dipindah ke `assets_source/` (tidak ikut di-build). |
| A2 | ☑ **Gambar preview link (OG image 1200×630)** | Selesai: `web/og-image.jpg` dari foto duduk. Baru terlihat setelah deploy. |
| A3 | **Filter proyek per kategori** (AI Chat, Fintech, dst.) | Berguna setelah proyeknya lebih dari ±8. |
| A4 | **Repo GitHub otomatis** dari akun `midoandev` | Menampilkan repo publik (nama, deskripsi, bahasa) langsung dari GitHub API. |

---

## B. Butuh data dari kamu (urut dari dampak terbesar)

### B1. Pengalaman kerja (timeline) — ☐
Yang paling dicari recruiter, dan saat ini belum ada sama sekali di situs.

Per posisi:
- [ ] Nama perusahaan (+ link website, opsional)
- [ ] Jabatan
- [ ] Periode (bulan/tahun mulai – selesai, atau "sekarang")
- [ ] Tipe: full-time / freelance / kontrak · remote / onsite + kota
- [ ] 2–3 pencapaian **dengan angka** (contoh: "rilis 4 app dalam 1 tahun", "crash-free naik ke 99,5%")
- [ ] Tech utama yang dipakai
- [ ] Logo perusahaan (PNG/SVG persegi, opsional)

### B2. Angka per proyek — ◐
Sudah masuk dari Google Play (Nov 2026): unduhan & rating Torcons (1K+, 4.4), AI Care (5K+, 4.6), Tjar (1K+). Masih perlu: peran/ukuran tim, durasi, tantangan teknis, hasil terukur.

Membuat studi kasus jauh lebih meyakinkan. Isi yang kamu tahu saja.

Per proyek (Torcons, Badjetin, AI Care, Callink, Paketindo, Tjar):
- [ ] Peran kamu (lead / solo / anggota tim) + ukuran tim
- [ ] Durasi pengerjaan
- [ ] Jumlah download / pengguna aktif
- [ ] Rating store
- [ ] 1 tantangan teknis tersulit + cara kamu menyelesaikannya
- [ ] Hasil terukur (performa, waktu rilis, dll.)

### B3. Proyek tambahan — ☐
Kamu bilang masih banyak yang belum masuk. Per proyek, format sama dengan yang sudah ada:
- [ ] Nama, kategori, framework, tahun
- [ ] Link Play Store / App Store / website (atau tandai "diarsipkan")
- [ ] Ringkasan 2–3 kalimat + 3–5 poin highlight
- [ ] Peran & eksekusi teknis (3–5 poin)
- [ ] Ikon app (PNG 512×512)
- [ ] 3–6 screenshot portrait (minimal 1080 px lebar)
- [ ] Gambar cover landscape (opsional, 16:9)

### B4. Testimoni — ☐
- [ ] Nama, jabatan, perusahaan
- [ ] Kutipan 1–3 kalimat
- [ ] Foto (opsional) — **pastikan sudah izin** dari orangnya

### B5. Pendidikan & sertifikat — ☐
- [ ] Kampus/institusi, jurusan, tahun
- [ ] Sertifikat: nama, penerbit, tahun, link verifikasi

### B6. Tulisan, talk, atau open source — ☐
- [ ] Judul, tempat terbit/acara, tanggal, link

### B7. CV — ◐
Saat ini tombol "View CV" membuka `assets/cv/cv.html`.
- [ ] Versi PDF terbaru (kalau mau bisa diunduh langsung)
- [ ] Cek isi `cv.html` masih sesuai

### B8. Perbaikan data yang sudah ada — ☐
- [x] Link web Badjetin: domain lama `badjetin.web.id` & `badjetin.app` tidak aktif → diganti `app.badjetin.my.id` (web app) dan `badjetin.my.id/en/` (situs), sesuai proyek Badjetin
- [x] Screenshot AI Care & Tjar diambil dari Google Play (Nov 2026)
- [x] Badjetin: screenshot & teks diperbarui dari folder proyek (store export 6 Nov 2026, v1.1.0)
- [ ] App Store (iOS): angka/screenshot belum diambil
- [ ] Deskripsi proyek mau diterjemahkan ke Bahasa Indonesia juga? (UI sudah dwibahasa, isi proyek masih Inggris)

---

## C. Keputusan yang perlu kamu ambil

| Topik | Pilihan |
|---|---|
| Form kontak di situs | Tetap pakai email (sekarang) · atau form (butuh layanan seperti Formspree / Firebase Function) |
| Analytics pengunjung | Tidak ada (sekarang) · Firebase Analytics (perlu banner persetujuan cookie) |
| Domain sendiri | Tetap `midosaurus.web.app` · atau domain sendiri (mis. `mido.dev`) |

---

## Format kirim data

Paling mudah: kirim per bagian (mis. "B1 pengalaman kerja") dalam teks biasa
atau tabel, plus gambar dalam satu folder. Data akan dimasukkan ke
`lib/data/portfolio_data.dart` dan section-nya otomatis muncul.
