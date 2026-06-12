import 'package:flutter/material.dart';

abstract class AppColors {
  // Background hierarchy
  static const bgPrimary = Color(0xFF050D1A); // scaffold background
  static const bgCard = Color(0xFF07111F); // semua card surface
  static const bgCardHover = Color(0xFF091525); // state hover card
  static const bgTag = Color(0xFF060F1E); // badge/pill background

  // Border hierarchy
  static const border = Color(
    0xFF0E1F36,
  ); // border default (semua card, divider)
  static const borderAccent = Color(
    0xFF0C447C,
  ); // border saat hover / accent outline

  // Tag backgrounds
  static const bgTagTeal = Color(0xFF040E0C); // badge/pill teal background

  // Blue ramp — primary accent
  static const blue900 = Color(0xFF042C53);
  static const blue800 = Color(0xFF0C447C);
  static const blue600 = Color(0xFF185FA5); // tombol primary, top-accent card
  static const blue400 = Color(0xFF378ADD); // stat number, nama, link
  static const blue200 = Color(0xFF85B7EB); // logo, email, text highlight
  static const blue100 = Color(
    0xFFB5D4F4,
  ); // teks pada bgPrimary (tombol primary)

  // Teal ramp — secondary accent
  static const teal600 = Color(0xFF0F6E56); // top-accent card secondary
  static const teal400 = Color(0xFF1D9E75); // dot available, stat badge
  static const teal200 = Color(
    0xFF5DCAA5,
  ); // eyebrow, available label, tag teal

  // Text hierarchy
  static const textPrimary = Color(0xFFC8DFF5); // heading, card title
  static const textSecondary = Color(
    0xFF85A8C8,
  ); // desc, subtitle (lebih terang dari muted)
  static const textMuted = Color(0xFF3A5A7A); // placeholder, meta, card desc
  static const textDisabled = Color(0xFF1E3A52);

  // Semantic
  static const success = teal400;
  static const info = blue400;
}
