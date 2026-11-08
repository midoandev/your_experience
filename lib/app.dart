import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:your_experience/core/l10n/app_localizations.dart';
import 'package:your_experience/core/router/app_router.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/theme/app_theme.dart';
import 'package:your_experience/core/theme/theme_mode_provider.dart';
import 'package:your_experience/core/ui/widgets/app_scroll_behavior.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      onGenerateTitle: (context) =>
          '${AppLocalizations.of(context)!.navLogo} — ${AppLocalizations.of(context)!.heroRole}',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      themeAnimationDuration: const Duration(milliseconds: 250),
      routerConfig: appRouter,
      scrollBehavior: AppScrollBehavior(),
      // Same thresholds as Responsive (core/theme/responsive.dart).
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: const [
          Breakpoint(start: 0, end: AppLayout.bpTablet - 1, name: MOBILE),
          Breakpoint(
            start: AppLayout.bpTablet,
            end: AppLayout.bpDesktop - 1,
            name: TABLET,
          ),
          Breakpoint(
            start: AppLayout.bpDesktop,
            end: AppLayout.bp4k - 1,
            name: DESKTOP,
          ),
          Breakpoint(start: AppLayout.bp4k, end: double.infinity, name: '4K'),
        ],
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
