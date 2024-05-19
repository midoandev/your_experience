// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';

import 'constants.dart';

class StyleConstants {
  static ThemeData lightThemeData = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    textTheme: textTheme,
    // Add more light theme settings here
  );

  static ThemeData darkThemeData = ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.dark,
      textTheme: textTheme
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
    displayLarge: GoogleFonts.cairoPlay(
        fontSize: 96,
        fontWeight: FontWeight.w800,
        color: Colors.black54,
        letterSpacing: 1.5),
    displayMedium: GoogleFonts.cairoPlay(
        fontSize: 60,
        fontWeight: FontWeight.w700,
        color: Colors.black54,
        letterSpacing: 0.5),
    displaySmall: GoogleFonts.cairoPlay(
      fontSize: 48,
      fontWeight: FontWeight.w600,
      color: Colors.black54,
    ),
    headlineLarge: GoogleFonts.cairoPlay(
      fontSize: 34,
      fontWeight: FontWeight.w800,
      color: Colors.black54,
    ),
    headlineMedium: GoogleFonts.cairoPlay(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Colors.black54,
      letterSpacing: 0.25,
    ),
    headlineSmall: GoogleFonts.cairoPlay(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: Colors.black.withOpacity(.6),
    ),
    titleLarge: GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Colors.black.withOpacity(.6),
      letterSpacing: 2,
    ),
    titleMedium: GoogleFonts.roboto(
      fontSize: 19,
      fontWeight: FontWeight.w400,
      color: Colors.black.withOpacity(.6),
      letterSpacing: 2,
    ),
    titleSmall: GoogleFonts.roboto(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: Colors.black.withOpacity(.6),
      letterSpacing: 0.1,
    ),
    bodyLarge: GoogleFonts.roboto(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      letterSpacing: 0.5,
      height: 21.pxToDouble,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 19,
      fontWeight: FontWeight.w400,
      color: Colors.black.withOpacity(.8),
      letterSpacing: 1.24,
      height: 19.pxToDouble,
    ),
    bodySmall: GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black.withOpacity(.6),
      height: 19.pxToDouble,
    ),
    labelLarge: GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black.withOpacity(.6),
      height: pxToDouble(px: 14.63),
      letterSpacing: 1.25,
    ),
    labelMedium: GoogleFonts.montserrat(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black.withOpacity(.6),
      height: pxToDouble(px: 14.63),
      letterSpacing: 1,
    ),
    labelSmall: GoogleFonts.montserrat(
      fontSize: 11,
      fontWeight: FontWeight.w300,
      color: Colors.black.withOpacity(.6),
      height: pxToDouble(px: 14.63),
      letterSpacing: 1,
    ),
  );
}
