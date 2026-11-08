import 'package:flutter/material.dart';

import 'app_layout.dart';

enum ScreenSize { mobile, tablet, desktop }

/// Breakpoint helper. Uses the same thresholds as `ResponsiveBreakpoints`
/// in `app.dart` (MOBILE 0-450, TABLET 451-800, DESKTOP 801+).
class Responsive {
  const Responsive._();

  static ScreenSize of(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    if (w >= AppLayout.bpDesktop) return ScreenSize.desktop;
    if (w >= AppLayout.bpTablet) return ScreenSize.tablet;
    return ScreenSize.mobile;
  }

  static bool isMobile(BuildContext context) =>
      of(context) == ScreenSize.mobile;
  static bool isTablet(BuildContext context) =>
      of(context) == ScreenSize.tablet;
  static bool isDesktop(BuildContext context) =>
      of(context) == ScreenSize.desktop;

  static T value<T>(
    BuildContext context, {
    required T mobile,
    required T tablet,
    required T desktop,
  }) {
    return switch (of(context)) {
      ScreenSize.mobile => mobile,
      ScreenSize.tablet => tablet,
      ScreenSize.desktop => desktop,
    };
  }

  static double pagePad(BuildContext context) => value(
    context,
    mobile: AppLayout.pagePadMobile,
    tablet: AppLayout.pagePadTablet,
    desktop: AppLayout.pagePadDesktop,
  );

  /// Viewport height is small (landscape phone, split-screen tablet).
  static bool isShort(BuildContext context) =>
      MediaQuery.sizeOf(context).height < AppLayout.shortScreenHeight;

  static double navHeight(BuildContext context) =>
      isShort(context) ? AppLayout.navHeightCompact : AppLayout.navHeight;

  static double maxContentWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= AppLayout.wideScreen
      ? AppLayout.maxWidthWide
      : AppLayout.maxWidth;

  static double sectionGap(BuildContext context) => isShort(context)
      ? AppLayout.sectionGapMobile
      : value(
          context,
          mobile: AppLayout.sectionGapMobile,
          tablet: AppLayout.sectionGapMobile,
          desktop: AppLayout.sectionGapDesktop,
        );

  /// Page-level display heading: steps down on small or short screens.
  static TextStyle? displayStyle(BuildContext context) {
    final t = Theme.of(context).textTheme;
    if (isShort(context)) return t.displaySmall;
    return value(
      context,
      mobile: t.displaySmall,
      tablet: t.displayMedium,
      desktop: t.displayLarge,
    );
  }
}
