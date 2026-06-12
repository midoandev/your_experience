import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:your_experience/data/portfolio_data.dart';
import 'package:your_experience/models/main_menu.dart';
import 'package:your_experience/models/main_profile.dart';

part 'home_vm.g.dart';

@immutable
class HomeState {
  final List<MainMenu> menu;
  final MainProfile profile;
  final bool isLightMode;
  final int currentIndex;
  final AutoScrollController scrollController;
  final TabController? tabController;

  const HomeState({
    required this.menu,
    required this.profile,
    required this.isLightMode,
    required this.currentIndex,
    required this.scrollController,
    this.tabController,
  });
}

@riverpod
class HomeVm extends _$HomeVm {
  @override
  HomeState build() {
    final menu = PortfolioData.getMainMenu();
    final profile = PortfolioData.getMainProfile();
    return HomeState(
      menu: menu,
      profile: profile,
      isLightMode: false,
      currentIndex: 0,
      scrollController: AutoScrollController(
        viewportBoundaryGetter: () => const Rect.fromLTRB(0, 0, 0, 0),
        axis: Axis.vertical,
      ),
    );
  }

  Future<void> scrollToIndex(int index) async {
    if ((state.scrollController.offset /
                WidgetsBinding.instance.window.physicalSize.height)
            .round() ==
        0)
      return;
    await state.scrollController.scrollToIndex(
      index,
      preferPosition: index == 0
          ? AutoScrollPosition.begin
          : AutoScrollPosition.end,
    );
    state.scrollController.highlight(index);
  }

  void updateIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }
}

extension HomeStateCopy on HomeState {
  HomeState copyWith({
    bool? isLightMode,
    int? currentIndex,
    TabController? tabController,
  }) {
    return HomeState(
      menu: menu,
      profile: profile,
      isLightMode: isLightMode ?? this.isLightMode,
      currentIndex: currentIndex ?? this.currentIndex,
      scrollController: scrollController,
      tabController: tabController ?? this.tabController,
    );
  }
}
