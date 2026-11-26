import 'package:flutter/material.dart';

import '../../theme/app_layout.dart';
import '../extensions/context_ext.dart';
import '../tokens/app_duration.dart';
import '../tokens/app_spacing.dart';
import 'site_kit.dart';

/// A linked card: "Name, category", one line, then the cover shown whole.
/// Lifts 2px on hover; the cover zooms inside its frame.
class ProjectCard extends StatefulWidget {
  final String name;
  final String category;
  final String summary;
  final String picture;
  final double pictureRatio;
  final String pictureAlt;
  final String semanticLabel;
  final bool showSummary;
  final VoidCallback onTap;

  const ProjectCard({
    super.key,
    required this.name,
    required this.category,
    required this.summary,
    required this.picture,
    required this.pictureRatio,
    required this.pictureAlt,
    required this.semanticLabel,
    required this.onTap,
    this.showSummary = true,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final still = MediaQuery.disableAnimationsOf(context);
    final t = context.textTheme;
    return Semantics(
      button: true,
      label: widget.semanticLabel,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedSlide(
            offset: _hover && !still ? const Offset(0, -0.006) : Offset.zero,
            duration: AppDuration.fastest,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: widget.name),
                      if (widget.showSummary)
                        TextSpan(
                          text: ', ${widget.category}',
                          style: TextStyle(color: context.colors.onSurface),
                        ),
                    ],
                  ),
                  style: t.titleMedium?.copyWith(
                    decoration: _hover ? TextDecoration.underline : null,
                    decorationColor: context.colors.primary,
                  ),
                ),
                if (widget.showSummary) ...[
                  AppSpacing.gapH(AppSpacing.sm),
                  Text(
                    widget.summary,
                    style: t.bodyMedium?.copyWith(color: context.custom.textMuted),
                  ),
                ],
                AppSpacing.gapH(AppSpacing.md),
                ExcludeSemantics(
                  child: WholePicture(
                    path: widget.picture,
                    aspectRatio: widget.pictureRatio,
                    alt: widget.pictureAlt,
                    radius: AppLayout.radiusLg,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
