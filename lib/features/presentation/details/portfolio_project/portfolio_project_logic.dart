import 'package:get/get.dart';
import 'package:your_experience/features/application/main_app_service.dart';

import 'portfolio_project_state.dart';

class PortfolioProjectLogic extends GetxController {
  final PortfolioProjectState state = PortfolioProjectState();

  final app = Get.find<MainAppService>();
  @override
  void onReady() {
    var item = app.getProject().first;
    state.portfolio = item;
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
