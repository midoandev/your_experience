import 'package:flutter/material.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';

const _techItems = [
  (icon: Icons.flutter_dash, label: 'Flutter'),
  (icon: Icons.code, label: 'Dart'),
  (icon: Icons.code, label: 'React Native'),
  (icon: Icons.android, label: 'Android Native'),
  (icon: Icons.water_drop, label: 'Riverpod'),
  (icon: Icons.account_tree, label: 'BLoC'),
  (icon: Icons.local_fire_department, label: 'Firebase'),
  (icon: Icons.cloud, label: 'Supabase'),
  (icon: Icons.alt_route, label: 'GoRouter'),
  (icon: Icons.workspaces, label: 'Melos'),
  (icon: Icons.speed, label: 'Fastlane'),
  (icon: Icons.auto_awesome, label: 'GitHub Actions'),
];

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '// tech stack',
          style: context.textTheme.labelSmall!
              .copyWith(letterSpacing: 1)
              .copyWith(color: context.custom.blue800),
        ),
        AppLayout.gapH24,
        LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = constraints.maxWidth > 768
                ? 3
                : constraints.maxWidth > 390
                ? 2
                : 1;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: AppLayout.cardGap,
                mainAxisSpacing: AppLayout.cardGap,
                childAspectRatio:6,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _techItems.length,
              itemBuilder: (_, index) => _TechCard(item: _techItems[index]),
            );
          },
        ),
      ],
    );
  }
}

class _TechCard extends StatelessWidget {
  final ({IconData icon, String label}) item;
  const _TechCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerLow,
        border: Border.all(
          color: context.colors.outlineVariant,
          width: AppLayout.cardBorder,
        ),
        borderRadius: BorderRadius.circular(AppLayout.cardRadius),
      ),
      child: Row(
        children: [
          Icon(item.icon, size: 20, color: context.custom.blue400),
          AppLayout.gapW10,
          Text(item.label, style: context.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
