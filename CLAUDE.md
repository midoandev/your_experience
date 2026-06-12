# Your Experience — Portfolio Website

## Project Overview

Portfolio website pribadi — **Flutter Web**, diakses via browser dari HP/tablet/desktop.

**Stack:**
- Flutter Web (single target — no native mobile)
- Riverpod + Riverpod Generator (state management, DI)
- GoRouter (routing)
- responsive_framework (responsive layout)
- flex_color_scheme + Google Fonts (Outfit/Jost)
- shared_preferences (theme persistence)
- universal_html (web-safe file download)
- intl + ARB (localization)

**NOT GetX.** Zero `Get.`, `Obx`, `GetxController`, `Bindings`.

---

## Architecture — MVVM Sederhana

Aplikasi kecil, semua data lokal hardcoded. Pakai **MVVM** (Model-View-ViewModel):

```
feature/
├── model/         ← Data object (pure Dart, no Flutter)
├── view_model/    ← Riverpod Notifier, pegang state + logic
└── view/          ← ConsumerWidget, render UI
```

### 3 Layer Rule

```
View → ViewModel → Model
 |         |         |
 Widget   Notifier   Data class
 (UI)     (state +   (pure Dart)
          business
          logic)
```

- **View** boleh tahu ViewModel dan Model
- **ViewModel** boleh tahu Model, TIDAK boleh tahu View (widget)
- **Model** TIDAK boleh tahu siapapun
- Antar **feature tidak boleh saling import** langsung — sharing via ViewModel parent atau core

---

## Struktur Folder Lengkap

```
lib/
├── main.dart
├── app.dart                              ← MaterialApp.router
│
├── core/
│   ├── ui/
│   │   ├── tokens/
│   │   │   ├── app_spacing.dart          ← spacing konstanta
│   │   │   ├── app_radius.dart           ← radius konstanta
│   │   │   └── app_duration.dart         ← animasi durasi
│   │   ├── theme/
│   │   │   ├── app_theme.dart            ← seed-based ThemeData
│   │   │   ├── app_colors.dart           ← brand seed color
│   │   │   └── app_text_theme.dart       ← GoogleFonts Outfit + Jost
│   │   ├── extensions/
│   │   │   └── context_ext.dart          ← BuildContext extension
│   │   └── widgets/
│   │       ├── button_inkwell.dart
│   │       ├── image_default.dart
│   │       └── custom_switch.dart
│   ├── router/
│   │   └── app_router.dart               ← GoRouter
│   ├── l10n/
│   │   ├── app_en.arb
│   │   └── app_id.arb
│   └── services/
│       └── storage_service.dart          ← SharedPreferences wrapper
│
├── data/
│   ├── portfolio_data.dart               ← Semua data hardcoded (menu, profile, projects, services, contacts)
│   └── icon_mapper.dart                  ← String → IconData mapping
│
└── features/
    ├── splash/
    │   ├── view/splash_page.dart
    │   └── view_model/splash_vm.dart
    ├── home/
    │   ├── view/home_page.dart
    │   └── view_model/home_vm.dart          ← Root VM: pegang menu, profile, theme, scroll
    ├── home_hero/                           ← (ex home_page/)
    │   ├── view/hero_section.dart
    │   └── view_model/hero_vm.dart
    ├── services/
    │   ├── view/services_section.dart
    │   └── view_model/services_vm.dart
    ├── portfolio/
    │   ├── view/portfolio_section.dart
    │   └── view_model/portfolio_vm.dart
    ├── contact/
    │   ├── view/contact_section.dart
    │   └── view_model/contact_vm.dart
    ├── footer/
    │   ├── view/footer_section.dart
    │   └── view_model/footer_vm.dart
    ├── portfolio_detail/                    ← (ex details/portfolio_project/)
    │   ├── view/portfolio_detail_page.dart
    │   └── view_model/portfolio_detail_vm.dart
    ├── about/
    │   ├── view/about_page.dart
    │   └── view_model/about_vm.dart
    └── workspace/
        ├── create_portfolio/
        │   ├── view/create_portfolio_page.dart
        │   └── view_model/create_portfolio_vm.dart
        └── editor_content/
            ├── view/editor_content_page.dart
            └── view_model/editor_content_vm.dart
```

**Tidak ada:**
- `domain/` interfaces/usecases — overkill untuk data lokal
- `infrastructure/` datasources/repositories — langsung akses data
- `application/` service facade — ViewModel langsung panggil data
- `utility/` — digantikan `core/`

---

## MVVM Pattern — State Management

### Model (pure data)

```dart
// data/portfolio_data.dart
class PortfolioData {
  static List<MainMenu> getMainMenu() => [...];
  static MainProfile getMainProfile() => MainProfile.fromJson({...});
  static List<ProjectsData> getProjects() => [...];
  static List<ServicesData> getServices() => [...];
  static List<Contacts> getContacts() => [...];
}
```

