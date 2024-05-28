import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:your_experience/features/application/main_app_service.dart';
import 'package:your_experience/features/presentation/splash/splash_ui.dart';

import '../../../utility/network/api_provider.dart';
import '../../../utility/shared/constants/style.dart';
import 'home_state.dart';

class HomeLogic extends GetxController with GetTickerProviderStateMixin {
  final HomeState state = HomeState();

  final storage = Get.find<ApiProvider>();
  final app = Get.find<MainAppService>();

  @override
  void onInit() async {
    var res = app.getMainMenu();
    state.menu.assignAll(res);
    state.menu.refresh();
    var length = state.menu.length -1;

    getMainProfile();
    state.tabController = TabController(
        vsync: this, length: res.sublist(0, length).length);
    state.scrollController = AutoScrollController(
      viewportBoundaryGetter: () => const Rect.fromLTRB(0, 0, 0, 0),
      axis: Axis.vertical,
    );
    state.scrollController.addListener(() {
      var indexTab = (state.scrollController.offset / Get.height).round();
      if (indexTab == length) return;
      Get.log('scrollController, $indexTab');
      state.currentIndexPage.value = indexTab;
      state.currentIndexPage.refresh();
      state.tabController
          .animateTo(indexTab, duration: const Duration(microseconds: 400));
    });
    state.isLightMode.value = await StyleConstants.isLight;
    super.onInit();
  }

  Future scrollToIndex(int index) async {
    if ((state.scrollController.offset / Get.height).round() == 0) return;
    await state.scrollController.scrollToIndex(index,
        preferPosition:
            index == 0 ? AutoScrollPosition.begin : AutoScrollPosition.end);
    state.scrollController.highlight(index);
  }

  void changeTheme(bool value) async {
    // var theme = Get.theme;
    Get.log('dkflmskd $value');
    state.isLightMode.value = value;
    state.isLightMode.refresh();
    // Get.changeThemeMode(value ? ThemeMode.light : ThemeMode.dark);
    await app.changeTheme(value).then((value) {
      Get.offAllNamed(SplashUi.namePath);
    });
  }

  @override
  void dispose() {
    state.tabController.dispose();
    state.scrollController.dispose();
    super.dispose();
  }

  Future<void> getMainProfile() async {
    var res = app.getMainInformation();
    Get.log('main ${res.toJson()}');
    // var image = storage.getImage(res.imageIam.text);
    // var imageUrl = await image.getDownloadURL();
    state.mainData.value = res;
    state.mainData.refresh();

    // Get.log('ress $imageUrl');
  }
}
