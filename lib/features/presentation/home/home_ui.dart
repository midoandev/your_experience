import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:your_experience/utility/shared/constants/common.dart';
import 'home_logic.dart';

class HomeUi extends StatelessWidget {
  static const String namePath = '/';
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  HomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
        behaviour: RandomParticleBehaviour(
            options: const ParticleOptions(
                maxOpacity: .1, minOpacity: 0, opacityChangeRate: .11)),
        vsync: logic,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize:
                  const Size.fromHeight(CommonConstants.heightToolbar),
              child: Obx(() {
                return Visibility(
                  // duration: Duration(milliseconds: 300),
                  visible: state.currentIndexPage.value != 0,
                  child: AppBar(
                    forceMaterialTransparency: true,
                    automaticallyImplyLeading: false,
                    bottom: TabBar(
                      onTap: logic.scrollToIndex,
                      controller: state.tabController,
                      tabs: state.menu
                          .map((e) => Tab(
                                text: e.nameTab,
                              ))
                          .toList(),
                    ),
                  ),
                );
              }),
            ),
            body: ListView.builder(
              controller: state.scrollController,
              // shrinkWrap: true,
              itemCount: state.menu.length,
              itemBuilder: (context, index) {
                return AutoScrollTag(
                  key: ValueKey(index),
                  controller: state.scrollController,
                  index: index,
                  child: state.menu[index].classWidget,
                );
              },
            )));
  }
}
