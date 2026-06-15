# Portfolio — Deep Space Design System
> Single source of truth untuk implementasi desain Flutter web portfolio.
> Fokus: warna, tipografi, spacing, komponen, dan responsive rules.
> Pattern, state management, dan data layer **tidak** dibahas di sini.

---

## 1. Color tokens

Semua warna didefinisikan sebagai `static const` di `AppColors`. Tidak boleh ada hardcode hex di luar file ini.

```dart
// lib/core/theme/app_colors.dart

abstract class AppColors {
  // Background hierarchy
  static const bgPrimary   = Color(0xFF050D1A); // scaffold background
  static const bgCard      = Color(0xFF07111F); // semua card surface
  static const bgCardHover = Color(0xFF091525); // state hover card
  static const bgTag       = Color(0xFF060F1E); // badge/pill background

  // Border hierarchy
  static const border      = Color(0xFF0E1F36); // border default (semua card, divider)
  static const borderAccent= Color(0xFF0C447C); // border saat hover / accent outline

  // Blue ramp — primary accent
  static const blue900 = Color(0xFF042C53);
  static const blue800 = Color(0xFF0C447C);
  static const blue600 = Color(0xFF185FA5); // tombol primary, top-accent card
  static const blue400 = Color(0xFF378ADD); // stat number, nama, link
  static const blue200 = Color(0xFF85B7EB); // logo, email, text highlight
  static const blue100 = Color(0xFFB5D4F4); // teks pada bgPrimary (tombol primary)

  // Teal ramp — secondary accent
  static const teal600 = Color(0xFF0F6E56); // top-accent card secondary
  static const teal400 = Color(0xFF1D9E75); // dot available, stat badge
  static const teal200 = Color(0xFF5DCAA5); // eyebrow, available label, tag teal

  // Text hierarchy
  static const textPrimary  = Color(0xFFC8DFF5); // heading, card title
  static const textSecondary= Color(0xFF85A8C8); // desc, subtitle (lebih terang dari muted)
  static const textMuted    = Color(0xFF3A5A7A); // placeholder, meta, card desc
  static const textDisabled = Color(0xFF1E3A52);

  // Semantic
  static const success = teal400;
  static const info    = blue400;
}
```

**Aturan penggunaan warna:**
- `bgPrimary` → hanya untuk `Scaffold` background
- `bgCard` → semua `DecoratedBox` / `Container` card
- `border` → semua `Border` default, `Divider`
- `blue600` → CTA button primary, top accent line card featured
- `blue400` → angka stat, link, nama di hero
- `teal200` → eyebrow text, available badge, pill teal
- Jangan gunakan warna putih murni (`0xFFFFFFFF`) di mana pun

---

## 2. Typography

Font: **Space Grotesk** (heading + body) + **JetBrains Mono** (code, label, badge, logo).

```yaml
# pubspec.yaml — dependencies
dependencies:
  google_fonts: ^6.2.1
```

