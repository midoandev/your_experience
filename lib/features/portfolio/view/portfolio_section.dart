import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/theme/responsive.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/features/portfolio/view_model/portfolio_vm.dart';

import '../../../core/ui/widgets/app_card.dart';
import '../../../core/ui/widgets/app_chip.dart';

class PortfolioSection extends ConsumerWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(portfolioVmProvider);
    final projects = vm.projects;

    if (projects.isEmpty) {
      return Center(
        child: Padding(
          padding: AppSpacing.vXl,
          child: Text(
            context.l10n.noProjects,
            style: context.textTheme.bodySmall,
          ),
        ),
      );
    }

    return Builder(
      builder: (context) {
        final crossAxisCount = switch (Responsive.of(context)) {
          ScreenSize.desktop => 2,
          ScreenSize.tablet => 2,
          ScreenSize.mobile => 1,
        };
        final isMobile = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

        return Column(
          children: [
            GridView.count(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: AppLayout.cardGap,
              mainAxisSpacing: AppLayout.cardGap,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: isMobile ? 2.2  : 2.7,
              children: vm.projects.map((project) {
                return AppCard(
                  onTap: () => context.pushNamed('portfolio-detail', extra: project),
                  accentHeight: AppLayout.accentLineH,
                  child: Padding(
                    padding: const EdgeInsets.all(AppLayout.cardPad),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(project.title, style: context.textTheme.titleSmall),
                        AppLayout.gapH16,
                        Row(
                          children: [
                            AppChip(label: project.framework),
                            AppLayout.gapW6,
                            AppChip(label: project.category),
                          ],
                        ),
                        AppLayout.gapH10,
                        Text(
                          project.overview,
                          style: context.textTheme.bodySmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}