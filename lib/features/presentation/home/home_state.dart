import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:your_experience/features/presentation/home/portfolio/portfolio_ui.dart';
import 'package:your_experience/features/presentation/home/skills/skills_ui.dart';
import '../../../utility/shared/constants/string_helper.dart';
import 'contact/contact_ui.dart';
import 'home_page/home_page_ui.dart';

class HomeState {
  final scrollDirection = Axis.vertical;

  var isExpanded = true.obs;
  late AutoScrollController scrollController;
  late TabController tabController;

  List<MenuMain> menu = [
    MenuMain(nameTab: 'Home', classWidget: HomePageUi()),
    MenuMain(nameTab: 'Portfolio', classWidget: PortfolioUi()),
    MenuMain(nameTab: 'Skills', classWidget: SkillsUi()),
    MenuMain(nameTab: 'Contact', classWidget: ContactUi()),
  ];
}

class MenuMain {
  String? id = StringHelper.randomId();
  String nameTab;
  StatelessWidget classWidget;

  MenuMain({this.id, required this.nameTab, required this.classWidget});
}
