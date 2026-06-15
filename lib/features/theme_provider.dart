import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_experience/core/services/storage_service.dart';

final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);

class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    _init();
    return ThemeMode.dark;
  }

  Future<void> _init() async {
    final isLight = await StorageService.getBool('themeIsLight');
    if (isLight) state = ThemeMode.light;
  }

  Future<void> toggle() async {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await StorageService.setBool('themeIsLight', state == ThemeMode.light);
  }
}
