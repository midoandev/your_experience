import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/widgets/project_card.dart';
import 'package:your_experience/core/ui/widgets/site_kit.dart';
import 'package:your_experience/features/now/view_model/now_vm.dart';

/// "What I'm building now": the two projects in progress, side by side.
class NowSection extends ConsumerWidget {
  const NowSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(nowVmProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Heading(context.l10n.nowTitle, subtitle: context.l10n.nowSubtitle),
        AppSpacing.gapH(AppSpacing.xl),
        LayoutBuilder(
          builder: (context, c) {
            final two = c.maxWidth >= 640;
            final w = two ? (c.maxWidth - AppSpacing.lg) / 2 : c.maxWidth;
            return Wrap(
              spacing: AppSpacing.lg,
              runSpacing: AppSpacing.xl,
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
