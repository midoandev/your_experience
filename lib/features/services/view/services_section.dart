import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/theme/responsive.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/widgets/app_card.dart';
import 'package:your_experience/core/ui/widgets/responsive_grid.dart';
import 'package:your_experience/core/ui/widgets/section_header.dart';
import 'package:your_experience/data/icon_mapper.dart';
import 'package:your_experience/features/services/view_model/services_vm.dart';
import 'package:your_experience/models/services_data.dart';

/// "How I work" — four approach cards.
class ServicesSection extends ConsumerWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(servicesVmProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          index: '03',
          eyebrow: context.l10n.approachEyebrow,
          title: context.l10n.approachTitle,
        ),
        AppSpacing.gapH(AppSpacing.xl + AppSpacing.sm),
        if (vm.items.isEmpty)
          Text(
            context.l10n.noServices,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.custom.textMuted,
            ),
          )
        else
          ResponsiveGrid(
            minItemWidth: 300,
            itemCount: vm.items.length,
            itemBuilder: (_, i) =>
                _ApproachCard(index: i + 1, item: vm.items[i]),
          ),
      ],
    );
  }
}

class _ApproachCard extends StatelessWidget {
  final int index;
  final ServicesData item;

  const _ApproachCard({required this.index, required this.item});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.all(
        Responsive.isMobile(context)
            ? AppLayout.cardPadMobile
            : AppLayout.cardPad + 4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: AppLayout.touchTarget,
                height: AppLayout.touchTarget,
                decoration: BoxDecoration(
                  color: context.custom.accentSoft,
                  borderRadius: BorderRadius.circular(AppLayout.radiusMd),
                ),
                alignment: Alignment.center,
                child: iconWidget(
                  item.iconName,
                  size: AppLayout.iconMd + 2,
                  color: context.colors.primary,
                ),
              ),
              const Spacer(),
              ExcludeSemantics(
                child: Text(
                  index.toString().padLeft(2, '0'),
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.custom.textMuted,
                  ),
                ),
              ),
            ],
          ),
          AppSpacing.gapH(AppSpacing.lg - 4),
          Text(item.title, style: context.textTheme.titleMedium),
          AppSpacing.gapH(AppSpacing.sm),
          Text(
            item.description,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
