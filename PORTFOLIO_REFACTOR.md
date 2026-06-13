# Portfolio Refactor Brief
> Prompt ini untuk Claude Code. Copy paste langsung, jangan dimodif sebelum dibaca tuntas.
> Fokus: konten, hierarki visual, dan UX — bukan arsitektur kode.

---

## Konteks current state

Portfolio Flutter web sudah live. Layout Deep Space sudah diterapkan.
Yang perlu direfactor adalah **konten, struktur section, dan kualitas copywriting**.
Jangan ubah color token, font, spacing constants yang sudah ada.

---

## Keputusan yang sudah dibuat (jangan didiskusikan lagi)

1. **Hapus translation toggle (ID/EN)** — tidak perlu, portfolio ini untuk audiens global, bahasa Inggris saja. Hapus widget dan logic-nya sepenuhnya.
2. **Semua 6 project tetap tampil** — tidak perlu pagination atau filter.
3. **Section "Services" diganti total** — lihat brief di bawah.

---

## Perubahan per section

---

### NAVBAR

**Hapus:**
- Toggle bahasa `ID` — remove widget, route, dan state-nya

**Pertahankan:**
- Logo `mido`
- Dark mode toggle
- Available badge
- Nav links (jika ada)

---

### HERO SECTION

**Masalah sekarang:**
- Desc terlalu panjang (3 baris padat) → susah di-scan
- Stat row `7+` / `10+` / `3` terlalu generic

**Ubah hero desc** dari paragraf panjang menjadi 1 baris ringkas:

```
// mobile application developer

Hi, I'm Agus Rakhmadi Mido

Crafting production-ready mobile apps across Flutter, React Native,
and Android Native — from architecture to store release.
```

Desc cukup 1–2 baris. Domain expertise dipindah ke section tersendiri (lihat bagian baru di bawah).

**Ubah stat row** dari generic ke spesifik dan bercerita:

| Sekarang | Ganti jadi |
|---|---|
| `7+` years experience | `7+` years |
| `10+` projects shipped | `6` live on stores |
| `3` platforms | `4` domains |

Label baru:
- `7+` → **years** (tetap)
- `6` → **live on stores** ← lebih jujur dan justru lebih impressive dari "10+"
- `4` → **domains** (AI Chat · Fintech · Telemedicine · E-Commerce)

> Rationale: "6 live on stores" lebih kredibel dari "10+ projects shipped" karena
> ada bukti nyata. "4 domains" menunjukkan breadth of experience.

---

### SECTION BARU — DOMAIN EXPERTISE
> Posisi: antara Hero dan Featured Projects

Section kecil, tidak perlu judul besar. Tampilkan sebagai row of chips/tags.

```
// what i build for

[  AI Chat  ]  [  Fintech  ]  [  Telemedicine  ]  [  E-Commerce  ]  [  Real-time  ]
```

Spec komponen:
- Chip style: border 0.5px `borderAccent`, background `bgTag`, text `textSecondary`
- Font: JetBrains Mono 11px
- Layout: Wrap, spacing 8px
- Tidak ada hover effect — ini purely informational

---

### FEATURED PROJECTS

**Ubah label section:**
```
Sekarang : Featured Projects
Ganti    : // selected works
Sub-label: "6 projects · live on App Store & Play Store"
           font: JetBrains Mono 10px, color: textMuted
           posisi: di bawah section label, margin-bottom 14px
```

Sub-label ini penting — visitor langsung tahu ini bukan semua project kamu,
dan semua yang ditampilkan adalah live. Terlihat lebih profesional.

**Tidak ada perubahan lain di project cards** — layout dan konten sudah baik.

---

### SECTION "SERVICES" — REFACTOR TOTAL

**Masalah sekarang:**
- Title "Services" duplikasi dengan section label `// services`
- Desc paragraf panjang di atas card → redundan dengan hero
- Card titles terdengar seperti CV lama: "Accurate Design Implementation", "Creative Problem-Solving"
- Card desc menggunakan "I" berulang → terasa informal dan kurang confident
- Icon terlalu besar dan tidak konsisten

**Ganti seluruh section ini menjadi: `// how i work`**

