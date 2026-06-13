
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../models/projects_data.dart';
import '../../theme/app_layout.dart';
import '../extensions/context_ext.dart';
import '../tokens/app_radius.dart';
import '../tokens/app_spacing.dart';

class ProjectCard extends StatefulWidget {
  final ProjectsData project;
  const ProjectCard({required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () =>
            context.pushNamed('portfolio-detail', extra: widget.project),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: _hovered
                ? context.colors.surfaceContainerHigh
                : context.colors.surfaceContainerLow,
            border: Border.all(
              color: _hovered
                  ? context.custom.borderAccent
                  : context.colors.outlineVariant,
              width: AppLayout.cardBorder,
            ),
            borderRadius: BorderRadius.circular(AppLayout.cardRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: AppLayout.accentLineH + 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: _hovered
                        ? [context.colors.primary, context.custom.teal400]
                        : [context.custom.blue800, context.custom.blue800],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppLayout.cardPad),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.project.title,
                            style: context.textTheme.titleSmall,
                          ),
                        ),
                      ],
                    ),
                    AppLayout.gapH6,
                    Row(
                      children: [
                        _MiniPill(text: widget.project.framework),
                        AppLayout.gapW6,
                        _MiniPill(text: widget.project.category),
                      ],
                    ),
                    AppLayout.gapH10,
                    Text(
                      _stripHtml(widget.project.overview),
                      style: context.textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _stripHtml(String html) {
    return html.replaceAll(RegExp(r'<[^>]*>'), '');
  }
}

class _MiniPill extends StatelessWidget {
  final String text;
  const _MiniPill({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: context.custom.bgTag,
        border: Border.all(
          color: context.custom.blue800,
          width: AppLayout.cardBorder,
        ),
        borderRadius: AppRadius.circularSm,
      ),
      child: Text(
        text,
        style: context.textTheme.labelSmall!.copyWith(letterSpacing: 0.5),
      ),
    );
  }
}
