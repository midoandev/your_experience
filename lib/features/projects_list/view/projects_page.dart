import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/theme/app_text_styles.dart';
import 'package:your_experience/core/theme/responsive.dart';
import 'package:your_experience/core/ui/tokens/app_radius.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/features/portfolio/view_model/portfolio_vm.dart';
import 'package:your_experience/models/projects_data.dart';

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
            scrolledUnderElevation: 0,
            toolbarHeight: AppLayout.navHeight,
            title: Padding(
              padding: EdgeInsets.only(left: pagePad),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.goNamed('home'),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_rounded,
                          size: 20,
                          color: context.custom.textMuted,
                        ),
                        AppLayout.gapW8,
                        Text('mido.dev', style: AppTextStyles.logoText),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    context.l10n.seeAllProjects,
                    style: AppTextStyles.navLink.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                ],
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
                              style: AppTextStyles.cardDesc,
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
                                    : 1.3,
                                children: vm.projects.map((project) {
                                  return _ProjectCard(project: project);
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

class _ProjectCard extends StatefulWidget {
  final ProjectsData project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () =>
            context.pushNamed('portfolio-detail', extra: widget.project),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: _hovered
                ? context.colors.surfaceContainerHigh
                : context.colors.surfaceContainerLow,
            border: Border.all(
              color: _hovered
                  ? context.custom.borderAccent
                  : context.colors.outlineVariant,
              width: AppLayout.cardBorder,
            ),
            borderRadius: BorderRadius.circular(AppLayout.cardRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: AppLayout.accentLineH + 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: _hovered
                        ? [context.colors.primary, context.custom.teal400]
                        : [context.custom.blue800, context.custom.blue800],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppLayout.cardPad),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.project.title,
                            style: AppTextStyles.cardTitle,
                          ),
                        ),
                      ],
                    ),
                    AppLayout.gapH6,
                    Row(
                      children: [
                        _MiniPill(text: widget.project.framework),
                        AppLayout.gapW6,
                        _MiniPill(text: widget.project.category),
                      ],
                    ),
                    AppLayout.gapH10,
                    Text(
                      _stripHtml(widget.project.overview),
                      style: AppTextStyles.cardDesc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _stripHtml(String html) {
    return html.replaceAll(RegExp(r'<[^>]*>'), '');
  }
}

class _MiniPill extends StatelessWidget {
  final String text;
  const _MiniPill({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: context.custom.bgTag,
        border: Border.all(
          color: context.custom.blue800,
          width: AppLayout.cardBorder,
        ),
        borderRadius: AppRadius.circularSm,
      ),
      child: Text(text, style: AppTextStyles.cardTag),
    );
  }
}
