import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../home/home_logic.dart';
import 'footer_state.dart';

class FooterLogic extends GetxController {
  final FooterState state = FooterState();
  final logicMain = Get.find<HomeLogic>();

  @override
  void onReady() {
    var contacts = logicMain.app.getContacts();

    state.itemsContacts.assignAll(contacts);
    state.itemsContacts.refresh();
    super.onReady();
  }
  Future<void> gotoAddress(String address) async {
    final Uri url = Uri.parse(address);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
