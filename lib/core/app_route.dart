import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_experience/features/presentation/about/about_binding.dart';
import 'package:your_experience/features/presentation/about/about_ui.dart';
import 'package:your_experience/features/presentation/home/home_binding.dart';
import 'package:your_experience/features/presentation/home/home_ui.dart';


class AppRouter {
  static const initialRoute = HomeUi.namePath;

  static final routes = [
    GetPage(
      name: HomeUi.namePath,
      page: () => HomeUi(),
      binding: HomeBinding(),
    ), GetPage(
      name: AboutUi.namePath,
      page: () => AboutUi(),
      binding: AboutBinding(),
    ),
  ];

  static var generateRoute = (settings) {
    String name = settings.name ?? '';
    Get.log('adkmfkadsm namemme ${name.substring(1)}');

    return MaterialPageRoute(
        builder: (_) => HomeUi(),
        fullscreenDialog: true,
        maintainState: false,
        settings: const RouteSettings(name: AppRouter.initialRoute));
  };
}