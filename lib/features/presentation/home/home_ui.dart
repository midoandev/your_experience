import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:your_experience/utility/shared/constants/common.dart';

import '../../../utility/shared/widgets/header_widget/custom_switch.dart';
import 'home_logic.dart';

class HomeUi extends StatelessWidget {
  static const String namePath = '/main';

  HomeUi({super.key});

  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;
  @override
  Widget build(BuildContext context) {
    // Pengecekan ekstra aman untuk mencegah blank putih
    final responsive = ResponsiveBreakpoints.of(context);
    final bool isDesktop = responsive.largerThan(MOBILE);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(Common.heightToolbar),
        child: Obx(() {
          // Menggunakan index kustom atau pengecekan null
          if (state.currentIndexPage.value == 0) return const SizedBox.shrink();

          return AppBar(
            // Gunakan withOpacity untuk kompatibilitas web yang lebih luas
            backgroundColor: Get.theme.scaffoldBackgroundColor.withValues(alpha: 0.9),
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
            title: isDesktop
                ? TabBar(
              isScrollable: true,
              dividerColor: Colors.transparent,
              controller: state.tabController,
              onTap: logic.scrollToIndex,
              tabs: state.menu
                  .sublist(0, (state.menu.length - 1).clamp(0, 100))
                  .map((e) => Tab(text: e.nameTab))
                  .toList(),
            )
                : null,
            actions: [
              CustomSwitch(
                value: state.isLightMode.value,
                onChanged: logic.changeTheme,
              ),
              const SizedBox(width: 16),
            ],
          );
        }),
      ),
      body: ListView.builder(
        // Tambahkan physics agar scroll di web terasa alami
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        controller: state.scrollController,
        itemCount: state.menu.length,
        itemBuilder: (context, index) {
          return AutoScrollTag(
            key: ValueKey(index),
            controller: state.scrollController,
            index: index,
            child: state.menu[index].classWidget
          );
        },
      ),
    );
  }
  }