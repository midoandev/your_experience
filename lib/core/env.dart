import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../utility/shared/services/storage_service.dart';
import 'app_component.dart';

enum EnvType { development, production }

class Env {
  static late Env value;

  String get appName => dotenv.env['APP_NAME']!;

  String get baseUrl => dotenv.env['BASE_URL']!;
  String apiKey = dotenv.env['apiKey']!;
  String authDomain = dotenv.env['authDomain']!;
  String projectId = dotenv.env['projectId']!;
  String storageBucket = dotenv.env['storageBucket']!;
  String messagingSenderId = dotenv.env['messagingSenderId']!;
  String appId = dotenv.env['appId']!;
  String measurementId = dotenv.env['measurementId']!;
  String databaseURL = dotenv.env['databaseURL']!;

  Color primarySwatch = Colors.black;
  EnvType environmentType = EnvType.production;

  Env() {
    value = this;
    _init();
  }

  void _init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: apiKey,
          authDomain: authDomain,
          projectId: projectId,
          storageBucket: storageBucket,
          messagingSenderId: messagingSenderId,
          appId: appId,
          measurementId: measurementId,
          databaseURL: databaseURL),
    );

    final isLight =
        await StorageService.getPrefBool(key: StorageEnum.themeIsLight);
    final themeDefault = isLight ? ThemeMode.light : ThemeMode.dark;

    runApp(AppComponent(themeMode: themeDefault));
  }
}
