# ✦ Your Experience — Portfolio Website

Personal portfolio website built with **Flutter Web**. Showcases projects, services, and tech stack. Accessible from desktop, tablet, and mobile.

**Live:** [midosaurus.web.app](https://midosaurus.web.app)

---

## Tech Stack

| Layer | Choice |
|-------|--------|
| Framework | Flutter Web |
| Architecture | MVVM (Model-View-ViewModel) |
| State Mgmt | Riverpod + Riverpod Generator |
| Routing | GoRouter |
| Responsive | responsive_framework |
| Theme | flex_color_scheme + Google Fonts (Outfit / Jost) |
| Locale | intl + ARB (English, Indonesian) |
| Storage | shared_preferences (theme persistence) |
| Deploy | Firebase Hosting |

---

## Project Structure

```
lib/
├── main.dart
├── app.dart                          # MaterialApp.router
├── core/
│   ├── ui/
│   │   ├── tokens/                   # AppSpacing, AppRadius, AppDuration
│   │   ├── theme/                    # Seed-based ThemeData (light/dark)
│   │   ├── extensions/               # BuildContext extension
│   │   └── widgets/                  # Reusable widgets (AppCard, AppChip, etc.)
│   ├── router/                       # GoRouter config
│   ├── l10n/                         # ARB files + generated localizations
│   └── services/                     # SharedPreferences wrapper
├── data/                             # Hardcoded data + icon mapper
├── models/                           # Pure Dart data classes
└── features/
    ├── splash/
    ├── home/
    ├── home_hero/
    ├── services/
    ├── portfolio/
    ├── portfolio_detail/
    ├── contact/
    ├── footer/
    ├── about/
    └── workspace/                    # Editor content management
```

---

## Architecture — MVVM

```
View (ConsumerWidget) → ViewModel (Riverpod Notifier) → Model (pure data)
```

- **View** — renders UI, watches providers
- **ViewModel** — holds state + business logic
- **Model** — pure Dart, zero framework dependency

Features are self-contained. Cross-feature sharing goes through core or parent ViewModel.

---

## Localization

Generated via `flutter gen-l10n`:

- `app_en.arb` — English (default)
- `app_id.arb` — Indonesian

Usage: `context.l10n.yourKey`

---

## Design System

- **Seed-based theme** — single brand color → full ColorScheme via `ColorScheme.fromSeed`
- **Design tokens** — centralised spacing (`AppSpacing`), radius (`AppRadius`), duration (`AppDuration`)
- **Zero hardcode** — all colors via `context.colors.*`, spacing via `AppSpacing.*`, text via `context.textTheme.*`

---

## Commands

```bash
flutter pub get                          # Install deps
flutter gen-l10n                         # Generate localizations
dart run build_runner build              # Generate Riverpod code
flutter build web --release              # Production build
firebase deploy --only hosting           # Deploy to Firebase
```

Shorthand (via `make`):

```bash
make build_upload                        # clean → pub get → build → deploy
```

---

## CI/CD

Merge to `master` triggers GitHub Actions:

1. `flutter pub get`
2. `flutter gen-l10n`
3. `dart run build_runner build`
4. `flutter build web --release`
5. `firebase deploy --only hosting`
6. Auto-tag version from `pubspec.yaml`

---

## License

MIT
