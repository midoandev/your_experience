import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/widgets/project_card.dart';
import 'package:your_experience/core/ui/widgets/site_kit.dart';
import 'package:your_experience/features/portfolio/view_model/portfolio_vm.dart';

/// Six earlier apps: three across on a laptop, two on a tablet or phone
/// (the line under each name is left out on a phone).
class PortfolioSection extends ConsumerWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(portfolioVmProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Heading(
          context.l10n.pastWorkTitle,
          muted: context.l10n.pastWorkSubtitle,
        ),
        AppSpacing.gapH(AppSpacing.xl),
        LayoutBuilder(
          builder: (context, c) {
            final cols = c.maxWidth >= 960 ? 3 : 2;
            final gap = c.maxWidth < 640 ? AppSpacing.sm + 4 : AppSpacing.lg;
            final w = (c.maxWidth - gap * (cols - 1)) / cols;
            final phone = c.maxWidth < 640;
            return Wrap(
              spacing: gap,
              runSpacing: phone ? AppSpacing.lg : AppSpacing.xl,
              children: [
                for (final p in projects)
                  SizedBox(
                    width: w,
                    child: ProjectCard(
                      name: p.name,
                      category: p.category,
                      summary: p.summary,
                      picture: p.card.path,
                      pictureRatio: p.card.aspectRatio,
                      pictureAlt: p.card.alt,
                      semanticLabel: context.l10n.openProjectName(p.name),
                      showSummary: !phone,
                      onTap: () => context.pushNamed(
                        'portfolio-detail',
                        pathParameters: {'id': p.id},
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
