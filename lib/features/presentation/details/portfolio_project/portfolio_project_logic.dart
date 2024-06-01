import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
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
  Future<void> gotoAddress(String address) async {
    final Uri url = Uri.parse(address);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
