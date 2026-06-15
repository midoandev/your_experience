import 'package:flutter/material.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/widgets/app_card.dart';

const _howIWork = [
  (
    icon: Icons.code,
    title: 'Pixel-perfect Implementation',
    desc:
        'Translating Figma designs to Flutter with exact spacing, typography, and interaction — down to the last dp.',
  ),
  (
    icon: Icons.layers_outlined,
    title: 'Clean Architecture',
    desc:
        'Every project structured with separation of concerns — feature modules, clear data flow, and zero spaghetti.',
  ),
  (
    icon: Icons.phone_android,
    title: 'Cross-platform by Default',
    desc:
        'Flutter, React Native, Android Native — shipped to both stores with CI/CD via Fastlane and GitHub Actions.',
  ),
  (
    icon: Icons.autorenew,
    title: 'From Zero to Store',
    desc:
        'Not just code — architecture decisions, release pipeline, and post-launch maintenance included.',
  ),
];

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabelHowIWork(),
        AppLayout.gapH24,
        LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth > 768;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isDesktop ? 2 : 1,
                crossAxisSpacing: AppLayout.cardGap,
                mainAxisSpacing: AppLayout.cardGap,
                childAspectRatio: isDesktop ? 3.5 : 3,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _howIWork.length,
              itemBuilder: (_, index) => _HowIWorkCard(item: _howIWork[index]),
            );
          },
        ),
      ],
    );
  }
}

class SectionLabelHowIWork extends StatelessWidget {
  const SectionLabelHowIWork({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        '// how i work',
        style: context.textTheme.labelSmall!
            .copyWith(letterSpacing: 1)
            .copyWith(color: context.custom.blue800),
      ),
    );
  }
}

class _HowIWorkCard extends StatelessWidget {
  final ({IconData icon, String title, String desc}) item;
  const _HowIWorkCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top accent line
          Container(
            height: AppLayout.accentLineH,
            color: context.colors.primary,
          ),
          Padding(
            padding: const EdgeInsets.all(AppLayout.cardPad),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(item.icon, size: 16, color: context.custom.blue400),
                    AppLayout.gapW8,
                    Expanded(
                      child: Text(
                        item.title,
                        style: context.textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
                AppLayout.gapH8,
                Text(item.desc, style: context.textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
