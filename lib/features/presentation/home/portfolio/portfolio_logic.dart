import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_experience/features/presentation/details/portfolio_project/portfolio_project_ui.dart';

import '../../../domain/entities/projects_data.dart';
import '../home_logic.dart';
import 'portfolio_state.dart';

class PortfolioLogic extends GetxController {
  final PortfolioState state = PortfolioState();
  final logicMain = Get.find<HomeLogic>();

  final ScrollController controller = ScrollController();
  final double _width = 600;

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
    var getProject = logicMain.app.getProject();
    state.projects.assignAll(getProject);
    state.projects.refresh();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void toDetails(ProjectsData data){
    Get.toNamed(PortfolioProjectUi.namePath, arguments: data);
  }
}
