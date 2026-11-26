import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_layout.dart';

/// Brand colors that have no slot in [ColorScheme].
/// Access via `context.custom.*`.
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  /// Card background on hover / pressed.
  final Color cardHover;

  /// Stronger border used on hover, focus and featured cards.
  final Color borderStrong;

  /// Low-emphasis text (meta, captions). Still >= 4.5:1 on surface.
  final Color textMuted;

  /// Tinted background behind accent text (chips, badges).
  final Color accentSoft;

  /// "Available" / "live" semantic color + its tinted background.
  final Color success;
  final Color successSoft;

  /// "Archived" semantic color + its tinted background.
  final Color warning;
  final Color warningSoft;

  /// Soft radial glow behind the hero.
  final Color glow;

  const CustomColors({
    required this.cardHover,
    required this.borderStrong,
    required this.textMuted,
    required this.accentSoft,
    required this.success,
    required this.successSoft,
    required this.warning,
    required this.warningSoft,
    required this.glow,
  });

  static const dark = CustomColors(
    cardHover: Color(0xFF423C38),
    borderStrong: Color(0xFF6E6560),
    textMuted: Color(0xFFA29C99),
    accentSoft: Color(0x2645C47F),
    success: Color(0xFF5CC48D),
    successSoft: Color(0x1F5CC48D),
    warning: Color(0xFFE0B061),
    warningSoft: Color(0x1FE0B061),
    glow: Color(0x00000000),
  );

  static const light = CustomColors(
    cardHover: Color(0xFFDCD4D0),
    borderStrong: Color(0xFFB9AEA9),
    textMuted: Color(0xFF655C58),
    accentSoft: Color(0x1A0F7D45),
    success: Color(0xFF0F7D45),
    successSoft: Color(0x1A0F7D45),
    warning: Color(0xFF8A5A00),
    warningSoft: Color(0x1A8A5A00),
    glow: Color(0x00000000),
  );

  @override
  CustomColors copyWith({
    Color? cardHover,
    Color? borderStrong,
    Color? textMuted,
    Color? accentSoft,
    Color? success,
    Color? successSoft,
    Color? warning,
    Color? warningSoft,
    Color? glow,
  }) {
    return CustomColors(
      cardHover: cardHover ?? this.cardHover,
      borderStrong: borderStrong ?? this.borderStrong,
      textMuted: textMuted ?? this.textMuted,
      accentSoft: accentSoft ?? this.accentSoft,
      success: success ?? this.success,
      successSoft: successSoft ?? this.successSoft,
      warning: warning ?? this.warning,
      warningSoft: warningSoft ?? this.warningSoft,
      glow: glow ?? this.glow,
    );
  }

  @override
  CustomColors lerp(covariant CustomColors? other, double t) {
    if (other is! CustomColors) return this;
    Color l(Color a, Color b) => Color.lerp(a, b, t)!;
    return CustomColors(
      cardHover: l(cardHover, other.cardHover),
      borderStrong: l(borderStrong, other.borderStrong),
      textMuted: l(textMuted, other.textMuted),
      accentSoft: l(accentSoft, other.accentSoft),
      success: l(success, other.success),
      successSoft: l(successSoft, other.successSoft),
      warning: l(warning, other.warning),
      warningSoft: l(warningSoft, other.warningSoft),
      glow: l(glow, other.glow),
    );
  }
}

class AppTheme {
  const AppTheme._();

  static final ThemeData dark = _base(
    const ColorScheme.dark(
      primary: Color(0xFF5CC48D),
      onPrimary: Color(0xFF0B2A18),
      secondary: Color(0xFF5CC48D),
      onSecondary: Color(0xFF0B2A18),
      tertiary: Color(0xFFD9CFCA),
      surface: Color(0xFF2B2622),
      onSurface: Color(0xFFEBE5E3),
      onSurfaceVariant: Color(0xFFA29C99),
      surfaceContainerLow: Color(0xFF36312D),
      surfaceContainer: Color(0xFF3A3531),
      surfaceContainerHigh: Color(0xFF423C38),
      outline: Color(0xFF7A726E),
      outlineVariant: Color(0xFF4A433F),
      inverseSurface: Color(0xFFEBE5E3),
      onInverseSurface: Color(0xFF2B2622),
      error: Color(0xFFFF8A80),
    ),
    CustomColors.dark,
  );

