import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/features/services/view_model/services_vm.dart';

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
              childAspectRatio: constraints.maxWidth > 768 ? 1.8 : 1.2,
              children: items.map((item) {
                return _ServiceCard(
                  title: item.title,
                  description: item.description,
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String title;
  final String description;

  const _ServiceCard({required this.title, required this.description});

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
          Text(title, style: context.textTheme.titleSmall),
          AppLayout.gapH8,
          Text(
            description,
            style: context.textTheme.bodySmall,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