```dart
// lib/core/theme/app_text_styles.dart
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {
  // — Space Grotesk —
  static final heroName = GoogleFonts.spaceGrotesk(
    fontSize: 36, fontWeight: FontWeight.w500,
    color: AppColors.textPrimary, height: 1.15,
  );
  static final heroNameAccent = GoogleFonts.spaceGrotesk(
    fontSize: 36, fontWeight: FontWeight.w500,
    color: AppColors.blue400, height: 1.15,
  );
  static final heroDesc = GoogleFonts.spaceGrotesk(
    fontSize: 13, fontWeight: FontWeight.w400,
    color: AppColors.textMuted, height: 1.6,
  );
  static final cardTitle = GoogleFonts.spaceGrotesk(
    fontSize: 13, fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );
  static final cardDesc = GoogleFonts.spaceGrotesk(
    fontSize: 11, fontWeight: FontWeight.w400,
    color: AppColors.textMuted, height: 1.5,
  );
  static final sectionHeading = GoogleFonts.spaceGrotesk(
    fontSize: 13, fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );
  static final navLink = GoogleFonts.spaceGrotesk(
    fontSize: 12, fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );
  static final statNumber = GoogleFonts.jetBrainsMono(
    fontSize: 22, fontWeight: FontWeight.w500,
    color: AppColors.blue400,
  );
  static final statLabel = GoogleFonts.spaceGrotesk(
    fontSize: 11, fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );
  static final btnPrimary = GoogleFonts.spaceGrotesk(
    fontSize: 12, fontWeight: FontWeight.w400,
    color: AppColors.blue100,
  );
  static final btnGhost = GoogleFonts.spaceGrotesk(
    fontSize: 12, fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  // — JetBrains Mono —
  static final logoText = GoogleFonts.jetBrainsMono(
    fontSize: 13, fontWeight: FontWeight.w400,
    color: AppColors.blue200, letterSpacing: 1,
  );
  static final eyebrow = GoogleFonts.jetBrainsMono(
    fontSize: 11, fontWeight: FontWeight.w400,
    color: AppColors.teal200, letterSpacing: 0.8,
  );
  static final sectionLabel = GoogleFonts.jetBrainsMono(
    fontSize: 10, fontWeight: FontWeight.w400,
    color: AppColors.blue600, letterSpacing: 1,
  );
  static final cardTag = GoogleFonts.jetBrainsMono(
    fontSize: 10, fontWeight: FontWeight.w400,
    color: AppColors.blue600, letterSpacing: 0.5,
  );
  static final pillBlue = GoogleFonts.jetBrainsMono(
    fontSize: 10, fontWeight: FontWeight.w400,
    color: AppColors.blue200,
  );
  static final pillTeal = GoogleFonts.jetBrainsMono(
    fontSize: 10, fontWeight: FontWeight.w400,
    color: AppColors.teal200,
  );
  static final availLabel = GoogleFonts.jetBrainsMono(
    fontSize: 11, fontWeight: FontWeight.w400,
    color: AppColors.teal200,
  );
  static final emailText = GoogleFonts.jetBrainsMono(
    fontSize: 13, fontWeight: FontWeight.w400,
    color: AppColors.blue200,
  );
  static final contactLink = GoogleFonts.jetBrainsMono(
    fontSize: 11, fontWeight: FontWeight.w400,
    color: AppColors.blue200,
  );
}
```

**Aturan tipografi:**
- Heading dan body → Space Grotesk
- Logo, label section (`// featured projects`), badge, pill, stat number → JetBrains Mono
- `fontSize` minimum: **10px** (pill/label). Tidak ada teks di bawah 10px
- `fontWeight` yang dipakai: **w400** dan **w500** saja. Tidak ada w600/w700
- Semua label section diawali prefix `//` + spasi: `// featured projects`

---

## 3. Spacing & layout constants

```dart
// lib/core/theme/app_layout.dart

abstract class AppLayout {
  // Breakpoints
  static const double bpMobile  = 390;
  static const double bpTablet  = 768;
  static const double bpDesktop = 1200;

  // Page padding (horizontal)
  static const double pagePadMobile  = 16;
  static const double pagePadTablet  = 28;
  static const double pagePadDesktop = 40;

  // Max content width
  static const double maxWidth = 1100;

  // Section gap (vertikal antar section)
  static const double sectionGap = 32;

  // Card
  static const double cardPad     = 16;    // padding dalam card
  static const double cardPadH    = 20;    // padding horizontal card besar
  static const double cardRadius  = 12;
  static const double cardBorder  = 0.5;
  static const double cardGap     = 12;    // gap antar card dalam grid

  // Nav
  static const double navHeight   = 52;
  static const double navPadH     = 28;

  // Divider
  static const double dividerThick = 0.5;

  // Accent top border card
  static const double accentLineH  = 2;

  // Button
  static const double btnRadius    = 20;   // fully rounded pill
  static const double btnPadV      = 9;
  static const double btnPadH      = 22;
  static const double btnGapH      = 10;   // gap antara dua tombol

  // Stat row
  static const double statGapH     = 24;
  static const double statTopPad   = 20;

  // Stack card icon size
  static const double stackIconSize = 28;
  static const double stackIconRadius = 8;
}
```

