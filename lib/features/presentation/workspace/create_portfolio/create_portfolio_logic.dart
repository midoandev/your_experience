import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_experience/features/presentation/workspace/editor_content/editor_content_ui.dart';

import 'create_portfolio_state.dart';

class CreatePortfolioLogic extends GetxController {
  final CreatePortfolioState state = CreatePortfolioState();

  void tapToEditor(TextEditingController controller) async {
    Get.log('sdkmskmdkl ${controller.value.text}');
    var fromText = await Get.toNamed(EditorContentUi.namePath, arguments: controller.value.text);
    if (fromText == null) return;
    controller.text = fromText;
  }
}
