import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_experience/core/theme/app_colors.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/theme/app_text_styles.dart';
import 'package:your_experience/core/theme/responsive.dart';
import 'package:your_experience/features/portfolio/view_model/portfolio_vm.dart';
import 'package:your_experience/models/projects_data.dart';

class PortfolioSection extends ConsumerWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(portfolioVmProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = switch (Responsive.of(context)) {
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
          childAspectRatio: 1.2,
          children: vm.projects.map((project) {
            return _ProjectCard(project: project);
          }).toList(),
        );
      },
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: _hovered ? AppColors.bgCardHover : AppColors.bgCard,
          border: Border.all(
            color: _hovered ? AppColors.borderAccent : AppColors.border,
            width: AppLayout.cardBorder,
          ),
          borderRadius: BorderRadius.circular(AppLayout.cardRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Accent line
            Container(
              height: AppLayout.accentLineH,
              color: _hovered ? AppColors.blue600 : AppColors.blue800,
            ),
            Padding(
              padding: const EdgeInsets.all(AppLayout.cardPad),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.project.framework} · ${widget.project.category}',
                    style: AppTextStyles.cardTag,
                  ),
                  AppLayout.gapH8,
                  Text(widget.project.title, style: AppTextStyles.cardTitle),
                  const SizedBox(height: 5),
                  Text(
                    _stripHtml(widget.project.overview),
                    style: AppTextStyles.cardDesc,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AppLayout.gapH12,
                  _TagRow(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _stripHtml(String html) {
    return html.replaceAll(RegExp(r'<[^>]*>'), '');
  }
}

class _TagRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: 5,
      children: [
        _PillTag(text: 'flutter', isTeal: false),
        _PillTag(text: 'mobile', isTeal: false),
        _PillTag(text: 'cross-platform', isTeal: true),
      ],
    );
  }
}

class _PillTag extends StatelessWidget {
  final String text;
  final bool isTeal;

  const _PillTag({required this.text, this.isTeal = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: isTeal ? AppColors.bgTagTeal : AppColors.bgTag,
        border: Border.all(
          color: isTeal ? AppColors.teal600 : AppColors.blue800,
          width: AppLayout.cardBorder,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: isTeal ? AppTextStyles.pillTeal : AppTextStyles.pillBlue,
      ),
    );
  }
}
