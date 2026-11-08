import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:your_experience/core/services/storage_service.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Clean URLs (/project/torcons instead of /#/project/torcons).
  usePathUrlStrategy();
  await StorageService.init();
  runApp(const ProviderScope(child: App()));
}
