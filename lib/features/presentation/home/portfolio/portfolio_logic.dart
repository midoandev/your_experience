import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_experience/features/presentation/details/portfolio_project/portfolio_project_ui.dart';

import '../../../domain/entities/projects_data.dart';
import '../home_logic.dart';
import 'portfolio_state.dart';

class PortfolioLogic extends GetxController {
  final PortfolioState state = PortfolioState();
  final logicMain = Get.find<HomeLogic>();


  @override
  void onReady() {
    var getProject = logicMain.app.getProject();
    state.projects.assignAll(getProject);
    state.projects.refresh();
    super.onReady();
  }


  void toDetails(ProjectsData data){
    Get.toNamed(PortfolioProjectUi.namePath, arguments: data);
  }
}
