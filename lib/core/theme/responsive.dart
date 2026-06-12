import 'package:flutter/material.dart';

import 'app_layout.dart';

enum ScreenSize { mobile, tablet, desktop }

class Responsive {
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

  static double pagePad(BuildContext context) {
    return switch (of(context)) {
      ScreenSize.mobile => AppLayout.pagePadMobile,
      ScreenSize.tablet => AppLayout.pagePadTablet,
      ScreenSize.desktop => AppLayout.pagePadDesktop,
    };
  }
}
