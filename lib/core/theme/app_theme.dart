import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_layout.dart';

// ── Custom colors ──
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color blue800;
  final Color blue400;
  final Color blue200;
  final Color blue100;
  final Color teal400;
  final Color teal200;
  final Color bgTagTeal;
  final Color bgTag;
  final Color borderAccent;
  final Color textMuted;
  final Color textDisabled;

  const CustomColors({
    required this.blue800,
    required this.blue400,
    required this.blue200,
    required this.blue100,
    required this.teal400,
    required this.teal200,
    required this.bgTagTeal,
    required this.bgTag,
    required this.borderAccent,
    required this.textMuted,
    required this.textDisabled,
  });

  static const light = CustomColors(
    blue800: Color(0xFF0C447C),
    blue400: Color(0xFF378ADD),
    blue200: Color(0xFF85B7EB),
    blue100: Color(0xFFB5D4F4),
    teal400: Color(0xFF1D9E75),
    teal200: Color(0xFF5DCAA5),
    bgTagTeal: Color(0xFFE6F7F2),
    bgTag: Color(0xFFF1F5F9),
    borderAccent: Color(0xFF93C5FD),
    textMuted: Color(0xFF64748B),
    textDisabled: Color(0xFFCBD5E1),
  );

  static const dark = CustomColors(
    blue800: Color(0xFF0C447C),
    blue400: Color(0xFF378ADD),
    blue200: Color(0xFF85B7EB),
    blue100: Color(0xFFB5D4F4),
    teal400: Color(0xFF1D9E75),
    teal200: Color(0xFF5DCAA5),
    bgTagTeal: Color(0xFF040E0C),
    bgTag: Color(0xFF060F1E),
    borderAccent: Color(0xFF0C447C),
    textMuted: Color(0xFF3A5A7A),
    textDisabled: Color(0xFF1E3A52),
  );

  @override
  CustomColors copyWith({
    Color? blue800,
    Color? blue400,
    Color? blue200,
    Color? blue100,
    Color? teal400,
    Color? teal200,
    Color? bgTagTeal,
    Color? bgTag,
    Color? borderAccent,
    Color? textMuted,
    Color? textDisabled,
  }) {
    return CustomColors(
      blue800: blue800 ?? this.blue800,
      blue400: blue400 ?? this.blue400,
      blue200: blue200 ?? this.blue200,
      blue100: blue100 ?? this.blue100,
      teal400: teal400 ?? this.teal400,
      teal200: teal200 ?? this.teal200,
      bgTagTeal: bgTagTeal ?? this.bgTagTeal,
      bgTag: bgTag ?? this.bgTag,
      borderAccent: borderAccent ?? this.borderAccent,
      textMuted: textMuted ?? this.textMuted,
      textDisabled: textDisabled ?? this.textDisabled,
    );
  }

  @override
  CustomColors lerp(covariant CustomColors? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      blue800: Color.lerp(blue800, other.blue800, t)!,
      blue400: Color.lerp(blue400, other.blue400, t)!,
      blue200: Color.lerp(blue200, other.blue200, t)!,
      blue100: Color.lerp(blue100, other.blue100, t)!,
      teal400: Color.lerp(teal400, other.teal400, t)!,
      teal200: Color.lerp(teal200, other.teal200, t)!,
      bgTagTeal: Color.lerp(bgTagTeal, other.bgTagTeal, t)!,
      bgTag: Color.lerp(bgTag, other.bgTag, t)!,
      borderAccent: Color.lerp(borderAccent, other.borderAccent, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
    );
  }
}

// ── ThemeData ──
class AppTheme {
  static const _seed = Color(0xFF185FA5);

  static final ThemeData light = _base(
    ColorScheme.fromSeed(
      seedColor: _seed,
      brightness: Brightness.light,
      surface: const Color(0xFFF8FAFC),
    ),
    CustomColors.light,
  );

  static final ThemeData dark = _base(
    const ColorScheme.dark(
      primary: Color(0xFF378ADD),
      secondary: Color(0xFF1D9E75),
      tertiary: Color(0xFF0F6E56),
      surface: Color(0xFF050D1A),
      onSurface: Color(0xFFC8DFF5),
      onSurfaceVariant: Color(0xFF85A8C8),
      outlineVariant: Color(0xFF0E1F36),
      outline: Color(0xFF0C447C),
      surfaceContainerLow: Color(0xFF07111F),
      surfaceContainerHigh: Color(0xFF091525),
    ),
    CustomColors.dark,
  );

  static ThemeData _base(ColorScheme scheme, CustomColors custom) {
    final sg = GoogleFonts.spaceGroteskTextTheme();
    final jb = GoogleFonts.jetBrainsMonoTextTheme();

    return ThemeData(
      brightness: scheme.brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      extensions: [custom],
      dividerColor: scheme.outlineVariant,
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        thickness: AppLayout.dividerThick,
        space: AppLayout.sectionGap,
      ),
      textTheme: TextTheme(
        displayLarge: sg.displayLarge?.copyWith(
          fontSize: 36,
          fontWeight: FontWeight.w500,
          height: 1.15,
        ),
        displayMedium: sg.displayMedium?.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: jb.headlineSmall?.copyWith(
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: sg.titleSmall?.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: sg.bodyLarge?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: sg.bodyMedium?.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          height: 1.6,
        ),
        bodySmall: sg.bodySmall?.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
        labelLarge: sg.labelLarge?.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        labelMedium: jb.labelMedium?.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: jb.labelSmall?.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
      ).apply(bodyColor: scheme.onSurface, displayColor: scheme.onSurface),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
    );
  }
}
