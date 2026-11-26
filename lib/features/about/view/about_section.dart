import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/widgets/site_kit.dart';
import 'package:your_experience/features/about/view_model/about_vm.dart';

/// "The developer behind the apps": the bio, real tool marks and the seated
/// portrait.
class AboutSection extends ConsumerWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(aboutVmProvider);
    final t = context.textTheme;
    return TextSplit(
      text: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Heading(context.l10n.aboutTitleNew),
          AppSpacing.gapH(AppSpacing.lg),
          Text(context.l10n.aboutLead, style: t.bodyLarge?.copyWith(fontSize: 20)),
          AppSpacing.gapH(AppSpacing.md),
          Text(
            context.l10n.aboutBody,
            style: t.bodyMedium?.copyWith(color: context.custom.textMuted),
          ),
          AppSpacing.gapH(AppSpacing.lg),
          ToolIcons(vm.tools, label: context.l10n.toolsLabel),
        ],
      ),
      visual: WholePicture(
        path: vm.photo,
        aspectRatio: context.screenWidth >= 1024 ? 1 : 4 / 3,
        alt: 'Agus Rakhmadi Mido in a navy jacket, seated, in window light',
        alignment: const Alignment(0, -0.3),
      ),
    );
  }
}
