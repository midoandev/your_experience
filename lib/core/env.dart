
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app_component.dart';
import 'firebase_options.dart';
enum EnvType { development, production}

class Env {
  static late Env value;

  late String appName;
  late String baseUrl;
  late String assetsUrl;

  late Color primarySwatch;
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
