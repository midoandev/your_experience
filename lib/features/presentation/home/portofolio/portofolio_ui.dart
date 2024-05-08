import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'portofolio_logic.dart';

class PortofolioUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.put(PortofolioLogic());
    final state = Get.find<PortofolioLogic>().state;

    return Container();
  }
}
