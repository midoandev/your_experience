import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'app_text_theme.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light => FlexThemeData.light(
    scheme: FlexScheme.ebonyClay,
    textTheme: AppTextTheme.textTheme,
  );

  static ThemeData get dark => FlexThemeData.dark(
    scheme: FlexScheme.ebonyClay,
    textTheme: AppTextTheme.textTheme,
  );
}