### ViewModel (Riverpod Notifier)

```dart
// features/home/view_model/home_vm.dart
@riverpod
class HomeVm extends _$HomeVm {
  @override
  HomeState build() {
    final menu = PortfolioData.getMainMenu();
    final profile = PortfolioData.getMainProfile();
    return HomeState(
      menu: menu,
      profile: profile,
      isLightMode: false, // nanti baca dari storage
    );
  }

  void scrollToIndex(int index) { ... }
  Future<void> toggleTheme() async { ... }
}

// State class
@immutable
class HomeState {
  final List<MainMenu> menu;
  final MainProfile profile;
  final bool isLightMode;
  // ... scrollController, tabController
}
```

### View (ConsumerWidget)

```dart
// features/home/view/home_page.dart
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(homeVmProvider);
    return Scaffold(
      body: ListView.builder(
        itemCount: vm.menu.length,
        itemBuilder: (_, i) => vm.menu[i].buildWidget(),
      ),
    );
  }
}
```

---

## Routing — GoRouter

```dart
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', name: 'splash', builder: (_, __) => const SplashPage()),
    GoRoute(path: '/main', name: 'home', builder: (_, __) => const HomePage()),
    GoRoute(
      path: '/portfolio-detail',
      name: 'portfolio-detail',
      builder: (_, state) => PortfolioDetailPage(data: state.extra as ProjectsData),
    ),
    GoRoute(path: '/about', name: 'about', builder: (_, __) => const AboutPage()),
    GoRoute(
      path: '/edit-portfolio',
      name: 'editor-content',
      builder: (_, state) => EditorContentPage(initialText: state.extra as String?),
    ),
    GoRoute(path: '/create-portfolio', name: 'create-portfolio', builder: (_, __) => const CreatePortfolioPage()),
  ],
);
```

**Cara navigasi:**
```dart
context.pushNamed('portfolio-detail', extra: projectData);
context.pop();
context.goNamed('home');
```

Tidak ada `Get.toNamed()` / `Get.back()`.

---

## Design Tokens — Zero Hardcode

### Spacing

```dart
// core/ui/tokens/app_spacing.dart
class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;

  static const EdgeInsets insetXs = EdgeInsets.all(xs);
  static const EdgeInsets insetSm = EdgeInsets.all(sm);
  static const EdgeInsets insetMd = EdgeInsets.all(md);
  static const EdgeInsets insetLg = EdgeInsets.all(lg);
  static const EdgeInsets insetXl = EdgeInsets.all(xl);

  static const EdgeInsets hSm = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets hMd = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets hLg = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets hXl = EdgeInsets.symmetric(horizontal: xl);
  static const EdgeInsets vSm = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets vMd = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets vLg = EdgeInsets.symmetric(vertical: lg);
  static const EdgeInsets vXl = EdgeInsets.symmetric(vertical: xl);

  static SizedBox gapW(double size) => SizedBox(width: size);
  static SizedBox gapH(double size) => SizedBox(height: size);
}
```

### Radius

```dart
class AppRadius {
  static const double sm = 4;
  static const double md = 8;
  static const double lg = 16;
  static const double xl = 24;
  static const double full = 9999;

  static const BorderRadius circularSm = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius circularMd = BorderRadius.all(Radius.circular(md));
  static const BorderRadius circularLg = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius circularXl = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius circularFull = BorderRadius.all(Radius.circular(full));
}
```

---

## Theme — Seed-Based

```dart
// core/ui/theme/app_theme.dart
class AppTheme {
  static ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.seed,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    textTheme: AppTextTheme.textTheme,
  );

  static ThemeData dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.seed,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    textTheme: AppTextTheme.textTheme,
  );
}
```

### Akses dari UI — context extension

```dart
// core/ui/extensions/context_ext.dart
extension ContextX on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;
  EdgeInsets get padding => MediaQuery.paddingOf(this);
  // AppLocalizations get l10n => AppLocalizations.of(this)!;  // setelah gen-l10n
}
```

### Aturan warna

```dart
// ❌ Get.textTheme.bodyMedium
// ✅ context.textTheme.bodyMedium

// ❌ Colors.black / Colors.white / Color(0xFF...)
// ✅ context.colors.onSurface / context.colors.surface

// ❌ Get.theme.primaryColor / Colors.blue
// ✅ context.colors.primary / context.colors.secondary

// ❌ Colors.white.withOpacity(.8)
// ✅ context.colors.onSurface.withOpacity(.8)
```

---

## Localization — Generated

```yaml
# l10n.yaml
arb-dir: lib/core/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
```

```bash
flutter gen-l10n
```

**Usage:**
```dart
// ❌ Text('Download CV')
// ✅ Text(context.l10n.downloadCv)

// ❌ Text('Send Message')
// ✅ Text(context.l10n.sendMessage)
```

