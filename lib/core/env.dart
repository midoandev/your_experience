import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvType { development, production }

class Env {
  static late Env value;

  Env() {
    value = this;
  }

  String get appName => dotenv.env['APP_NAME']!;
}
