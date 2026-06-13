import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/theme/responsive.dart';
import 'package:your_experience/core/ui/tokens/app_radius.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/features/portfolio/view_model/portfolio_vm.dart';
import 'package:your_experience/models/projects_data.dart';

import '../../../core/ui/widgets/project_card.dart';

class ProjectsPage extends ConsumerWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagePad = Responsive.pagePad(context);
    final vm = ref.watch(portfolioVmProvider);

    return Scaffold(
      backgroundColor: context.colors.surface,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: context.colors.surface,
            elevation: 0,
            centerTitle: false,
            scrolledUnderElevation: 0,
            toolbarHeight: AppLayout.navHeight,
            title: Padding(
              padding: EdgeInsets.only(left: pagePad),
              child: Text(
                context.l10n.allProjects,
                style: context.textTheme.bodySmall!
                    .copyWith(fontSize: 12)
                    .copyWith(color: context.colors.onSurfaceVariant),
              ),
            ),
            titleSpacing: 0,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: pagePad,
              vertical: AppLayout.sectionGap,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: AppLayout.maxWidth,
                    ),
                    child: vm.projects.isEmpty
                        ? Padding(
                            padding: AppSpacing.vXl,
                            child: Text(
                              context.l10n.noProjects,
                              style: context.textTheme.bodySmall,
                            ),
                          )
                        : LayoutBuilder(
                            builder: (context, constraints) {
                              final crossAxisCount = switch (Responsive.of(
                                context,
                              )) {
                                ScreenSize.desktop => 3,
                                ScreenSize.tablet => 2,
                                ScreenSize.mobile => 1,
                              };

                              return GridView.count(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: AppLayout.cardGap,
                                mainAxisSpacing: AppLayout.cardGap,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                childAspectRatio: crossAxisCount > 1
                                    ? 1.5
                                    : 3,
                                children: vm.projects.map((project) {
                                  return ProjectCard(project: project);
                                }).toList(),
                              );
                            },
                          ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

