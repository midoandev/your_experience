import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'about_logic.dart';

class AboutUi extends StatelessWidget {
  static const String namePath = '/about';
  final logic = Get.find<AboutLogic>();
  final state = Get.find<AboutLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
