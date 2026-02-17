import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:your_experience/utility/shared/services/storage_service.dart';

import 'core/app_component.dart';
import 'core/env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: 'main');

  final isLight = await StorageService.getPrefBool(key: StorageEnum.themeIsLight);

  final themeDefault = isLight ? ThemeMode.light : ThemeMode.dark;
  Env();
  runApp(AppComponent(themeMode: themeDefault));
}