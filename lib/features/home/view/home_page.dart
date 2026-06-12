import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_experience/core/theme/app_colors.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/theme/app_text_styles.dart';
import 'package:your_experience/core/theme/responsive.dart';
import 'package:your_experience/features/home_hero/view/hero_section.dart';
import 'package:your_experience/features/portfolio/view/portfolio_section.dart';
import 'package:your_experience/features/services/view/services_section.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagePad = Responsive.pagePad(context);

    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.bgPrimary,
            elevation: 0,
            scrolledUnderElevation: 0,
            toolbarHeight: AppLayout.navHeight,
            title: NavBar(),
            titleSpacing: 0,
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: pagePad,
              right: pagePad,
              top: 28,
              bottom: 28,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: AppLayout.maxWidth,
                    ),
                    child: Column(
                      children: [
                        const HeroSection(),
                        const _SectionDivider(),
                        SectionLabel('// featured projects'),
                        AppLayout.gapH14,
                        const PortfolioSection(),
                        const _SectionDivider(),
                        SectionLabel('// services'),
                        AppLayout.gapH14,
                        const ServicesSection(),
                        const _SectionDivider(),
                        const ContactBar(),
                        AppLayout.gapH32,
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class NavBar extends ConsumerWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: AppLayout.navHeight,
      child: Row(
        children: [
          Text('mido.dev', style: AppTextStyles.logoText),
          const Spacer(),
          AvailableBadge(),
        ],
      ),
    );
  }
}

class AvailableBadge extends StatelessWidget {
  const AvailableBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.bgTagTeal,
        border: Border.all(
          color: AppColors.teal600,
          width: AppLayout.cardBorder,
        ),
        borderRadius: BorderRadius.circular(AppLayout.btnRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: AppColors.teal400,
              shape: BoxShape.circle,
            ),
          ),
          AppLayout.gapW6,
          Text('available', style: AppTextStyles.availLabel),
        ],
      ),
    );
  }
}

class SectionLabel extends StatelessWidget {
  final String label;
  const SectionLabel(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(label, style: AppTextStyles.sectionLabel),
    );
  }
}

class ContactBar extends ConsumerWidget {
  const ContactBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        border: Border.all(
          color: AppColors.border,
          width: AppLayout.cardBorder,
        ),
        borderRadius: BorderRadius.circular(AppLayout.cardRadius),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let's build something together",
                  style: AppTextStyles.cardDesc,
                ),
                AppLayout.gapH4,
                Text('andev.mido@gmail.com', style: AppTextStyles.emailText),
              ],
            ),
          ),
          Row(
            children: [
              _contactLink(context, 'GitHub', 'https://github.com/midoandev'),
              AppLayout.gapW8,
              _contactLink(
                context,
                'LinkedIn',
                'https://linkedin.com/in/agusrahmadimido',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _contactLink(BuildContext context, String label, String url) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.bgTag,
        border: Border.all(
          color: AppColors.borderAccent,
          width: AppLayout.cardBorder,
        ),
        borderRadius: BorderRadius.circular(AppLayout.btnRadius),
      ),
      child: Text(label, style: AppTextStyles.contactLink),
    );
  }
}

class _SectionDivider extends StatelessWidget {
  const _SectionDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.border,
      thickness: AppLayout.dividerThick,
      height: AppLayout.sectionGap * 2,
    );
  }
}