  // Warm stone paper and one green for the action (design/directions/a.html).
  static final ThemeData light = _base(
    const ColorScheme.light(
      primary: Color(0xFF0F7D45),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFF0F7D45),
      onSecondary: Color(0xFFFFFFFF),
      tertiary: Color(0xFF36312D),
      surface: Color(0xFFEBE5E3),
      onSurface: Color(0xFF2B2622),
      onSurfaceVariant: Color(0xFF655C58),
      surfaceContainerLow: Color(0xFFE1DAD7),
      surfaceContainer: Color(0xFFE4DEDB),
      surfaceContainerHigh: Color(0xFFDCD4D0),
      outline: Color(0xFF8A817D),
      outlineVariant: Color(0xFFD5CCC8),
      inverseSurface: Color(0xFF2B2622),
      onInverseSurface: Color(0xFFEBE5E3),
      error: Color(0xFFB3261E),
    ),
    CustomColors.light,
  );

  static ThemeData _base(ColorScheme scheme, CustomColors custom) {
    final sans = GoogleFonts.hankenGroteskTextTheme();
    final mono = sans;

    final textTheme = TextTheme(
      // Hero headline — scaled per breakpoint in the view.
      displayLarge: sans.displayLarge?.copyWith(
        fontSize: 72,
        fontWeight: FontWeight.w400,
        height: 1.02,
        letterSpacing: -2.6,
      ),
      displayMedium: sans.displayMedium?.copyWith(
        fontSize: 54,
        fontWeight: FontWeight.w400,
        height: 1.04,
        letterSpacing: -1.8,
      ),
      displaySmall: sans.displaySmall?.copyWith(
        fontSize: 40,
        fontWeight: FontWeight.w400,
        height: 1.06,
        letterSpacing: -1.2,
      ),
      // Section titles
      headlineLarge: sans.headlineLarge?.copyWith(
        fontSize: 44,
        fontWeight: FontWeight.w400,
        height: 1.1,
        letterSpacing: -1.3,
      ),
      headlineMedium: sans.headlineMedium?.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        height: 1.15,
        letterSpacing: -0.9,
      ),
      // Type scale follows ui-ux-pro-max: 12 / 14 / 16 / 18 / 24 / 32+,
      // body >= 16px (no iOS zoom), line-height 1.5-1.75.
      headlineSmall: sans.headlineSmall?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 1.3,
        letterSpacing: -0.2,
      ),
      titleLarge: sans.titleLarge?.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.3,
      ),
      titleMedium: sans.titleMedium?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.35,
      ),
      titleSmall: sans.titleSmall?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.4,
      ),
      bodyLarge: sans.bodyLarge?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 1.6,
      ),
      bodyMedium: sans.bodyMedium?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.65,
      ),
      bodySmall: sans.bodySmall?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
      ),
      // Buttons
      labelLarge: sans.labelLarge?.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
      ),
      // Mono: logo, eyebrows, chips, stats
      labelMedium: mono.labelMedium?.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2,
      ),
      labelSmall: mono.labelSmall?.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.4,
      ),
    ).apply(bodyColor: scheme.onSurface, displayColor: scheme.onSurface);

    return ThemeData(
      useMaterial3: true,
      brightness: scheme.brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      canvasColor: scheme.surface,
      extensions: [custom],
      textTheme: textTheme,
      splashFactory: InkSparkle.splashFactory,
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        thickness: AppLayout.hairline,
        space: 1,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: scheme.inverseSurface,
          borderRadius: BorderRadius.circular(AppLayout.radiusSm),
        ),
        textStyle: textTheme.bodySmall?.copyWith(
          color: scheme.onInverseSurface,
        ),
        waitDuration: const Duration(milliseconds: 400),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: scheme.inverseSurface,
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: scheme.onInverseSurface,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppLayout.radiusMd),
        ),
        width: 420,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: scheme.onSurfaceVariant,
          minimumSize: const Size.square(AppLayout.touchTarget),
        ),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStatePropertyAll(scheme.outline),
        thickness: const WidgetStatePropertyAll(6),
        radius: const Radius.circular(AppLayout.radiusFull),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: FadeForwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: FadeForwardsPageTransitionsBuilder(),
          TargetPlatform.windows: FadeForwardsPageTransitionsBuilder(),
          TargetPlatform.linux: FadeForwardsPageTransitionsBuilder(),
        },
      ),
    );
  }
}
