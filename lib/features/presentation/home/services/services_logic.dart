import 'package:get/get.dart';
import 'package:your_experience/features/domain/entities/main_menu.dart';

import '../../../domain/entities/services_data.dart';
import '../home_logic.dart';
import 'services_state.dart';

class ServicesLogic extends GetxController {
  final ServicesState state = ServicesState();
  final logicMain = Get.find<HomeLogic>();

  MainMenu get menu => logicMain.state.menu.where((p0) => p0.nameTab == "Services").toList().first;
  List<ServicesData> listServices(List<ServicesData> originalList) {
    int newListLength = (originalList.length * 2)-1;
    List<ServicesData> newList =
        List<ServicesData>.filled(newListLength, ServicesData.empty());

    for (int i = 0; i < originalList.length; i++) {
      newList[i * 2] = originalList[i];
    }
    return newList;
  }

  @override
  void onReady() {
    // state.itemServices.clear();
    var items = logicMain.app.getServices();
    state.itemServices.assignAll(listServices(items));
    state.itemServices.refresh();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
