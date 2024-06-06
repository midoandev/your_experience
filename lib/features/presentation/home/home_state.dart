import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:your_experience/features/domain/entities/main_menu.dart';

import '../../domain/entities/main_profile.dart';

class HomeState {

  final scrollDirection = Axis.vertical;

  var currentIndexPage = 0.obs;
  late AutoScrollController scrollController;
  late TabController tabController;

  var mainData = MainProfile.empty().obs;

  var isLightMode = false.obs;
  var menu = <MainMenu>[].obs;
}
