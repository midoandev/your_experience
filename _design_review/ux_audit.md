# UX Audit — 2026-06-12

Audited 15 files across `lib/features/*/view/` and `lib/features/*/view_model/`.

---

## Missing Loading States

- **lib/features/home_hero/view/hero_section.dart:91-96** — `_viewCv()` calls `rootBundle.loadString()` (async file I/O) with zero loading indicator. User taps "View CV", nothing visible happens while file loads. Add a brief loading state (shimmer or overlay spinner) before opening the blob URL.

- **lib/features/portfolio_detail/view/portfolio_detail_page.dart:280-284** — `_launchUrl()` calls `canLaunchUrl()` then `launchUrl()` — both async, no loading indicator. User sees no feedback while URL readiness is checked.

**Note on context:** Project uses 100% hardcoded local data (PortfolioData class). No ViewModel performs async data fetching. These two are the only async operations that affect user perception.

---

## Missing Empty States

- **lib/features/services/view/services_section.dart:30-37** — GridView renders `vm.items.where((i) => i.iconName.isNotEmpty)`. If filter yields zero items (e.g., empty services list), user sees blank space where grid should be. Add fallback: centered text with `context.l10n.noServices` or similar.

- **lib/features/portfolio/view/portfolio_section.dart:32-34** — GridView iterates `vm.projects`. If `getProjects()` returns empty list, blank area. Data is hardcoded so this is theoretical but still a gap. Add fallback: "No projects yet" placeholder.

- **lib/features/workspace/editor_content/view/editor_content_page.dart:43** — Shows `'Editor: ${initialText ?? ''}'`. If `initialText` is null, user sees bare "Editor: " label. Either show a default message ("Start writing...") or require non-null text before navigation.

- **lib/features/about/view/about_page.dart** — Returns `const SizedBox()`. Page is a dead stub with zero UI. If route `/about` is reachable, user lands on blank white screen. Either build the page or remove the route.

---

## Missing Error UI

- **lib/features/home_hero/view/hero_section.dart:91-96** — `_viewCv()` has no try-catch. If `rootBundle.loadString('assets/cv/cv.html')` fails (file missing, bundle error), silent failure — nothing happens, no error shown. Wrap in try-catch, show SnackBar or dialog on failure.

- **lib/features/portfolio_detail/view/portfolio_detail_page.dart:280-284** — `_launchUrl()` has try-catch for `canLaunchUrl` but no user feedback when URL cannot be opened. The `if (await canLaunchUrl(uri))` branch silently skips. Show SnackBar: context.l10n.cannotOpenLink.

- **lib/features/workspace/create_portfolio/view/create_portfolio_page.dart:14** — FAB `onPressed: () {}` does nothing. Save operation absent. If user taps save, zero feedback. Either implement save logic or disable the FAB visually.

- **lib/features/workspace/editor_content/view/editor_content_page.dart:33** — Save button `onPress: () {}` does nothing. Same issue as above.

---

## Navigation Issues

- **lib/core/router/app_router.dart:22-24** — Portfolio-detail route casts `state.extra` to `PortfolioDetailPage(data: data)` unchecked. In page's build method, `data as ProjectsData` cast on line 24 of portfolio_detail_page.dart can throw `TypeError` if extra is wrong type or null. Add type validation: `final data = state.extra; if (data is! ProjectsData) return const SizedBox();` inside the builder, or use a typed extra pattern.

- **lib/features/splash/view/splash_page.dart:19-21** — `context.goNamed('home')` inside Timer callback. Has `mounted` guard, safe. No error boundary needed for GoRouter-named routes in this project since all routes are static.

- **lib/features/portfolio_detail/view/portfolio_detail_page.dart:57** — `context.goNamed('home')` on back press. No error boundary. Low risk since `/main` route always exists.

---

## Summary

| Category | Count | Critical |
|---|---|---|
| Missing loading states | 2 | Low (both fast ops, but visible) |
| Missing empty states | 4 | Medium (about page is a dead route) |
| Missing error UI | 4 | Medium (silent failures on CV load, URL launch) |
| Navigation issues | 1 | Medium (unchecked cast on route extra) |

**Priority fixes:**
1. Portfolio-detail route extra type validation
2. HeroSection `_viewCv()` try-catch + loading indicator
3. About page — either build or remove route
4. Save buttons in workspace pages — implement or disable
