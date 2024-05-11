import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_experience/utility/shared/constants/string_helper.dart';

import 'portfolio_logic.dart';

class PortfolioUi extends StatelessWidget {
  const PortfolioUi({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(PortfolioLogic());
    final state = Get.find<PortfolioLogic>().state;

    return Container(height: Get.height, color: Colors.amber);
  }
}
