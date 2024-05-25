import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_logic.dart';

class SplashUi extends StatelessWidget {
  static const String namePath = '/';

  final logic = Get.put(SplashLogic());
  final state = Get.find<SplashLogic>().state;

  SplashUi({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logoWidth: 84,
      logo: Image.asset('assets/stickers/yoga_sticker.png'),
      title: Text(
        "Digital Portfolio",
        style: Get.textTheme.labelMedium!.copyWith(color: logic.colorText),
      ),
      backgroundColor: logic.colorBackground,
      showLoader: true,
      loaderColor: logic.colorText,
      loadingText: Text(
        "Wait a minute...",
        style: Get.textTheme.labelSmall!.copyWith(color: logic.colorText),
      ),
      // futureNavigator:  logic.futureCall(),
    );
  }
}
