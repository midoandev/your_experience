import 'package:get/get.dart';

import 'create_portfolio_logic.dart';

class CreatePortfolioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatePortfolioLogic());
  }
}
