import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_experience/data/portfolio_data.dart';
import 'package:your_experience/models/main_menu.dart';

part 'home_vm.g.dart';

@immutable
class HomeState {
  final List<MainMenu> sections;
  final bool isScrolled;

  /// Section currently in view (null while on the hero).
  final String? activeSection;

  const HomeState({
    required this.sections,
    required this.isScrolled,
    this.activeSection,
  });

  HomeState copyWith({bool? isScrolled, String? Function()? activeSection}) =>
      HomeState(
        sections: sections,
        isScrolled: isScrolled ?? this.isScrolled,
        activeSection: activeSection != null
            ? activeSection()
            : this.activeSection,
      );
}

/// Root VM for the home page: section list (nav) + scroll chrome state.
/// Scroll keys/controllers are widget concerns and live in the view.
@riverpod
class HomeVm extends _$HomeVm {
  static const _scrolledThreshold = 8.0;

  @override
  HomeState build() =>
      HomeState(sections: PortfolioData.getMainMenu(), isScrolled: false);

  /// Called on every scroll tick; only emits when something changes.
  void onScroll(double offset, {String? activeSection}) {
    final scrolled = offset > _scrolledThreshold;
    if (scrolled != state.isScrolled || activeSection != state.activeSection) {
      state = state.copyWith(
        isScrolled: scrolled,
        activeSection: () => activeSection,
      );
    }
  }
}
