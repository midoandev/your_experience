import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_experience/core/services/link_service.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/theme/responsive.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/widgets/app_button.dart';
import 'package:your_experience/core/ui/widgets/app_chip.dart';
import 'package:your_experience/core/ui/widgets/section_header.dart';
import 'package:your_experience/data/icon_mapper.dart';
import 'package:your_experience/features/contact/view_model/contact_vm.dart';

class ContactSection extends ConsumerWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(contactVmProvider);
    final cs = context.colors;
    final custom = context.custom;
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.value(
          context,
          mobile: AppSpacing.lg,
          tablet: AppSpacing.xxl,
          desktop: AppSpacing.xxl + AppSpacing.lg,
        ),
        vertical: Responsive.value(
          context,
          mobile: AppSpacing.xl + AppSpacing.sm,
          tablet: AppSpacing.xxl,
          desktop: AppSpacing.xxl + AppSpacing.lg,
        ),
      ),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppLayout.radiusXl),
        border: Border.all(color: cs.outlineVariant),
        gradient: RadialGradient(
          center: const Alignment(0.9, -1.1),
          radius: 1.4,
          colors: [
            Color.alphaBlend(custom.glow, cs.surfaceContainerLow),
            cs.surfaceContainerLow,
          ],
        ),
      ),
      child: LayoutBuilder(
        builder: (context, c) {
          final text = _text(context, vm, isMobile);
          if (c.maxWidth < AppLayout.contactSplitWidth) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ProfileCard(vm: vm, compact: true),
                AppSpacing.gapH(AppSpacing.xl),
                text,
              ],
            );
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: text),
              AppSpacing.gapW(AppSpacing.xxl),
              SizedBox(width: 260, child: _ProfileCard(vm: vm)),
            ],
          );
        },
      ),
    );
  }

  Widget _text(BuildContext context, ContactState vm, bool isMobile) {
    final cs = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Eyebrow('05 · ${context.l10n.contactEyebrow}'),
        AppSpacing.gapH(AppSpacing.md),
        Semantics(
          header: true,
          child: Text(
            context.l10n.letsBuild,
            style: isMobile
                ? context.textTheme.headlineMedium
                : context.textTheme.displaySmall,
          ),
        ),
        AppSpacing.gapH(AppSpacing.md),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppLayout.maxReadingWidth,
          ),
          child: Text(
            context.l10n.contactDescription,
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
              // Full address doesn't fit a 375px button; it's still
              // reachable via "Copy email" and the mailto link.
              label: context.screenWidth < 520
                  ? context.l10n.emailMe
                  : vm.email,
              icon: const Icon(Icons.mail_outline_rounded),
              onPressed: () => _open(context, 'mailto:${vm.email}'),
            ),
            AppButton.secondary(
              label: context.l10n.copyEmail,
              icon: const Icon(Icons.copy_rounded),
              onPressed: () => _copy(context, vm.email),
            ),
            for (final s in vm.socials)
              AppButton.ghost(
                label: s.iconName == 'github'
                    ? context.l10n.gitHub
                    : context.l10n.linkedIn,
                icon: iconWidget(
                  s.iconName,
                  size: AppLayout.iconSm,
                  color: cs.onSurfaceVariant,
                ),
                onPressed: () => _open(context, s.link),
              ),
          ],
        ),
      ],
    );
  }

  Future<void> _copy(BuildContext context, String email) async {
    await Clipboard.setData(ClipboardData(text: email));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(context.l10n.emailCopied)));
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

/// "Business card": photo with head and shoulders, name, role and status.
class _ProfileCard extends StatelessWidget {
  final ContactState vm;
  final bool compact;

  const _ProfileCard({required this.vm, this.compact = false});

  @override
  Widget build(BuildContext context) {
    final cs = context.colors;
    final size = compact ? 64.0 : 128.0;
    final dpr = MediaQuery.devicePixelRatioOf(context);

    final photo = Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(3),
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
          child: Image.asset(
            vm.avatarAsset,
            fit: BoxFit.cover,
            cacheWidth: (size * dpr).round(),
            excludeFromSemantics: true,
            errorBuilder: (_, _, _) => Icon(
              Icons.person_outline_rounded,
              color: context.custom.textMuted,
            ),
          ),
        ),
      ),
    );

    final status = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        StatusDot(color: context.custom.success),
        AppSpacing.gapW(AppSpacing.sm),
        Flexible(
          child: Text(
            context.l10n.availableLabel,
            style: context.textTheme.labelSmall?.copyWith(
              color: context.custom.success,
            ),
          ),
        ),
      ],
    );

    final nameStyle = context.textTheme.titleMedium;
    final roleStyle = context.textTheme.bodySmall?.copyWith(
      color: cs.onSurfaceVariant,
    );

    if (compact) {
      return Row(
        children: [
          photo,
          AppSpacing.gapW(AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(vm.name, style: nameStyle),
                Text(vm.role, style: roleStyle),
                AppSpacing.gapH(AppSpacing.xs),
                status,
              ],
            ),
          ),
        ],
      );
    }

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHigh.withValues(alpha: .6),
        borderRadius: BorderRadius.circular(AppLayout.radiusLg + 4),
        border: Border.all(color: cs.outlineVariant),
      ),
      child: Column(
        children: [
          photo,
          AppSpacing.gapH(AppSpacing.md),
          Text(vm.name, style: nameStyle, textAlign: TextAlign.center),
          AppSpacing.gapH(2),
          Text(vm.role, style: roleStyle, textAlign: TextAlign.center),
          AppSpacing.gapH(AppSpacing.md - 4),
          status,
        ],
      ),
    );
  }
}
