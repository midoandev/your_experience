import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'home_state.dart';

class HomeLogic extends GetxController with GetTickerProviderStateMixin {
  final HomeState state = HomeState();

  @override
  void onInit() {
    state.tabController = TabController(vsync: this, length: state.menu.length);
    state.scrollController = AutoScrollController(
      viewportBoundaryGetter: () => const Rect.fromLTRB(0, 0, 0, 0),
      axis: Axis.vertical,
    );
    state.scrollController.addListener(() {
      var indexTab = (state.scrollController.offset / Get.height).round();
      Get.log('scrollController, $indexTab');
      state.currentIndexPage.value = indexTab;
      state.currentIndexPage.refresh();
      state.tabController
          .animateTo(indexTab, duration: const Duration(microseconds: 400));
    });
    super.onInit();
  }

  Future scrollToIndex(int index) async {
    if ((state.scrollController.offset / Get.height).round() == 0) return;
    await state.scrollController.scrollToIndex(index,
        preferPosition:
            index == 0 ? AutoScrollPosition.begin : AutoScrollPosition.end);
    state.scrollController.highlight(index);
  }

  @override
  void dispose() {
    state.tabController.dispose();
    state.scrollController.dispose();
    super.dispose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
