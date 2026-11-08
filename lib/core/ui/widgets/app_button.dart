import 'package:flutter/material.dart';

import '../../theme/app_layout.dart';
import '../extensions/context_ext.dart';
import '../tokens/app_spacing.dart';

enum AppButtonVariant { primary, secondary, ghost }

/// Pill button with a 48px hit area, optional icon and loading state.
class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool iconAfter;
  final bool loading;
  final AppButtonVariant variant;
  final bool expand;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.iconAfter = false,
    this.loading = false,
    this.variant = AppButtonVariant.primary,
    this.expand = false,
  });

  const AppButton.secondary({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.iconAfter = false,
    this.loading = false,
    this.expand = false,
  }) : variant = AppButtonVariant.secondary;

  const AppButton.ghost({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.iconAfter = false,
    this.loading = false,
    this.expand = false,
  }) : variant = AppButtonVariant.ghost;

  @override
  Widget build(BuildContext context) {
    final cs = context.colors;
    final custom = context.custom;

    final (bg, fg, border, hover) = switch (variant) {
      AppButtonVariant.primary => (
        cs.primary,
        cs.onPrimary,
        Colors.transparent,
        cs.onPrimary.withValues(alpha: .10),
      ),
      AppButtonVariant.secondary => (
        cs.surfaceContainerLow,
        cs.onSurface,
        cs.outline,
        cs.primary.withValues(alpha: .08),
      ),
      AppButtonVariant.ghost => (
        Colors.transparent,
        cs.onSurfaceVariant,
        Colors.transparent,
        custom.accentSoft,
      ),
    };

    final iconColor = variant == AppButtonVariant.secondary ? cs.primary : fg;

    Widget content = loading
        ? SizedBox.square(
            dimension: AppLayout.iconSm,
            child: CircularProgressIndicator(strokeWidth: 2, color: fg),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null && !iconAfter) ...[
                IconTheme.merge(
                  data: IconThemeData(
                    size: AppLayout.iconMd - 2,
                    color: iconColor,
                  ),
                  child: icon!,
                ),
                AppSpacing.gapW(AppSpacing.sm),
              ],
              Flexible(child: Text(label, overflow: TextOverflow.ellipsis)),
              if (icon != null && iconAfter) ...[
                AppSpacing.gapW(AppSpacing.sm),
                IconTheme.merge(
                  data: IconThemeData(
                    size: AppLayout.iconMd - 2,
                    color: iconColor,
                  ),
                  child: icon!,
                ),
              ],
            ],
          );

    final button = TextButton(
      onPressed: loading ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(bg),
        foregroundColor: WidgetStatePropertyAll(fg),
        overlayColor: WidgetStatePropertyAll(hover),
        minimumSize: const WidgetStatePropertyAll(
          Size(AppLayout.buttonHeight, AppLayout.buttonHeight),
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            horizontal: variant == AppButtonVariant.ghost
                ? AppSpacing.md
                : AppLayout.buttonPadH,
          ),
        ),
        textStyle: WidgetStatePropertyAll(context.textTheme.labelLarge),
        // Visible 2px focus ring for keyboard users (WCAG 2.4.7).
        shape: WidgetStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppLayout.radiusFull),
            side: states.contains(WidgetState.focused)
                ? BorderSide(
                    color: variant == AppButtonVariant.primary
                        ? cs.onSurface
                        : cs.primary,
                    width: 2,
                  )
                : BorderSide(color: border, width: AppLayout.hairline),
          ),
        ),
      ),
      child: content,
    );

    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }
}
