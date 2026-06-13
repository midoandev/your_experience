import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_radius.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/data/icon_mapper.dart';
import 'package:your_experience/features/services/view_model/services_vm.dart';
import 'package:your_experience/models/services_data.dart';

class ServicesSection extends ConsumerWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(servicesVmProvider);

    return Column(
      children: [
        Text(vm.title, style: context.textTheme.titleSmall),
        AppLayout.gapH4,
        Text(vm.description, style: context.textTheme.bodyMedium),
        AppLayout.gapH24,
        LayoutBuilder(
          builder: (context, constraints) {
            final items = vm.items.where((i) => i.iconName.isNotEmpty).toList();
            if (items.isEmpty) {
              return Center(
                child: Padding(
                  padding: AppSpacing.vXl,
                  child: Text(
                    context.l10n.noServices,
                    style: context.textTheme.bodySmall,
                  ),
                ),
              );
            }
            return GridView.count(
              crossAxisCount: constraints.maxWidth > 768 ? 4 : 2,
              crossAxisSpacing: AppLayout.cardGap,
              mainAxisSpacing: AppLayout.cardGap,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: constraints.maxWidth > 768 ? .8 : 1,
              children: items.map((item) => _ServiceCard(item: item)).toList(),
            );
          },
        ),
      ],
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final ServicesData item;

  const _ServiceCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppLayout.cardPad),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerLow,
        border: Border.all(
          color: context.colors.outlineVariant,
          width: AppLayout.cardBorder,
        ),
        borderRadius: BorderRadius.circular(AppLayout.cardRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon at top
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: context.custom.bgTag,
              borderRadius: AppRadius.circularMd,
            ),
            child: Center(
              child: iconWidget(
                item.iconName,
                size: 20,
                color: context.custom.blue400,
              ),
            ),
          ),
          AppLayout.gapH10,
          Text(item.title, style: context.textTheme.titleSmall),
          AppLayout.gapH8,
          Expanded(
            child: Text(
              item.description,
              style: context.textTheme.bodySmall,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
