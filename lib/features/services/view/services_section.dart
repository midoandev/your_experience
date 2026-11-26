import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/widgets/site_kit.dart';
import 'package:your_experience/features/services/view_model/services_vm.dart';

/// "What I build": four kinds of work beside screens from three apps.
class ServicesSection extends ConsumerWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(servicesVmProvider);
    return TextSplit(
      text: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Heading(
            context.l10n.servicesTitleNew,
            subtitle: context.l10n.servicesSubtitle,
          ),
          AppSpacing.gapH(AppSpacing.lg),
          RowList([
            for (final s in vm.items)
              RowEntry(s.title, detail: s.detail, value: s.tools),
          ]),
        ],
      ),
      visual: WholePicture(
        path: vm.picture,
        aspectRatio: vm.pictureRatio,
        alt: 'Screens from Torcons, Badjetin and AI Care side by side',
      ),
    );
  }
}
