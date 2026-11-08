import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_html/html.dart' as html;
import 'package:your_experience/core/services/link_service.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/theme/app_theme.dart';
import 'package:your_experience/core/theme/responsive.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_duration.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/widgets/app_button.dart';
import 'package:your_experience/core/ui/widgets/app_chip.dart';
import 'package:your_experience/core/ui/widgets/section_header.dart';
import 'package:your_experience/data/icon_mapper.dart';
import 'package:your_experience/features/home_hero/view_model/hero_vm.dart';

/// Hero: the photo sits dimmed in the background and the words lead.
/// The panel always uses the dark palette (the photo is dark) so text
/// contrast is the same in light and dark mode.
class HeroSection extends ConsumerWidget {
  /// Scrolls the page to the contact section.
  final VoidCallback onContact;

  const HeroSection({super.key, required this.onContact});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(heroVmProvider);
    final isShort = Responsive.isShort(context);

    return Padding(
      padding: EdgeInsets.only(top: isShort ? AppSpacing.md : AppSpacing.lg),
      child: Theme(
        data: AppTheme.dark,
        child: LayoutBuilder(
          builder: (context, c) => _Panel(
            vm: vm,
            wide: c.maxWidth >= AppLayout.heroWideWidth,
            width: c.maxWidth,
            onContact: onContact,
          ),
        ),
      ),
    );
  }
}

class _Panel extends StatelessWidget {
  final HeroState vm;
  final bool wide;
  final double width;
  final VoidCallback onContact;

  const _Panel({
    required this.vm,
    required this.wide,
    required this.width,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    final cs = context.colors;
    final radius = BorderRadius.circular(
      wide ? AppLayout.radiusXl + 8 : AppLayout.radiusXl,
    );
    final screenH = context.screenHeight;
    final pad = wide ? AppSpacing.xxl + AppSpacing.md : AppSpacing.lg;
    // Phones: the photo is a band at the top; the text starts below it.
    final photoBand = (screenH * .34).clamp(220.0, 340.0);

    // The text decides the panel height, so nothing can overflow on any
    // device. On phones a spacer above the text keeps the face visible.
    final content = Padding(
      padding: EdgeInsets.fromLTRB(
        pad,
        wide ? pad : photoBand - AppSpacing.xl,
        pad,
        pad,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: wide ? (screenH * .72).clamp(480.0, 640.0) - pad * 2 : 0,
          maxWidth: wide ? width * .58 : double.infinity,
        ),
        child: _Copy(vm: vm, onContact: onContact),
      ),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: radius,
        border: Border.all(color: cs.outlineVariant),
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: Stack(
          children: [
            Positioned.fill(child: ColoredBox(color: cs.surface)),
            // Photo: right side on wide screens, full bleed on phones.
            if (wide)
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                width: width * .62,
                child: _Photo(
                  asset: vm.portraitAsset,
                  alignment: const Alignment(0, -0.5),
                ),
              )
            else
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: photoBand,
                child: _Photo(
                  asset: vm.portraitAsset,
                  alignment: const Alignment(0, -0.55),
                ),
              ),
            // Dim layer keeps the photo in the background.
            if (wide)
              Positioned.fill(child: _Scrim(wide: wide))
            else
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: photoBand,
                child: _Scrim(wide: wide),
              ),
            Align(alignment: Alignment.centerLeft, child: content),
          ],
        ),
      ),
    );
  }
}

class _Photo extends StatelessWidget {
  final String asset;
  final Alignment alignment;
  const _Photo({required this.asset, required this.alignment});

  @override
  Widget build(BuildContext context) {
    final dpr = MediaQuery.devicePixelRatioOf(context);
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    return Semantics(
      image: true,
      label: context.l10n.portraitAlt,
      child: Image.asset(
        asset,
        fit: BoxFit.cover,
        alignment: alignment,
        cacheWidth: (900 * dpr).round(),
        frameBuilder: (_, child, frame, sync) => AnimatedOpacity(
          opacity: sync || frame != null ? 1 : 0,
          duration: reduceMotion ? Duration.zero : AppDuration.slow,
          curve: Curves.easeOut,
          child: child,
        ),
        errorBuilder: (_, _, _) => const SizedBox.shrink(),
      ),
    );
  }
}

class _Scrim extends StatelessWidget {
  final bool wide;
  const _Scrim({required this.wide});

