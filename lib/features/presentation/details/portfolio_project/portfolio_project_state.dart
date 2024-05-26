import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_experience/features/domain/entities/projects_data.dart';

class PortfolioProjectState {
  var portfolio = ProjectsData.empty();

  PortfolioProjectState() {
    if (Get.arguments == null) return;
    var args = Get.arguments as ProjectsData;
    portfolio = args;
  }

  var scrollController = ScrollController();

}

class StickyValue {
  String title;
  String desc;

  StickyValue({required this.title, required this.desc});
}
