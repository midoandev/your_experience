import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_experience/core/services/storage_service.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  Future<ThemeMode> build() async {
    final isLight = await StorageService.getBool(StorageEnum.themeIsLight.name);
    return isLight ? ThemeMode.light : ThemeMode.dark;
  }

  Future<void> toggle() async {
    final current = state.requireValue;
    final newMode = current == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    state = AsyncData(newMode);
    await StorageService.setBool(
      StorageEnum.themeIsLight.name,
      newMode == ThemeMode.light,
    );
  }
}
