import 'package:flutter/material.dart';

import '../../theme/app_layout.dart';
import '../../theme/responsive.dart';
import '../extensions/context_ext.dart';
import '../tokens/app_spacing.dart';

/// Eyebrow (`// 01 · label`) + title + optional subtitle.
class SectionHeader extends StatelessWidget {
  final String index;
  final String eyebrow;
  final String title;
  final String? subtitle;

  const SectionHeader({
    super.key,
    required this.index,
    required this.eyebrow,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Responsive.isMobile(context)
        ? context.textTheme.headlineMedium
        : context.textTheme.headlineLarge;

    return Semantics(
      header: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Eyebrow('$index · $eyebrow'),
          AppSpacing.gapH(AppSpacing.md - 4),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Text(title, style: titleStyle),
          ),
          if (subtitle != null) ...[
            AppSpacing.gapH(AppSpacing.md - 4),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppLayout.maxReadingWidth,
              ),
              child: Text(
                subtitle!,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Mono "// label" line in accent color.
class Eyebrow extends StatelessWidget {
  final String text;
  final Color? color;
  const Eyebrow(this.text, {super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      '// ${text.toLowerCase()}',
      style: context.textTheme.labelMedium?.copyWith(
        color: color ?? context.colors.primary,
        letterSpacing: 0.6,
      ),
    );
  }
}
