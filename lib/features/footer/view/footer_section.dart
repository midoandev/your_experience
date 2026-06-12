import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/theme/app_text_styles.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';

class FooterSection extends ConsumerWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Divider(
          color: context.colors.outlineVariant,
          thickness: AppLayout.dividerThick,
        ),
        AppLayout.gapH16,
        Text(context.l10n.copyright, style: AppTextStyles.btnGhost),
        AppLayout.gapH16,
      ],
    );
  }
}
