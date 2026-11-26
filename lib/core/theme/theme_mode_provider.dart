import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_experience/core/services/storage_service.dart';

final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);

class ThemeModeNotifier extends Notifier<ThemeMode> {
  // The design is light first; dark is the choice that gets saved.
  static const _key = 'themeIsDark';

  @override
  ThemeMode build() {
    // StorageService.init() is awaited in main(), so this read is sync and
    // the first frame already uses the saved theme (no dark → light flash).
    return StorageService.getBoolSync(_key) ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggle() async {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await StorageService.setBool(_key, state == ThemeMode.dark);
  }
}
