import 'package:get/get.dart';

import 'onboarding_logic.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingLogic());
  }
}
