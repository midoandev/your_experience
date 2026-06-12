import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/theme/app_text_styles.dart';
import 'package:your_experience/core/theme/responsive.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/features/home_hero/view/hero_section.dart';
import 'package:your_experience/features/portfolio/view/portfolio_section.dart';
import 'package:your_experience/features/services/view/services_section.dart';
import 'package:your_experience/features/theme_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagePad = Responsive.pagePad(context);

    return Scaffold(
      backgroundColor: context.colors.surface,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: context.colors.surface,
            elevation: 0,
            scrolledUnderElevation: 0,
            toolbarHeight: AppLayout.navHeight,
            title: NavBar(pagePad: pagePad),
            titleSpacing: 0,
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: pagePad,
              right: pagePad,
              top: AppLayout.sectionGap,
              bottom: AppLayout.sectionGap,
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
                        SectionLabel(context.l10n.featuredProjects),
                        AppLayout.gapH14,
                        const PortfolioSection(featured: true),
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
  final double pagePad;
  const NavBar({super.key, required this.pagePad});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeModeProvider) == ThemeMode.dark;
    final locale = ref.watch(localeProvider);
    final isEn = locale.languageCode == 'en';

    return Padding(
      padding: EdgeInsets.only(left: pagePad, right: AppSpacing.sm),
      child: SizedBox(
        height: AppLayout.navHeight,
        child: Row(
          children: [
            Text(
              'mido',
              style: AppTextStyles.logoText.copyWith(
                color: context.custom.blue200,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () => ref.read(localeProvider.notifier).toggle(),
              icon: Text(
                isEn ? 'ID' : 'EN',
                style: AppTextStyles.navLink.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isEn
                      ? context.custom.blue200
                      : context.custom.textMuted,
                ),
              ),
              tooltip: isEn
                  ? context.l10n.switchLangToIndo
                  : context.l10n.switchLangToEng,
            ),
            IconButton(
              onPressed: () => ref.read(themeModeProvider.notifier).toggle(),
              icon: Icon(
                isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                size: 20,
                color: context.custom.textMuted,
              ),
              tooltip: isDark
                  ? context.l10n.switchThemeToLight
                  : context.l10n.switchThemeToDark,
            ),
            AvailableBadge(),
          ],
        ),
      ),
    );
  }
}

class AvailableBadge extends StatelessWidget {
  const AvailableBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.xs * 3,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: context.custom.bgTagTeal,
        border: Border.all(
          color: context.colors.tertiary,
          width: AppLayout.cardBorder,
        ),
        borderRadius: BorderRadius.circular(AppLayout.btnRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: AppSpacing.sm,
            height: AppSpacing.sm,
            decoration: BoxDecoration(
              color: context.custom.teal400,
              shape: BoxShape.circle,
            ),
          ),
          AppLayout.gapW6,
          Text(
            context.l10n.availableLabel,
            style: AppTextStyles.availLabel.copyWith(
              color: context.custom.teal200,
            ),
          ),
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
      child: Text(
        label,
        style: AppTextStyles.sectionLabel.copyWith(
          color: context.custom.blue800,
        ),
      ),
    );
  }
}

class ContactBar extends ConsumerWidget {
  const ContactBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppLayout.cardPadH,
        vertical: AppSpacing.lg,
      ),
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.l10n.letsBuild, style: AppTextStyles.cardDesc),
                AppLayout.gapH4,
                Text(
                  'andev.mido@gmail.com',
                  style: AppTextStyles.emailText.copyWith(
                    color: context.custom.blue200,
                  ),
                ),
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
    return GestureDetector(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppLayout.cardPad,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: context.custom.bgTag,
          border: Border.all(
            color: context.custom.borderAccent,
            width: AppLayout.cardBorder,
          ),
          borderRadius: BorderRadius.circular(AppLayout.btnRadius),
        ),
        child: Text(
          label,
          style: AppTextStyles.contactLink.copyWith(
            color: context.custom.blue200,
          ),
        ),
      ),
    );
  }
}

class _SectionDivider extends StatelessWidget {
  const _SectionDivider();

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: context.colors.outlineVariant,
      thickness: AppLayout.dividerThick,
      height: AppLayout.sectionGap * 2,
    );
  }
}
