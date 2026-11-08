import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/theme/responsive.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/widgets/app_card.dart';
import 'package:your_experience/core/ui/widgets/app_chip.dart';
import 'package:your_experience/core/ui/widgets/responsive_grid.dart';
import 'package:your_experience/core/ui/widgets/section_header.dart';
import 'package:your_experience/data/icon_mapper.dart';
import 'package:your_experience/features/tech_stack/view_model/tech_stack_vm.dart';
import 'package:your_experience/models/tech_group.dart';

class TechStackSection extends ConsumerWidget {
  const TechStackSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(techStackVmProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          index: '04',
          eyebrow: context.l10n.stackEyebrow,
          title: context.l10n.stackTitle,
        ),
        AppSpacing.gapH(AppSpacing.xl + AppSpacing.sm),
        ResponsiveGrid(
          minItemWidth: 300,
          itemCount: vm.groups.length,
          itemBuilder: (_, i) => _GroupCard(group: vm.groups[i]),
        ),
      ],
    );
  }
}

class _GroupCard extends StatelessWidget {
  final TechGroup group;
  const _GroupCard({required this.group});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.all(
        Responsive.isMobile(context)
            ? AppLayout.cardPadMobile
            : AppLayout.cardPad,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              iconWidget(
                group.iconName,
                size: AppLayout.iconMd,
                color: context.colors.primary,
              ),
              AppSpacing.gapW(AppSpacing.md - 4),
              Text(group.title, style: context.textTheme.titleSmall),
            ],
          ),
          AppSpacing.gapH(AppSpacing.md),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [for (final t in group.items) AppChip(label: t)],
          ),
        ],
      ),
    );
  }
}
