// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class StyleConstants {
  static ThemeData lightThemeData = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    // Add more light theme settings here
  );

  static ThemeData darkThemeData = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    // Add more dark theme settings here
  );
  static MaterialColor mColor = const MaterialColor(0xFFFFFFF, {
    50: Color(0xFFFBFBFB),
    100: Color(0xFFF6F6F7),
    200: Color(0xFFE7E8EB),
    300: Color(0xFFD8DADE),
    400: Color(0xFFBCBFC7),
    500: Color(0xFF9EA3AE),
    600: Color(0xFF8D929B),
    700: Color(0xFF5F6269),
    800: Color(0xFF484A4F),
    900: Color(0xFF2E3033),
  });
  static TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.georama(
        fontSize: 96,
        fontWeight: FontWeight.w800,
        color: Colors.black54,
        letterSpacing: 1.5),
    displayMedium: GoogleFonts.georama(
        fontSize: 60,
        fontWeight: FontWeight.w700,
        color: Colors.black54,
        letterSpacing: 0.5),
    displaySmall: GoogleFonts.georama(
      fontSize: 48,
      fontWeight: FontWeight.w600,
      color: Colors.black54,
    ),
    headlineLarge: GoogleFonts.georama(
      fontSize: 34,
      fontWeight: FontWeight.w800,
      color: Colors.black54,
    ),
    headlineMedium: GoogleFonts.georama(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Colors.black54,
        letterSpacing: 0.25),
    headlineSmall: GoogleFonts.georama(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: Colors.black.withOpacity(.6),
    ),
    titleLarge: GoogleFonts.robotoCondensed(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: Colors.black.withOpacity(.6),
        letterSpacing: 0.15),
    titleMedium: GoogleFonts.robotoCondensed(
        fontSize: 19,
        fontWeight: FontWeight.w400,
        color: Colors.black.withOpacity(.6),
        letterSpacing: 0.15),
    titleSmall: GoogleFonts.robotoCondensed(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: Colors.black.withOpacity(.6),
        letterSpacing: 0.1),
    bodyLarge: GoogleFonts.abrilFatface(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: Colors.black.withOpacity(.6),
        letterSpacing: 0.5),
    bodyMedium: GoogleFonts.abrilFatface(
        fontSize: 19,
        fontWeight: FontWeight.w400,
        color: Colors.black.withOpacity(.6),
        letterSpacing: 0.25),
    bodySmall: GoogleFonts.abrilFatface(
        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
    labelLarge: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black.withOpacity(.6),
        height: pxToDouble(px: 14.63),
        letterSpacing: 1.25),
    labelMedium: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.black.withOpacity(.6),
        height: pxToDouble(px: 14.63),
        letterSpacing: 1),
    labelSmall: GoogleFonts.montserrat(
        fontSize: 11,
        fontWeight: FontWeight.w300,
        color: Colors.black.withOpacity(.6),
        height: pxToDouble(px: 14.63),
        letterSpacing: 0),
  );
}