  @override
  Widget build(BuildContext context) {
    final bg = context.colors.surface;
    final glow = context.custom.glow;
    return IgnorePointer(
      child: Stack(
        fit: StackFit.expand,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: wide
                  // Solid behind the text, fading to a dimmed photo.
                  ? LinearGradient(
                      colors: [
                        bg,
                        bg.withValues(alpha: .94),
                        bg.withValues(alpha: .55),
                        bg.withValues(alpha: .38),
                      ],
                      stops: const [0, .36, .7, 1],
                    )
                  // Phones: photo at the top, text over a dark base.
                  : LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        bg.withValues(alpha: .30),
                        bg.withValues(alpha: .45),
                        bg.withValues(alpha: .85),
                        bg,
                      ],
                      stops: const [0, .5, .85, 1],
                    ),
            ),
          ),
          // Soft brand light from the top right.
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(1, -1),
                radius: 1.1,
                colors: [glow, glow.withValues(alpha: 0)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Copy extends StatelessWidget {
  final HeroState vm;
  final VoidCallback onContact;

  const _Copy({required this.vm, required this.onContact});

  @override
  Widget build(BuildContext context) {
    final cs = context.colors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _GlassStatus(
          label: context.l10n.availableLabel,
          dot: context.custom.success,
        ),
        AppSpacing.gapH(AppSpacing.lg),
        Text(
          context.l10n.heroGreeting(vm.profile.hiIam),
          style: context.textTheme.titleMedium?.copyWith(
            color: cs.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
        AppSpacing.gapH(AppSpacing.xs + 2),
        Eyebrow(context.l10n.heroRole),
        AppSpacing.gapH(AppSpacing.md + 4),
        Semantics(
          header: true,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Text(
              context.l10n.heroTitle,
              style: Responsive.displayStyle(context),
            ),
          ),
        ),
        AppSpacing.gapH(AppSpacing.lg - 4),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Text(
            context.l10n.heroDescription,
            style: context.textTheme.bodyLarge?.copyWith(
              color: cs.onSurfaceVariant,
            ),
          ),
        ),
        AppSpacing.gapH(AppSpacing.xl),
        Wrap(
          spacing: AppSpacing.md - 4,
          runSpacing: AppSpacing.md - 4,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            AppButton(
              label: context.l10n.ctaContact,
              icon: const Icon(Icons.mail_outline_rounded),
              onPressed: onContact,
            ),
            AppButton.secondary(
              label: context.l10n.downloadCv,
              icon: const Icon(Icons.description_outlined),
              onPressed: () => _openCv(context, vm.cvAssetPath),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final s in vm.socials)
                  IconButton(
                    tooltip: s.iconName == 'github'
                        ? context.l10n.gitHub
                        : context.l10n.linkedIn,
                    onPressed: () => _open(context, s.link),
                    icon: iconWidget(
                      s.iconName,
                      size: AppLayout.iconMd,
                      color: cs.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
          ],
        ),
        AppSpacing.gapH(AppSpacing.xl),
        _ProofRow(vm: vm),
      ],
    );
  }

  /// Opens the bundled CV page in a new tab. Resolved against the document
  /// base so it works from any route and on Firebase Hosting.
  Future<void> _openCv(BuildContext context, String assetPath) async {
    final base = Uri.parse(html.document.baseUri ?? Uri.base.toString());
    await _open(context, base.resolve('assets/$assetPath').toString());
  }

  Future<void> _open(BuildContext context, String url) async {
    final ok = await LinkService.open(url);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.l10n.cannotOpenLink)));
    }
  }
}

/// Short, verifiable proof under the CTAs (numbers come from the data).
class _ProofRow extends StatelessWidget {
  final HeroState vm;
  const _ProofRow({required this.vm});

  @override
  Widget build(BuildContext context) {
    final items = [
      context.l10n.proofYears(vm.years),
      context.l10n.proofApps(vm.appsShipped),
      if (vm.topApp != null)
        context.l10n.proofInstalls(vm.topApp!.installs, vm.topApp!.title),
    ];
    final style = context.textTheme.labelMedium?.copyWith(
      color: context.colors.onSurfaceVariant,
    );
    return Wrap(
      spacing: AppSpacing.md - 4,
      runSpacing: AppSpacing.sm,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final (i, t) in items.indexed) ...[
          if (i > 0)
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color: context.colors.primary,
                shape: BoxShape.circle,
              ),
            ),
          Text(t, style: style),
        ],
      ],
    );
  }
}

class _GlassStatus extends StatelessWidget {
  final String label;
  final Color dot;

  const _GlassStatus({required this.label, required this.dot});

  @override
  Widget build(BuildContext context) {
    final cs = context.colors;
    final radius = BorderRadius.circular(AppLayout.radiusFull);
    return ClipRRect(
      borderRadius: radius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md - 2,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: cs.surface.withValues(alpha: .55),
            borderRadius: radius,
            border: Border.all(color: cs.onSurface.withValues(alpha: .12)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              StatusDot(color: dot),
              AppSpacing.gapW(AppSpacing.sm),
              Flexible(
                child: Text(
                  label,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: cs.onSurface,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
