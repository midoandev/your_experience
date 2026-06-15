import 'package:flutter/material.dart';

import '../extensions/context_ext.dart';
import '../tokens/app_radius.dart';
import '../tokens/app_spacing.dart';

/// Reusable pill/chip widget.
/// Default: bgTag background + borderAccent border.
class AppChip extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final VoidCallback? onTap;

  const AppChip({
    super.key,
    required this.label,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.textStyle,
    this.onTap,
  });

  factory AppChip.accent({Key? key, required String label}) => AppChip(
    key: key,
    label: label,
    borderColor: null, // will be blue800 from custom
  );

  @override
  Widget build(BuildContext context) {
    final custom = context.custom;
    final bg = backgroundColor ?? custom.bgTag;
    final border = borderColor ?? custom.borderAccent;
    final color = textColor ?? context.colors.onSurfaceVariant;

    final chip = Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: bg,
        border: Border.all(color: border, width: 0.5),
        borderRadius: AppRadius.circularSm,
      ),
      child: Text(
        label,
        style: (textStyle ?? context.textTheme.labelSmall)?.copyWith(
          fontSize: 11,
          color: color,
        ),
      ),
    );

    if (onTap != null) {
      return GestureDetector(onTap: onTap, child: chip);
    }
    return chip;
  }
}
