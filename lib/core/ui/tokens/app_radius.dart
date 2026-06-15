import 'package:flutter/material.dart';

class AppRadius {
  const AppRadius._();

  static const double sm = 4;
  static const double md = 8;
  static const double lg = 16;
  static const double xl = 24;
  static const double full = 9999;

  static const BorderRadius circularSm = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius circularMd = BorderRadius.all(Radius.circular(md));
  static const BorderRadius circularLg = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius circularXl = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius circularFull = BorderRadius.all(
    Radius.circular(full),
  );
}
