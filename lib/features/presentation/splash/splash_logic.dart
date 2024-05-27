import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_experience/features/presentation/home/home_ui.dart';

import '../../../utility/shared/constants/style.dart';
import 'splash_state.dart';

class SplashLogic extends GetxController {
  final SplashState state = SplashState();

  @override
  void onReady() async {
    state.isLightMode.value = await StyleConstants.isLight;
    super.onReady();
  }

  @override
  void onInit() async {
    super.onInit();
    Timer(const Duration(seconds: 3), () {
      Get.offNamed(HomeUi.namePath);
    });
  }

  Color get colorBackground {
    return state.isLightMode.isTrue
        ? Colors.white
        : Colors.black.withOpacity(.9);
  }

  Color get colorText {
    return state.isLightMode.isFalse
        ? Colors.white
        : Colors.black.withOpacity(.9);
  }
}