Konsepnya bukan "services yang aku jual" tapi "cara kerja dan nilai yang aku bawa".
Ini lebih authentic dan membedakan dari portfolio generik.

**Hapus** desc paragraf di atas card sepenuhnya.

**4 card baru — konten:**

```
Card 1
icon  : terminal / code icon
title : Pixel-perfect Implementation
desc  : Translating Figma designs to Flutter with exact spacing, 
        typography, and interaction — down to the last dp.

Card 2
icon  : layers / architecture icon  
title : Clean Architecture
desc  : Every project structured with separation of concerns —
        feature modules, clear data flow, and zero spaghetti.

Card 3
icon  : device mobile icon
title : Cross-platform by Default
desc  : Flutter, React Native, Android Native — shipped to both
        stores with CI/CD via Fastlane and GitHub Actions.

Card 4
icon  : refresh / cycle icon
title : From Zero to Store
desc  : Not just code — architecture decisions, release pipeline,
        and post-launch maintenance included.
```

**Spec perubahan visual card:**
- Hapus icon besar di atas — ganti dengan icon kecil 16px inline di sebelah title
- Title: `cardTitle` style (Space Grotesk w500, textPrimary, 13px)
- Desc: `cardDesc` style (Space Grotesk w400, textMuted, 11px, height 1.5)
- Tambah top accent line 2px (blue600) sama seperti ProjectCard
- Background, border, radius: ikut design system yang sudah ada (bgCard, border, 12px)
- Hapus `...` truncation — tampilkan full desc

---

### SECTION BARU — TECH STACK
> Posisi: antara "selected works" dan "how i work"

Ini missing dan sangat dibutuhkan. Visitor (terutama recruiter/klien teknis)
ingin tahu tech stack sebelum membaca project detail.

**Layout:** grid 3 kolom (desktop) / 2 kolom (tablet) / 1 kolom (mobile)

**Items (12 total, 2 row × 6 atau 3 row × 4):**

```
Flutter          — primary framework
Dart             — primary language  
React Native     — cross-platform
Android Native   — native android
Riverpod         — state management
BLoC             — state management
Firebase         — backend · auth · hosting
Supabase         — postgres · realtime
GoRouter         — navigation
Melos            — monorepo tooling
Fastlane         — ci/cd automation
GitHub Actions   — ci/cd pipeline
```

Gunakan komponen `StackCard` sesuai design system yang sudah ada.
Tidak perlu menambahkan komponen baru.

---

### CONTACT SECTION

Tidak ada perubahan struktural. Hanya update copy jika masih generik:

```
Label  : "Open to new projects"   (bukan "Let's build something together")
Sub    : "Available for freelance and full-time remote roles"
Email  : [email kamu]
Links  : GitHub · LinkedIn · CV
```

---

## Urutan eksekusi yang disarankan

Lakukan satu per satu, commit per section, jangan sekaligus:

```
1. Hapus translation toggle (ID) — paling cepat, tidak ada dependency
2. Update hero desc + stat row
3. Tambah domain expertise chips (section baru, kecil)
4. Update label "Featured Projects" → "selected works" + sub-label
5. Refactor section Services → "how i work"
6. Tambah tech stack section
7. Update contact copy
```

---

## Hal yang JANGAN diubah

- Color tokens (`AppColors.*`) — sudah sesuai design system
- Font pairing Space Grotesk + JetBrains Mono — pertahankan
- Spacing constants — pertahankan
- Struktur ProjectCard — sudah baik
- Available badge di navbar — pertahankan
- Dark mode toggle — pertahankan

---

## Jawaban: apakah translation (ID/EN) perlu dipertahankan?

**Tidak perlu. Hapus.**

Alasannya:
- Portfolio developer ditujukan ke hiring manager, klien, dan recruiter — mayoritas
  berkomunikasi dalam bahasa Inggris meskipun kamu berbasis di Indonesia
- Toggle bahasa menambah complexity UX tanpa nilai yang sebanding
- Konten dalam dua bahasa artinya dua kali maintenance setiap kali ada update
- Tidak ada signal di portfolio ini yang mengindikasikan target audiens lokal Indonesia

Simpan energinya untuk konten yang lebih impactful.

---

*Brief version: 1.0*
