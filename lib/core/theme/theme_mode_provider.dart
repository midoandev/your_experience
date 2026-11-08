import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_experience/core/services/storage_service.dart';

final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);

class ThemeModeNotifier extends Notifier<ThemeMode> {
  static const _key = 'themeIsLight';

  @override
  ThemeMode build() {
    // StorageService.init() is awaited in main(), so this read is sync and
    // the first frame already uses the saved theme (no dark → light flash).
    return StorageService.getBoolSync(_key) ? ThemeMode.light : ThemeMode.dark;
  }

  Future<void> toggle() async {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await StorageService.setBool(_key, state == ThemeMode.light);
  }
}
