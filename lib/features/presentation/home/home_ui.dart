import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:your_experience/utility/shared/constants/common.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';

import '../../../utility/shared/widgets/header_widget/custom_switch.dart';
import 'home_logic.dart';

class HomeUi extends StatelessWidget {
  static const String namePath = '/main';
  final logic = Get.find<HomeLogic>();
  final state = Get
      .find<HomeLogic>()
      .state;

  HomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallerThanDesktop =
    ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
    return Scaffold(
      // backgroundColor: Get.theme.primaryColorDark.withOpacity(.1),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(Common.heightToolbar),
          child: Obx(() {
            var colorBasedTheme =
            state.isLightMode.value ? Colors.black : Colors.white;
            return Visibility(
              visible: state.currentIndexPage.value != 0,
              child: AppBar(
                title: Visibility(
                  visible: !isSmallerThanDesktop,
                  child: Obx(() {
                    return TabBar(
                      isScrollable: true,
                      dividerColor: Colors.transparent,
                      indicatorColor: colorBasedTheme,
                      labelColor: colorBasedTheme,
                      unselectedLabelColor: colorBasedTheme.withOpacity(.4),
                      labelStyle: Get.textTheme.labelLarge?.copyWith(),
                      onTap: logic.scrollToIndex,
                      controller: state.tabController,
                      tabs: state.menu.sublist(0, state.menu.length - 1).map((
                          e) {
                        return Tab(
                          text: e.nameTab,
                        );
                      }).toList(),
                    );
                  }),
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
                  16.zw,
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
        ));
  }
}
