import 'package:get/get.dart';

import 'portfolio_project_logic.dart';

class PortfolioProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PortfolioProjectLogic());
  }
}
