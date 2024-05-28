import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:your_experience/features/domain/entities/main_menu.dart';
import 'package:your_experience/features/presentation/home/portfolio/portfolio_ui.dart';
import 'package:your_experience/features/presentation/home/services/services_ui.dart';

import '../../../utility/shared/constants/string_helper.dart';
import '../../domain/entities/main_profile.dart';
import 'contact/contact_ui.dart';
import 'footer/footer_ui.dart';
import 'home_page/home_page_ui.dart';

class HomeState {

  final scrollDirection = Axis.vertical;

  var currentIndexPage = 0.obs;
  late AutoScrollController scrollController;
  late TabController tabController;

  var mainData = MainProfile.empty().obs;

  var isLightMode = false.obs;
  var menu = <MainMenu>[].obs;
}
