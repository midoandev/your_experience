import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:your_experience/utility/shared/constants/common.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';

import '../../../utility/shared/widgets/header_widget/custom_switch.dart';
import 'home_logic.dart';

class HomeUi extends StatelessWidget {
  static const String namePath = '/main';
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
              preferredSize: const Size.fromHeight(Common.heightToolbar),
              child: Obx(() {
                var colorBasedTheme =
                    state.isLightMode.value ? Colors.black : Colors.white;
                return Visibility(
                  visible: state.currentIndexPage.value != 0,
                  child: AppBar(
                    title: TabBar(
                      isScrollable: true,
                      dividerColor: Colors.transparent,
                      indicatorColor: colorBasedTheme,
                      labelColor: colorBasedTheme,
                      unselectedLabelColor: colorBasedTheme.withOpacity(.4),
                      labelStyle: Get.textTheme.labelLarge?.copyWith(),
                      onTap: logic.scrollToIndex,
                      controller: state.tabController,
                      tabs: state.menu
                          .map((e) => Tab(
                                text: e.nameTab,
                              ))
                          .toList(),
                    ),
                    elevation: 1,
                    centerTitle: false,
                    automaticallyImplyLeading: false,
                    forceMaterialTransparency: true,
                    actions: [
                      Center(
                        child: Text(
                          'Mido',
                          style: Get.textTheme.displayMedium?.copyWith(
                            color: colorBasedTheme,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      8.zw,
                      Obx(() {
                        return Center(
                          child: CustomSwitch(
                            value: state.isLightMode.value,
                            onChanged: logic.changeTheme,
                          ),
                        );
                      }),
                      8.zw,
                    ],
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
