import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  const AppTextTheme._();

  static TextTheme get textTheme => TextTheme(
    displayLarge: GoogleFonts.outfit(
      fontSize: 57,
      fontWeight: FontWeight.w700,
      letterSpacing: 3,
    ),
    displayMedium: GoogleFonts.outfit(
      fontSize: 45,
      fontWeight: FontWeight.w600,
      letterSpacing: 2,
    ),
    displaySmall: GoogleFonts.outfit(fontSize: 36, fontWeight: FontWeight.w500),
    headlineLarge: GoogleFonts.outfit(
      fontSize: 32,
      fontWeight: FontWeight.w800,
    ),
    headlineMedium: GoogleFonts.outfit(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.25,
    ),
    headlineSmall: GoogleFonts.outfit(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: GoogleFonts.jost(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      letterSpacing: 2,
    ),
    titleMedium: GoogleFonts.jost(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 1,
    ),
    titleSmall: GoogleFonts.jost(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.1,
    ),
    bodyLarge: GoogleFonts.jost(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
      height: 1.75,
    ),
    bodyMedium: GoogleFonts.jost(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.24,
      height: 1.5,
    ),
    bodySmall: GoogleFonts.jost(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
    labelLarge: GoogleFonts.jost(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
    ),
    labelMedium: GoogleFonts.jost(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 1,
    ),
    labelSmall: GoogleFonts.jost(
      fontSize: 11,
      fontWeight: FontWeight.w300,
      letterSpacing: 1,
    ),
  );
}
