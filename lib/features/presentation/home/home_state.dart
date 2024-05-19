import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:your_experience/features/presentation/home/portfolio/portfolio_ui.dart';
import 'package:your_experience/features/presentation/home/services/services_ui.dart';
import '../../../utility/shared/constants/string_helper.dart';
import 'contact/contact_ui.dart';
import 'home_page/home_page_ui.dart';

class HomeState {
  final scrollDirection = Axis.vertical;

  var currentIndexPage = 0.obs;
  late AutoScrollController scrollController;
  late TabController tabController;

  List<MenuMain> menu = [
    MenuMain(nameTab: 'Home', classWidget: const HomePageUi()),
    MenuMain(nameTab: 'Services', classWidget: ServicesUi()),
    MenuMain(nameTab: 'Portfolio', classWidget: PortfolioUi()),
    MenuMain(nameTab: 'Contact', classWidget: ContactUi()),
  ];
}

class MenuMain {
  String? id = StringHelper.randomId();
  String nameTab;
  StatelessWidget classWidget;

  MenuMain({this.id, required this.nameTab, required this.classWidget});
}