---

## 4. AppTheme

```dart
// lib/core/theme/app_theme.dart

class AppTheme {
  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.bgPrimary,
    colorScheme: const ColorScheme.dark(
      primary:   AppColors.blue600,
      secondary: AppColors.teal400,
      surface:   AppColors.bgCard,
      onSurface: AppColors.textPrimary,
    ),
    dividerColor: AppColors.border,
    dividerTheme: const DividerThemeData(
      color: AppColors.border,
      thickness: AppLayout.dividerThick,
      space: AppLayout.sectionGap,
    ),
    textTheme: GoogleFonts.spaceGroteskTextTheme().apply(
      bodyColor: AppColors.textPrimary,
      displayColor: AppColors.textPrimary,
    ),
  );
}
```

---

## 5. Responsive helper

```dart
// lib/core/theme/responsive.dart

enum ScreenSize { mobile, tablet, desktop }

class Responsive {
  static ScreenSize of(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    if (w >= AppLayout.bpDesktop) return ScreenSize.desktop;
    if (w >= AppLayout.bpTablet)  return ScreenSize.tablet;
    return ScreenSize.mobile;
  }

  static bool isMobile(BuildContext context) =>
      of(context) == ScreenSize.mobile;

  static T value<T>(BuildContext context, {
    required T mobile,
    required T tablet,
    required T desktop,
  }) {
    return switch (of(context)) {
      ScreenSize.mobile  => mobile,
      ScreenSize.tablet  => tablet,
      ScreenSize.desktop => desktop,
    };
  }
}
```

---

## 6. Komponen — spec lengkap

### 6.1 Navbar

```
Height     : 52px
Padding    : 0 28px (mobile: 0 16px, hamburger icon muncul)
Background : bgPrimary (bukan bgCard)
Border-bot : 0.5px, warna border
Position   : SliverAppBar, pinned: true, floating: false

Desktop/Tablet:
  - Kiri  : logo "mido.dev" — logoText style
  - Tengah: Row nav links (about · projects · stack · contact) — navLink style
             gap antar link: 24px
             hover: warna blue200
  - Kanan : AvailableBadge widget

Mobile:
  - Kiri  : logo
  - Kanan : IconButton(icon: Icon(Icons.menu), color: textMuted)
             Tap → buka Drawer
  - Sembunyikan nav links dan available badge
```

**AvailableBadge widget:**
```
Container:
  padding   : 4px 12px
  background: Color(0xFF040E0C)  ← bgTag teal
  border    : 0.5px, teal600
  radius    : 20px (pill)
  child     : Row [
    Container(8x8, radius 50%, color teal400)  ← dot
    SizedBox(w: 6)
    Text("available", style: availLabel)
  ]
```

---

### 6.2 Hero section

```
Padding    : section padding (lihat 6.0)
Max-width  : 480px untuk desc text (desktop), unlimited mobile

Urutan vertikal (gap antar elemen):
  eyebrow text   — "// flutter & mobile developer"   — gap bawah: 12px
  hero name      — "Hi, I'm [Nama]"                  — gap bawah: 8px
  hero desc      — satu paragraf, max 2 baris desktop— gap bawah: 20px
  CTA row        — dua tombol                        — gap bawah: 0
  stat row       — border-top 0.5px border, pad-top 20px

Hero name → RichText:
  "Hi, I'm " → TextSpan(style: heroName)
  "[Nama]"   → TextSpan(style: heroNameAccent)  ← blue400

CTA row:
  ButtonPrimary + ButtonGhost
  gap: 10px
  Mobile: mainAxisAlignment = start, tidak full-width

Stat row:
  Desktop/Tablet : Row, gap 24px, mainAxisAlignment: start
  Mobile         : Wrap, spacing 16px, runSpacing 8px
  Tiap stat: Column [
    Text(angka, style: statNumber)   ← JetBrains Mono, blue400
    Text(label, style: statLabel)
  ]
```

