import 'package:get/get.dart';
import 'package:your_experience/utility/network/api_provider.dart';

import '../../../application/main_app_service.dart';
import 'home_page_state.dart';

class HomePageLogic extends GetxController {
  final HomePageState state = HomePageState();
  final app = Get.find<MainAppService>();
  final storage = Get.find<ApiProvider>();

  @override
  void onInit() {
    getMain();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> getMain() async {
    var res = await app.getMainInformation();
    Get.log('ress ${res.imageIam.toJson()}');
    var image = storage.getImage(res.imageIam.text);
    var imageUrl = await image.getDownloadURL();
    state.mainData.value = res;
    state.mainData.refresh();

    Get.log('ress $imageUrl');
  }
}
