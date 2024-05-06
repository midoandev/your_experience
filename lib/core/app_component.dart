import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utility/shared/constants/style.dart';
import 'app_route.dart';
import 'binding.dart';
import 'env.dart';

class AppComponent extends StatelessWidget {
  const AppComponent({super.key});

  @override
  Widget build(BuildContext context) {

    final myApp = GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: Env.value.environmentType == EnvType.development,
      onGenerateRoute: AppRouter.generateRoute,
      scrollBehavior: AppScrollBehavior(),
      defaultTransition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 500),
      initialBinding: AppBinding(),
      smartManagement: SmartManagement.keepFactory,
      title: Env.value.appName,
      color: Env.value.primarySwatch,
      theme: ThemeData(
          fontFamily: 'cormorant',
          primarySwatch: Colors.blue,
          textTheme: StyleConstants.textTheme),
      themeMode: ThemeMode.light,
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