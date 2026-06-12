import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/features/footer/view/footer_section.dart';
import 'package:your_experience/features/home/view_model/home_vm.dart';
import 'package:your_experience/features/home_hero/view/hero_section.dart';
import 'package:your_experience/features/portfolio/view/portfolio_section.dart';
import 'package:your_experience/features/services/view/services_section.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(homeVmProvider);
    final isSmallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Visibility(
          visible: vm.currentIndex != 0,
          child: AppBar(
            title: Visibility(
              visible: !isSmallerThanDesktop,
              child: TabBar(
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: context.colors.onSurface,
                labelColor: context.colors.onSurface,
                unselectedLabelColor: context.colors.onSurface.withValues(
                  alpha: .4,
                ),
                labelStyle: context.textTheme.labelLarge,
                onTap: (i) =>
                    ref.read(homeVmProvider.notifier).scrollToIndex(i),
                controller: vm.tabController,
                tabs: vm.menu.sublist(0, vm.menu.length - 1).map((e) {
                  return Tab(text: e.nameTab);
                }).toList(),
              ),
            ),
            elevation: 1,
            centerTitle: false,
            automaticallyImplyLeading: false,
            forceMaterialTransparency: true,
          ),
        ),
      ),
      body: ListView.builder(
        controller: vm.scrollController,
        itemCount: vm.menu.length,
        itemBuilder: (context, index) {
          return _buildSection(vm.menu[index].widgetKey);
        },
      ),
    );
  }

  Widget _buildSection(String widgetKey) {
    switch (widgetKey) {
      case 'home_hero':
        return const HeroSection();
      case 'services':
        return const ServicesSection();
      case 'portfolio':
        return const PortfolioSection();
      case 'footer':
        return const FooterSection();
      default:
        return const SizedBox();
    }
  }
}
