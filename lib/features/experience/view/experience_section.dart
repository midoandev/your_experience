import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/widgets/site_kit.dart';
import 'package:your_experience/features/experience/view_model/experience_vm.dart';

/// "Work history": four jobs with their periods, beside the standing portrait.
class ExperienceSection extends ConsumerWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(experienceVmProvider);
    final wide = context.screenWidth >= 1024;
    return TextSplit(
      text: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Heading(
            context.l10n.historyTitle,
            subtitle: context.l10n.historySubtitle,
          ),
          AppSpacing.gapH(AppSpacing.lg),
          RowList(
            [
              for (final j in vm.jobs)
                RowEntry(j.company, detail: j.detail, value: j.period),
            ],
            showDetail: wide,
          ),
        ],
      ),
      visual: WholePicture(
        path: vm.photo,
        aspectRatio: wide ? 1 : 4 / 3,
        alt: 'Agus Rakhmadi Mido standing with his jacket over his shoulder',
        alignment: const Alignment(0, -0.55),
      ),
    );
  }
}
