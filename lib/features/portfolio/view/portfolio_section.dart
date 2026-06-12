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

class PortfolioSection extends ConsumerWidget {
  final bool featured;

  const PortfolioSection({super.key, this.featured = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(portfolioVmProvider);
    final projects = featured ? vm.projects.take(2).toList() : vm.projects;

    if (projects.isEmpty) {
      return Center(
        child: Padding(
          padding: AppSpacing.vXl,
          child: Text(context.l10n.noProjects, style: AppTextStyles.cardDesc),
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
              childAspectRatio: crossAxisCount > 1 ? 2.4 : 1.6,
              children: projects.map((project) {
                return _ProjectCard(project: project);
              }).toList(),
            ),
            if (featured) ...[AppLayout.gapH16, _SeeAllButton()],
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
              // Accent header
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
                    // Title row
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
                    // Framework + Category pills
                    Row(
                      children: [
                        _MiniPill(text: widget.project.framework),
                        AppLayout.gapW6,
                        _MiniPill(text: widget.project.category),
                      ],
                    ),
                    AppLayout.gapH10,
                    // Description
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