---

### 6.3 Button components

**ButtonPrimary:**
```
Background : blue600
Radius     : 20px (pill)
Padding    : 9px 22px
Text style : btnPrimary (spaceGrotesk w400, blue100, 12px)
Hover      : background → blue800
Splash     : transparent (InkWell splashColor: Colors.transparent)
```

**ButtonGhost:**
```
Background : transparent
Border     : 0.5px, border (0xFF0E1F36)
Radius     : 20px (pill)
Padding    : 9px 22px
Text style : btnGhost (spaceGrotesk w400, textMuted, 12px)
Hover      : border-color → borderAccent (blue800)
             text-color  → blue200
```

---

### 6.4 Divider

```dart
const Divider(
  color: AppColors.border,
  thickness: 0.5,
  height: AppLayout.sectionGap * 2,  // space atas + bawah
);
```

---

### 6.5 Section label

```dart
// Selalu diawali "// " + nama section lowercase
Text('// featured projects', style: AppTextStyles.sectionLabel)
// margin bawah: 14px
```

---

### 6.6 ProjectCard

```
Container:
  background : bgCard
  border     : 0.5px, border
  radius     : 12px
  padding    : 16px
  clip       : true (ClipRRect untuk accent line)

Accent line (top):
  Position   : Stack, Positioned(top:0, left:0, right:0)
  Height     : 2px
  Color      : blue600 (featured) / teal600 (secondary) / blue800 (dim)

Urutan konten (gap antar: 0, pakai SizedBox):
  accent line (via Stack)
  SizedBox(h: 10)
  Text(tag, style: cardTag)            ← "flutter · web + mobile"
  SizedBox(h: 8)
  Text(title, style: cardTitle)
  SizedBox(h: 5)
  Text(desc, style: cardDesc)
  SizedBox(h: 12)
  TagRow widget

TagRow:
  Wrap, spacing: 5px, runSpacing: 5px
  Tiap item: PillTag widget

PillTag:
  padding   : 3px 8px
  radius    : 8px
  Varian blue:
    border    : 0.5px, blue800
    background: bgTag (0xFF060F1E)
    text      : pillBlue style
  Varian teal:
    border    : 0.5px, teal600
    background: Color(0xFF040E0C)
    text      : pillTeal style
```

**ProjectGrid responsive:**
```
LayoutBuilder → constraints.maxWidth:
  >= bpDesktop : crossAxisCount 3
  >= bpTablet  : crossAxisCount 2
  < bpTablet   : crossAxisCount 1

GridView.count:
  crossAxisSpacing : 12
  mainAxisSpacing  : 12
  childAspectRatio : disesuaikan konten (gunakan shrinkWrap + NeverScrollablePhysics)
```

---

### 6.7 StackCard (tech stack)

```
Container:
  background : bgCard
  border     : 0.5px, border
  radius     : 10px
  padding    : 12px 14px

Layout: Row [
  icon box (28x28, radius 8px, bg: Color(0xFF0A1A2E), border 0.5px border)
  SizedBox(w: 10)
  Column [
    Text(name, style: cardTitle)
    Text(category, style: cardTag)  ← "primary framework"
  ]
]

Icon di dalam icon box:
  Icon Flutter-related dari Icons atau custom SVG 20px
  Color: blue400 (framework/infra) atau teal200 (backend/tooling)
```

**StackGrid responsive:** sama dengan ProjectGrid.

---

### 6.8 ContactBar

