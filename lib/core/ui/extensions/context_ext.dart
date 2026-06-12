import 'package:flutter/material.dart';

import '../../../core/l10n/app_localizations.dart';
import '../../../core/theme/app_theme.dart';

extension ContextX on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
  CustomColors get custom => Theme.of(this).extension<CustomColors>()!;
  TextTheme get textTheme => Theme.of(this).textTheme;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;
  EdgeInsets get padding => MediaQuery.paddingOf(this);
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
