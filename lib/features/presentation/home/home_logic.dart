import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'home_state.dart';

class HomeLogic extends GetxController with GetTickerProviderStateMixin {
  final HomeState state = HomeState();

  @override
  void onInit() {
    state.scrollController.value.addListener(
        () {
          var value = state.scrollController.value;
          Get.log('scrollController, ${value.offset/Get.height}');
          state.isExpanded.value = Get.height > value.offset;
        }
      );
    super.onInit();
  }

  Future scrollToIndex(int index) async {
    await state.scrollController.value.scrollToIndex(index,
        preferPosition:index == 0 ? AutoScrollPosition.begin : AutoScrollPosition.end);
    state.scrollController.value.highlight(index);
  }
  @override
  void dispose() {
    state.scrollController.value.dispose();
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
