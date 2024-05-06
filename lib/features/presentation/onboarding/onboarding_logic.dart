import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'onboarding_state.dart';


class OnboardingLogic extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  final OnboardingState state = OnboardingState();


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  // moveTo() => AppRouter.router.navigateTo(Get.context!, MainPage.namePath, replace: true);
  // moveTo() => Get.offNamed(MainPage.namePath);
  // moveTo() => Navigator.pushReplacementNamed(
  //       Get.context!,
  //       MainPage.namePath,
  //     );

}
