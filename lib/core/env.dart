
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app_component.dart';
import 'firebase_options.dart';
enum EnvType { development, production}

class Env {
  static late Env value;


  String get appName => dotenv.env['APP_NAME']!;

  String get baseUrl => dotenv.env['BASE_URL']!;
  String assetsUrl = dotenv.env['BASE_URL']!;

  Color primarySwatch = Colors.black;
  EnvType environmentType = EnvType.production;

  Env() {
    value = this;
    _init();
  }

  void _init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.current,
    );
    runApp(const AppComponent());
  }
}
