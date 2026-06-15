import 'package:flutter/material.dart';

abstract class AppLayout {
  // Breakpoints
  static const double bpMobile = 390;
  static const double bpTablet = 768;
  static const double bpDesktop = 1200;

  // Page padding (horizontal)
  static const double pagePadMobile = 16;
  static const double pagePadTablet = 28;
  static const double pagePadDesktop = 40;

  // Max content width
  static const double maxWidth = 1100;

  // Section gap (vertikal antar section)
  static const double sectionGap = 32;

  // Card
  static const double cardPad = 16; // padding dalam card
  static const double cardPadH = 20; // padding horizontal card besar
  static const double cardRadius = 12;
  static const double cardBorder = 0.5;
  static const double cardGap = 12; // gap antar card dalam grid

  // Nav
  static const double navHeight = 52;
  static const double navPadH = 28;

  // Divider
  static const double dividerThick = 0.5;

  // Accent top border card
  static const double accentLineH = 2;

  // Button
  static const double btnRadius = 20; // fully rounded pill
  static const double btnPadV = 9;
  static const double btnPadH = 22;
  static const double btnGapH = 10; // gap antara dua tombol

  // Stat row
  static const double statGapH = 24;
  static const double statTopPad = 20;

  // Stack card icon size
  static const double stackIconSize = 28;
  static const double stackIconRadius = 8;

  // Spacing helpers
  static const SizedBox gapH4 = SizedBox(height: 4);
  static const SizedBox gapH6 = SizedBox(height: 6);
  static const SizedBox gapH8 = SizedBox(height: 8);
  static const SizedBox gapH10 = SizedBox(height: 10);
  static const SizedBox gapH12 = SizedBox(height: 12);
  static const SizedBox gapH14 = SizedBox(height: 14);
  static const SizedBox gapH16 = SizedBox(height: 16);
  static const SizedBox gapH20 = SizedBox(height: 20);
  static const SizedBox gapH24 = SizedBox(height: 24);
  static const SizedBox gapH28 = SizedBox(height: 28);
  static const SizedBox gapH32 = SizedBox(height: 32);
  static const SizedBox gapW6 = SizedBox(width: 6);
  static const SizedBox gapW8 = SizedBox(width: 8);
  static const SizedBox gapW10 = SizedBox(width: 10);
  static const SizedBox gapW12 = SizedBox(width: 12);
  static const SizedBox gapW16 = SizedBox(width: 16);
  static const SizedBox gapW24 = SizedBox(width: 24);
}
