import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppTextStyles {
  // — Space Grotesk —
  static final heroName = GoogleFonts.spaceGrotesk(
    fontSize: 36,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.15,
  );
  static final heroNameAccent = GoogleFonts.spaceGrotesk(
    fontSize: 36,
    fontWeight: FontWeight.w500,
    color: AppColors.blue400,
    height: 1.15,
  );
  static final heroDesc = GoogleFonts.spaceGrotesk(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
    height: 1.6,
  );
  static final cardTitle = GoogleFonts.spaceGrotesk(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );
  static final cardDesc = GoogleFonts.spaceGrotesk(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
    height: 1.5,
  );
  static final sectionHeading = GoogleFonts.spaceGrotesk(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );
  static final navLink = GoogleFonts.spaceGrotesk(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );
  static final statNumber = GoogleFonts.jetBrainsMono(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: AppColors.blue400,
  );
  static final statLabel = GoogleFonts.spaceGrotesk(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );
  static final btnPrimary = GoogleFonts.spaceGrotesk(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.blue100,
  );
  static final btnGhost = GoogleFonts.spaceGrotesk(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  // — JetBrains Mono —
  static final logoText = GoogleFonts.jetBrainsMono(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.blue200,
    letterSpacing: 1,
  );
  static final eyebrow = GoogleFonts.jetBrainsMono(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.teal200,
    letterSpacing: 0.8,
  );
  static final sectionLabel = GoogleFonts.jetBrainsMono(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.blue600,
    letterSpacing: 1,
  );
  static final cardTag = GoogleFonts.jetBrainsMono(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.blue600,
    letterSpacing: 0.5,
  );
  static final pillBlue = GoogleFonts.jetBrainsMono(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.blue200,
  );
  static final pillTeal = GoogleFonts.jetBrainsMono(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.teal200,
  );
  static final availLabel = GoogleFonts.jetBrainsMono(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.teal200,
  );
  static final emailText = GoogleFonts.jetBrainsMono(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.blue200,
  );
  static final contactLink = GoogleFonts.jetBrainsMono(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.blue200,
  );
}
