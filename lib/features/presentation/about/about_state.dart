import 'package:get/get.dart';

import '../home/contact/contact_ui.dart';
import '../home/home_state.dart';
import '../home/portfolio/portfolio_ui.dart';

class AboutState {
  AboutState() {
    var keyList = [
      MenuMain(
        nameTab: 'Portfolio',
        classWidget: PortfolioUi(),
      ),
      MenuMain(nameTab: 'Contact', classWidget: ContactUi()),
    ];
    menu.assignAll(keyList);
  }

  List<MenuMain> menu = [];
}
