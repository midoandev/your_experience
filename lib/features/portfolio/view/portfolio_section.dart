import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/theme/responsive.dart';
import 'package:your_experience/core/ui/tokens/app_radius.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/features/portfolio/view_model/portfolio_vm.dart';

import '../../../core/ui/widgets/project_card.dart';

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

        return Column(
          children: [
            GridView.count(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: AppLayout.cardGap,
              mainAxisSpacing: AppLayout.cardGap,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: crossAxisCount > 1 ? 3: 3,
              children: vm.projects.map((project) {
                return ProjectCard(project: project);
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}

class _SeeAllButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = Responsive.isMobile(context);
    return SizedBox(
      width: isMobile ? double.infinity : null,
      child: OutlinedButton.icon(
        onPressed: () => context.pushNamed('projects'),
        icon: const Icon(Icons.grid_view_rounded, size: 16),
        label: Text(context.l10n.seeAllProjects),
        style: OutlinedButton.styleFrom(
          foregroundColor: context.colors.primary,
          side: BorderSide(color: context.colors.primary.withValues(alpha: .3)),
          padding: EdgeInsets.symmetric(
            horizontal: AppLayout.btnPadH * 2,
            vertical: AppLayout.btnPadV + 2,
          ),
          shape: RoundedRectangleBorder(borderRadius: AppRadius.circularLg),
        ),
      ),
    );
  }
}