```
Container:
  background : bgCard
  border     : 0.5px, border
  radius     : 12px
  padding    : 18px 20px

Layout: Row (desktop) / Column (mobile) [
  Column [
    Text("Let's build something together", style: cardDesc)
    SizedBox(h: 4)
    Text(email, style: emailText)
  ]
  Spacer() (desktop) / SizedBox(h:12) (mobile)
  Row contact links
]

ContactLink (tiap tombol):
  padding   : 7px 16px
  background: bgTag (0xFF060F1E)
  border    : 0.5px, borderAccent (blue800)
  radius    : 20px
  text      : contactLink style
```

---

## 7. Layout page structure

```
Scaffold(
  backgroundColor: AppColors.bgPrimary,
  body: CustomScrollView(
    physics: BouncingScrollPhysics(),
    slivers: [
      SliverAppBar(
        pinned: true,
        backgroundColor: AppColors.bgPrimary,
        elevation: 0,
        toolbarHeight: AppLayout.navHeight,
        title: NavBar(),
        titleSpacing: 0,
      ),
      SliverPadding(
        padding: EdgeInsets.symmetric(
          horizontal: pagePad,   // dari Responsive.value()
          vertical: 28,
        ),
        sliver: SliverList(
          delegate: SliverChildListDelegate([
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: AppLayout.maxWidth),
                child: Column(children: [
                  HeroSection(),
                  Divider(...),
                  SectionLabel('// featured projects'),
                  SizedBox(h: 14),
                  ProjectGrid(projects: data),
                  Divider(...),
                  SectionLabel('// tech stack'),
                  SizedBox(h: 14),
                  StackGrid(stacks: data),
                  SizedBox(h: AppLayout.sectionGap),
                  ContactBar(),
                  SizedBox(h: 32),
                ]),
              ),
            ),
          ]),
        ),
      ),
    ],
  ),
)
```

---

## 8. Aturan hover & interaksi web

```dart
// Semua card dan tombol interaktif pakai MouseRegion + StatefulWidget
// Contoh pattern:

class _HoverCard extends StatefulWidget { ... }

class _HoverCardState extends State<_HoverCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.bgCardHover : AppColors.bgCard,
          border: Border.all(
            color: _hovered ? AppColors.borderAccent : AppColors.border,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(AppLayout.cardRadius),
        ),
        child: ...,
      ),
    );
  }
}
```

**Aturan hover:**
- Card hover: bg `bgCard` → `bgCardHover`, border `border` → `borderAccent`
- Tombol ghost hover: border + text color → blue200
- Nav link hover: color → blue200
- Duration animasi: selalu `150ms`, curve: `Curves.easeInOut`
- Gunakan `AnimatedContainer` bukan manual `Transform`

---

## 9. Aturan DO / DON'T

| DO | DON'T |
|---|---|
| Gunakan `AppColors.*` selalu | Hardcode hex di widget |
| `AppTextStyles.*` untuk semua text | Override fontSize inline |
| `Responsive.value()` untuk adaptive layout | `if (width > 768)` tersebar di mana-mana |
| `ConstrainedBox(maxWidth: 1100)` di page | Biarkan konten full-width tak terbatas |
| `AnimatedContainer` 150ms untuk hover | `setState` rebuild keseluruhan tree |
| Prefix `//` untuk semua section label | Title case atau uppercase section label |
| `MouseRegion` di semua element interaktif | Abaikan hover state di web |
| `SliverAppBar` pinned untuk navbar | `AppBar` biasa (tidak sticky saat scroll) |
| Hanya weight w400 dan w500 | Gunakan w600/w700/bold |
| Teks minimum 10px | Font size di bawah 10px |

---

## 10. File structure (design-related only)

```
lib/
└── core/
    └── theme/
        ├── app_colors.dart       ← semua warna
        ├── app_text_styles.dart  ← semua text style
        ├── app_layout.dart       ← spacing, breakpoint, radius constants
        ├── app_theme.dart        ← ThemeData
        └── responsive.dart       ← Responsive helper + ScreenSize enum
```

---

*Versi: 1.0 — Deep Space portfolio design system*
