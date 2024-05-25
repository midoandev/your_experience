import 'package:get/get.dart';
import 'package:your_experience/features/presentation/home/home_logic.dart';
import 'package:your_experience/utility/network/api_provider.dart';

import 'home_page_state.dart';

class HomePageLogic extends GetxController {
  final HomePageState state = HomePageState();
  final logicMain = Get.find<HomeLogic>();

}
