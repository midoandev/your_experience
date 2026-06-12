# Token Audit — 2026-06-12

## Duplicate Theme Files
Dua set theme file aktif: `core/theme/` (digunakan view files utama) dan `core/ui/theme/` (legacy, tidak diimport view manapun). Ini sumber inkonsistensi — dua `app_colors.dart` dan dua `app_theme.dart` dengan definisi berbeda.

---

## Hardcoded Colors

- `lib/features/splash/view/splash_page.dart:27` — `Colors.white` (scaffold bg)
- `lib/features/home/view/home_page.dart:99` — `const Color(0xFF040E0C)` (available badge bg, bukan dari AppColors)
- `lib/features/portfolio/view/portfolio_section.dart:137` — `const Color(0xFF040E0C)` (pill tag teal bg, bukan dari AppColors)
- `lib/core/ui/widgets/button_inkwell.dart:18` — `Colors.transparent` (Material color)
- `lib/core/ui/widgets/image_default.dart:33, 43` — `Colors.grey.shade300` (error placeholder)
- `lib/core/ui/widgets/image_default.dart:18` — `borderCircular = 0` (default param literal, bukan dari AppRadius)

---

## Hardcoded Spacing

- `lib/features/splash/view/splash_page.dart:32` — `SizedBox(height: 24)`
- `lib/features/splash/view/splash_page.dart:37` — `SizedBox(height: 16)`
- `lib/features/splash/view/splash_page.dart:40` — `SizedBox(height: 8)`
- `lib/features/home/view/home_page.dart:36-37` — `EdgeInsets.only(top: 28, bottom: 28)` (inline angka)
- `lib/features/home/view/home_page.dart:97` — `EdgeInsets.symmetric(horizontal: 12, vertical: 4)`
- `lib/features/home/view/home_page.dart:144` — `EdgeInsets.symmetric(horizontal: 20, vertical: 18)`
- `lib/features/home/view/home_page.dart:186` — `EdgeInsets.symmetric(horizontal: 16, vertical: 7)`
- `lib/features/home_hero/view/hero_section.dart:20` — `EdgeInsets.only(top: 60, ...)` (60 tidak ada di AppLayout/AppSpacing)
- `lib/features/home_hero/view/hero_section.dart:130-131` — `EdgeInsets.symmetric(vertical: AppLayout.btnPadV, horizontal: AppLayout.btnPadH)` → OK (pakai token)
- `lib/features/portfolio/view/portfolio_section.dart:88` — `SizedBox(height: 5)` (tidak ada di AppSpacing/AppLayout)
- `lib/features/portfolio/view/portfolio_section.dart:116` — `spacing: 5, runSpacing: 5` (Wrap gap dalam pill row)
- `lib/features/portfolio/view/portfolio_section.dart:135-136` — `EdgeInsets.symmetric(horizontal: 8, vertical: 3)` (pill padding)
- `lib/features/portfolio/view/portfolio_section.dart:142` — `borderRadius: BorderRadius.circular(8)` (pakai angka 8 bukan AppRadius.circularMd)
- `lib/features/portfolio_detail/view/portfolio_detail_page.dart:36-38` — `EdgeInsets.symmetric(horizontal: 16 atau 100, vertical: 24)` (inline angka)
- `lib/features/portfolio_detail/view/portfolio_detail_page.dart:39` — `columnSpacing: 24 atau 60` (inline angka)
- `lib/features/portfolio_detail/view/portfolio_detail_page.dart:54` — `EdgeInsets.all(16)` (back button padding)
- `lib/features/portfolio_detail/view/portfolio_detail_page.dart:82-84` — `EdgeInsets.symmetric(horizontal: 16)` (image padding dalam ListView)
- `lib/features/portfolio_detail/view/portfolio_detail_page.dart:115` — `context.screenHeight * (isSmallerThanDesktop ? .5 : .9)` (hardcoded multiplier)
- `lib/features/portfolio_detail/view/portfolio_detail_page.dart:173` — `height: 400` (image list container)
- `lib/features/portfolio_detail/view/portfolio_detail_page.dart:181` — `height: 250, width: 210` (image item dimensi)
- `lib/features/portfolio_detail/view/portfolio_detail_page.dart:262` — `EdgeInsets.symmetric(horizontal: 8)` (pipe separator padding)
- `lib/features/workspace/editor_content/view/editor_content_page.dart:20` — `Size.fromHeight(isSmallerThanDesktop ? 169 : 98)`
- `lib/features/workspace/editor_content/view/editor_content_page.dart:24` — `EdgeInsets.all(16)`

---

## Font Size / TextStyle Inline (copyWith)

Tidak ada `fontSize` literal di view files — semua fontSize sudah dari `AppTextStyles` atau `context.textTheme`. Tapi ada `copyWith` override yang bypass token system:

- `lib/features/portfolio_detail/view/portfolio_detail_page.dart:62-66` — `context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w300, color: ...)` (override fontWeight & color inline)
- `lib/features/portfolio_detail/view/portfolio_detail_page.dart:76-78` — `context.textTheme.displayLarge?.copyWith(letterSpacing: 3)` (override letterSpacing)
- `lib/features/portfolio_detail/view/portfolio_detail_page.dart:239-243` — `context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w300, color: ...)` (override fontWeight & color)
- `lib/features/portfolio_detail/view/portfolio_detail_page.dart:266-269` — `context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w300, color: ...)` (override fontWeight & color)

---

## Radius Hardcoded

- `lib/features/portfolio/view/portfolio_section.dart:142` — `BorderRadius.circular(8)` → AppRadius.circularMd (8)
- `lib/features/portfolio_detail/view/portfolio_detail_page.dart:116` — `borderCircular: 16` → AppRadius.circularLg (16)
- `lib/features/portfolio_detail/view/portfolio_detail_page.dart:183` — `borderCircular: 6` → tidak ada di AppRadius (definisi baru perlu)
- `lib/core/ui/widgets/image_default.dart:18, 27` — `borderCircular` parameter default `0` dan `BorderRadius.circular(borderCircular)` — parameter-nya sendiri OK, tapi callers passing literal

---

## Summary

| Kategori | Jumlah Temuan | File Terbanyak |
|---|---|---|
| Hardcoded Colors | 6 | image_default.dart, home_page.dart, portfolio_section.dart |
| Hardcoded Spacing | 21+ | portfolio_detail_page.dart (11), home_page.dart (4), splash_page.dart (3) |
| Font Size Inline | 0 langsung, 4 copyWith override | portfolio_detail_page.dart |
| Radius Hardcoded | 4 | portfolio_detail_page.dart, portfolio_section.dart, image_default.dart |
| Duplicate Theme | 2 set file | core/theme/ vs core/ui/theme/ |

Prioritas: `portfolio_detail_page.dart` paling banyak pelanggaran. Selanjutnya `portfolio_section.dart` dan `home_page.dart`. Sementara `core/ui/theme/` perlu di-cleanup (duplicate dari `core/theme/`).
