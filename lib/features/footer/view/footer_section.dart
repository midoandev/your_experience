import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_experience/core/theme/app_colors.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/theme/app_text_styles.dart';

class FooterSection extends ConsumerWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Divider(
          color: AppColors.border,
          thickness: AppLayout.dividerThick,
        ),
        AppLayout.gapH16,
        Text(
          '© 2024 Mido. All rights reserved.',
          style: AppTextStyles.btnGhost,
        ),
        AppLayout.gapH16,
      ],
    );
  }
}
