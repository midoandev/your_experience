import 'package:get/get.dart';
import 'package:your_experience/features/presentation/home/contact/contact_logic.dart';
import 'package:your_experience/features/presentation/home/portfolio/portfolio_logic.dart';
import 'package:your_experience/features/presentation/home/services/services_logic.dart';

import 'home_logic.dart';
import 'home_page/home_page_logic.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeLogic(), fenix: true);
    Get.lazyPut(() => HomePageLogic());
    Get.lazyPut(() => ServicesLogic());
    Get.lazyPut(() => PortfolioLogic());
    Get.lazyPut(() => ContactLogic());
  }
}
