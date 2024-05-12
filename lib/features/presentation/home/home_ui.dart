import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:your_experience/features/presentation/home/home_page/home_page_ui.dart';
import 'package:your_experience/utility/shared/widgets/body_widget/button_inkwell.dart';

import 'home_logic.dart';

class HomeUi extends StatelessWidget {
  static const String namePath = '/';
  final logic = Get.find<HomeLogic>();
  final state = Get
      .find<HomeLogic>()
      .state;

  HomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
            options: const ParticleOptions(
                maxOpacity: .1, minOpacity: 0, opacityChangeRate: .11)),
        vsync: logic,
        child: CustomScrollView(
          controller: state.scrollController,
          slivers: [
            Obx(() {
              return SliverAppBar(
                forceMaterialTransparency: true,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                pinned: true,
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(10),
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: state.isExpanded.value ? 0 : 1,
                      child: TabBar(
                        onTap: logic.scrollToIndex,
                        controller: state.tabController,
                        tabs: state.menu
                            .map((e) =>
                            Tab(
                              text: e.nameTab,
                            ))
                            .toList(),
                      ),
                      // child: DefaultTabController(
                      //   length: state.menu.length,
                      //   child: TabBar(
                      //       onTap: logic.scrollToIndex,
                      //       tabs: state.menu
                      //           .map((e) =>
                      //           Tab(
                      //             text: e.nameTab,
                      //           ))
                      //           .toList()),
                      // ),
                    )),
                // flexibleSpace: const FlexibleSpaceBar(
                //   background: HomePageUi(),
                // ),
              );
            }),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return AutoScrollTag(
                    key: ValueKey(index),
                    controller: state.scrollController,
                    index: index,
                    child: state.menu[index].classWidget,
                  );
                },
                childCount: state.menu.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
