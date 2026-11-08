import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/theme/responsive.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/widgets/app_card.dart';
import 'package:your_experience/core/ui/widgets/app_chip.dart';
import 'package:your_experience/core/ui/widgets/section_header.dart';
import 'package:your_experience/features/about/view_model/about_vm.dart';

/// "The person behind the apps": a small photo + name in the card header,
/// then the bio and three number tiles. The words lead; the photo is a
/// friendly face, not the subject (the hero already carries the big one).
class AboutSection extends ConsumerWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(aboutVmProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          index: '02',
          eyebrow: context.l10n.aboutEyebrow,
          title: context.l10n.aboutTitle,
        ),
        AppSpacing.gapH(AppSpacing.xl + AppSpacing.sm),
        _BioCard(vm: vm),
        AppSpacing.gapH(AppLayout.cardGap),
        _Numbers(vm: vm),
      ],
    );
  }
}

class _BioCard extends StatelessWidget {
  final AboutState vm;
  const _BioCard({required this.vm});

  @override
  Widget build(BuildContext context) {
    final cs = context.colors;
    final paragraphs = vm.bio.split('\n\n');
    final isMobile = Responsive.isMobile(context);

    return AppCard(
      padding: EdgeInsets.all(
        isMobile ? AppLayout.cardPadMobile : AppSpacing.xl + AppSpacing.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Identity(vm: vm, size: isMobile ? 56 : 72),
          AppSpacing.gapH(AppSpacing.lg),
          Divider(color: cs.outlineVariant, height: 1),
          AppSpacing.gapH(AppSpacing.lg),
          for (final (i, p) in paragraphs.indexed) ...[
            if (i > 0) AppSpacing.gapH(AppSpacing.md),
            ConstrainedBox(
              // ~65-75 characters per line.
              constraints: const BoxConstraints(maxWidth: 680),
              child: Text(
                p,
                style: i == 0
                    ? context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        height: 1.55,
                        color: cs.onSurface,
                      )
                    : context.textTheme.bodyMedium?.copyWith(
                        color: cs.onSurfaceVariant,
                      ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Small round photo + name, role and availability.
class _Identity extends StatelessWidget {
  final AboutState vm;
  final double size;

  const _Identity({required this.vm, required this.size});

  @override
  Widget build(BuildContext context) {
    final cs = context.colors;
    final dpr = MediaQuery.devicePixelRatioOf(context);

    return Row(
      children: [
        Container(
          width: size,
          height: size,
          padding: const EdgeInsets.all(2.5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: cs.primary.withValues(alpha: .45),
              width: 1.5,
            ),
          ),
          child: ClipOval(
            child: ColoredBox(
              color: cs.surfaceContainerHigh,
              child: Semantics(
                image: true,
                label: context.l10n.portraitAlt,
                child: Image.asset(
                  vm.photoAsset,
                  fit: BoxFit.cover,
                  cacheWidth: (size * dpr).round(),
                  errorBuilder: (_, _, _) => Icon(
                    Icons.person_outline_rounded,
                    color: context.custom.textMuted,
                  ),
                ),
              ),
            ),
          ),
        ),
        AppSpacing.gapW(AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(vm.name, style: context.textTheme.titleMedium),
              AppSpacing.gapH(2),
              Text(
                vm.role,
                style: context.textTheme.bodySmall?.copyWith(
                  color: cs.onSurfaceVariant,
                ),
              ),
              AppSpacing.gapH(AppSpacing.xs + 2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: StatusDot(color: context.custom.success),
                  ),
                  AppSpacing.gapW(AppSpacing.sm),
                  Expanded(
                    child: Text(
                      context.l10n.availableForRoles,
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.custom.success,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Three proof tiles. Numbers come from the data (Google Play for installs).
class _Numbers extends StatelessWidget {
  final AboutState vm;
  const _Numbers({required this.vm});

  @override
  Widget build(BuildContext context) {
    final items = [
      ('${vm.years}', '+', context.l10n.yearsExperience),
      ('${vm.liveApps}', '', context.l10n.liveOnStores),
      if (vm.topApp != null)
        (
          vm.topApp!.installs.replaceAll('+', ''),
          '+',
          context.l10n.statInstallsOn(vm.topApp!.title),
        ),
    ];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final (i, (n, suffix, label)) in items.indexed) ...[
          if (i > 0) AppSpacing.gapW(AppLayout.cardGap),
          Expanded(
            child: AppCard(
              padding: EdgeInsets.all(
                Responsive.isMobile(context)
                    ? AppSpacing.md
                    : AppLayout.cardPad,
              ),
              child: _Stat(number: n, suffix: suffix, label: label),
            ),
          ),
        ],
      ],
    );
  }
}

class _Stat extends StatelessWidget {
  final String number;
  final String suffix;
  final String label;

  const _Stat({
    required this.number,
    required this.suffix,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final numStyle =
        (Responsive.isMobile(context)
                ? context.textTheme.headlineSmall
                : context.textTheme.headlineMedium)
            ?.copyWith(
              fontFamily: context.textTheme.labelMedium?.fontFamily,
              fontWeight: FontWeight.w600,
              letterSpacing: -1,
              fontFeatures: const [FontFeature.tabularFigures()],
            );
    return MergeSemantics(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: number,
              children: [
                TextSpan(
                  text: suffix,
                  style: TextStyle(color: context.colors.primary),
                ),
              ],
            ),
            style: numStyle,
          ),
          AppSpacing.gapH(AppSpacing.xs),
          Text(
            label,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.custom.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
