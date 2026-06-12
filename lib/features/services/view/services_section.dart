import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_experience/core/theme/app_colors.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/theme/app_text_styles.dart';
import 'package:your_experience/features/services/view_model/services_vm.dart';

class ServicesSection extends ConsumerWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(servicesVmProvider);

    return Column(
      children: [
        Text(vm.title, style: AppTextStyles.sectionHeading),
        AppLayout.gapH4,
        Text(vm.description, style: AppTextStyles.heroDesc),
        AppLayout.gapH24,
        LayoutBuilder(
          builder: (context, constraints) {
            return GridView.count(
              crossAxisCount: constraints.maxWidth > 768 ? 4 : 2,
              crossAxisSpacing: AppLayout.cardGap,
              mainAxisSpacing: AppLayout.cardGap,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.5,
              children: vm.items.where((i) => i.iconName.isNotEmpty).map((
                item,
              ) {
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
        color: AppColors.bgCard,
        border: Border.all(
          color: AppColors.border,
          width: AppLayout.cardBorder,
        ),
        borderRadius: BorderRadius.circular(AppLayout.cardRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.cardTitle),
          AppLayout.gapH8,
          Text(description, style: AppTextStyles.cardDesc),
        ],
      ),
    );
  }
}
