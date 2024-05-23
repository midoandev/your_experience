import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/shared/constants/style.dart';
import 'app_route.dart';
import 'binding.dart';
import 'env.dart';

class AppComponent extends StatelessWidget {
  ThemeMode themeMode;
  AppComponent({super.key, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    final myApp = GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: AppRouter.initialRoute,
      getPages: AppRouter.routes,
      scrollBehavior: AppScrollBehavior(),
      transitionDuration: const Duration(milliseconds: 500),
      initialBinding: AppBinding(),
      smartManagement: SmartManagement.keepFactory,
      title: Env.value.appName,
      color: Env.value.primarySwatch,
      // themeMode: ThemeMode.system,
      themeMode: themeMode,
      theme: StyleConstants.lightThemeData,
      darkTheme: StyleConstants.darkThemeData,
    );

    return myApp;
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
