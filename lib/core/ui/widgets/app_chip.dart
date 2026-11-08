import 'package:flutter/material.dart';

import '../../theme/app_layout.dart';
import '../extensions/context_ext.dart';
import '../tokens/app_spacing.dart';

enum AppChipTone { neutral, accent, success, warning }

/// Small mono pill used for tags, tech and status.
class AppChip extends StatelessWidget {
  final String label;
  final AppChipTone tone;
  final Widget? leading;

  const AppChip({
    super.key,
    required this.label,
    this.tone = AppChipTone.neutral,
    this.leading,
  });

  const AppChip.accent({super.key, required this.label, this.leading})
    : tone = AppChipTone.accent;

  @override
  Widget build(BuildContext context) {
    final cs = context.colors;
    final custom = context.custom;

    final (bg, border, fg) = switch (tone) {
      AppChipTone.neutral => (
        cs.surfaceContainer,
        cs.outlineVariant,
        cs.onSurfaceVariant,
      ),
      AppChipTone.accent => (custom.accentSoft, Colors.transparent, cs.primary),
      AppChipTone.success => (
        custom.successSoft,
        Colors.transparent,
        custom.success,
      ),
      AppChipTone.warning => (
        custom.warningSoft,
        Colors.transparent,
        custom.warning,
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm + 2,
        vertical: AppSpacing.xs + 1,
      ),
      decoration: BoxDecoration(
        color: bg,
        border: Border.all(color: border, width: AppLayout.hairline),
        borderRadius: BorderRadius.circular(AppLayout.radiusFull),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) ...[
            leading!,
            AppSpacing.gapW(AppSpacing.xs + 2),
          ],
          // Flexible: a long label wraps instead of overflowing narrow screens.
          Flexible(
            child: Text(
              label,
              style: context.textTheme.labelSmall?.copyWith(color: fg),
            ),
          ),
        ],
      ),
    );
  }
}

/// Pulsing-free status dot (static to respect reduced-motion users).
class StatusDot extends StatelessWidget {
  final Color color;
  const StatusDot({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpacing.sm,
      height: AppSpacing.sm,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: .5), blurRadius: 6),
        ],
      ),
    );
  }
}
