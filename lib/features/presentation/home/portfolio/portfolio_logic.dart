import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../application/main_app_service.dart';
import 'portfolio_state.dart';

class PortfolioLogic extends GetxController {
  final PortfolioState state = PortfolioState();
  final app = Get.find<MainAppService>();

  final ScrollController controller = ScrollController();
  final double _width = 200;

  void animateToIndex({bool isPlus = true}) {
    if ( isPlus && state.offsetScroll.value >= (state.projects.length * _width)) return;
    if (!isPlus && controller.offset < _width) return;
    state.offsetScroll.value =
        state.offsetScroll.value + (isPlus ? _width : (-_width));
    state.offsetScroll.refresh();
    controller.animateTo(
      state.offsetScroll.value,
      duration: const Duration(milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void onReady() {
    var getProject = app.getProject();
    state.projects.assignAll(getProject);
    state.projects.refresh();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
