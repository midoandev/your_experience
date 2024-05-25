import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
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
