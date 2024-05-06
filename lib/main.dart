import 'package:flutter/material.dart';

import 'core/env.dart';

void main() => YourInit();

class YourInit extends Env {
  @override
  final String appName = 'Your Experience';
  @override
  final String baseUrl = 'midosaurus.web.app/#/'; //prod primary server
  @override
  final Color primarySwatch = Colors.black;
  @override
  final EnvType environmentType = EnvType.production;

}
