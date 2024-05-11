import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'skills_logic.dart';

class SkillsUi extends StatelessWidget {
  const SkillsUi({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(SkillsLogic());
    final state = Get.find<SkillsLogic>().state;

    return Container(height: Get.height, color: Colors.grey);

  }
}