Default English. Support Indonesian. TIDAK ADA string UI hardcoded.

---

## Responsive Layout

Target web, diakses dari HP/tablet/desktop — semua screen wajib responsive:

```dart
final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);
final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);
final isSmallerThanDesktop = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
```

| Breakpoint | Range | Behavior |
|---|---|---|
| MOBILE | 0-450px | Column layout, padding kecil |
| TABLET | 451-800px | Hybrid |
| DESKTOP | 801-1920px | Row layout, spacing besar |
| 4K | 1921+px | Max-width constraint, center |

Pakai `ResponsiveRowColumn` untuk layout utama. Hindari `MediaQuery.of(context)` — pakai `MediaQuery.sizeOf(context)`.

---

## Entities — Pure Dart

TIDAK BOLEH ada framework import di entity:

```dart
// ❌ VIOLATION — Flutter di domain
import 'package:flutter/material.dart';
import 'dart:html';

class Contacts { IconData icon; ... }
class MainMenu { StatelessWidget classWidget; ... }
class ServicesData { IconData icon; ... }
```

✅ Yang benar:

```dart
class MainMenu {
  final String id;
  final String nameTab;
  final String description;
  final String widgetKey;  // String identifier → mapping di view layer
}

class Contacts {
  final String iconName;  // 'github', 'email', 'linkedin'
  final String name;
  final String link;
}

class ServicesData {
  final String iconName;  // bukan IconData
  final String title;
  final String description;
}
```

Icon mapping di `data/icon_mapper.dart`:

```dart
IconData resolveIcon(String name) => switch (name) {
  'github' => FontAwesomeIcons.github,
  'email' => Icons.mail_outlined,
  'linkedin' => FontAwesomeIcons.linkedinIn,
  'twitter' => FontAwesomeIcons.twitter,
  'telegram' => FontAwesomeIcons.telegram,
  'web' => FontAwesomeIcons.globe,
  'android' => FontAwesomeIcons.googlePlay,
  'ios' => FontAwesomeIcons.appStore,
  _ => Icons.code,
};
```

---

## Data Flow

```
User tap/scroll
     ↓
View (ConsumerWidget)  ← panggil method via ref
     ↓
ViewModel (Notifier)   ← update state
     ↓
View rebuild (reaktif)
```

```
HomePage
  └─ HomeVm (root VM) ← pegang state menu, profile, theme
       ├─ PortfolioData.getMainMenu()    ← data hardcoded
       ├─ PortfolioData.getMainProfile() ← data hardcoded
       └─ ThemeMode                      ← dari SharedPreferences
```

---

## Pre-Execution Checklist

```bash
# 1. Install dependencies baru
flutter pub add flutter_riverpod riverpod_annotation go_router universal_html
flutter pub add -d riverpod_generator build_runner

# 2. Hapus GetX
flutter pub remove get

# 3. Enable l10n di pubspec.yaml → flutter: generate: true
#    (manual edit file)

# 4. Buat l10n.yaml + ARB files

# 5. Platform fix — sebelum compile
#    - projects_data.dart: hapus import dart:html
#    - home_page_logic.dart: hapus import dart:io
#    - home_page_logic.dart: ganti dart:html → universal_html

# 6. Generate
flutter gen-l10n
dart run build_runner build

# 7. Verify
flutter analyze
```

## Build & Run

```bash
flutter run -d chrome            # dev
flutter build web                # production
firebase deploy --only hosting   # deploy
dart run build_runner build      # riverpod generate
flutter gen-l10n                  # localization generate
```

---

## Aturan Coding

1. **Semua widget** `ConsumerWidget` atau `ConsumerStatefulWidget` — bukan `StatelessWidget` (kecuali pure leaf)
2. **Semua state** via Riverpod — tidak ada `setState` di root
3. **Semua warna** via `context.colors.*`
4. **Semua spacing** via `AppSpacing.*`
5. **Semua string** via `context.l10n.*`
6. **Semua text style** via `context.textTheme.*`
7. **Entity** pure Dart — zero framework import
8. **ViewModel** jangan import widget — hanya logic + state
9. **.zh/.zw** ganti ke `AppSpacing.gapH()` / `AppSpacing.gapW()`
10. **const constructor** selalu jika bisa

---

## Git Commit Rules

### Format
Conventional Commits — **WAJIB Bahasa Inggris**:
`<type>(<scope>): <message>`

Types: feat, fix, refactor, style, content, chore, docs

### Rules
- Huruf kecil, tanpa titik, maks 72 karakter
- Kata kerja aktif: add, fix, update, remove, change
- Satu task = satu commit
- `flutter analyze` bersih sebelum push
- **TIDAK BOLEH** `Co-Authored-By: Claude` di commit
- **TIDAK BOLEH** push/force push tanpa konfirmasi
