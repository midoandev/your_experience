import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../models/projects_data.dart';
import '../../theme/app_layout.dart';
import '../extensions/context_ext.dart';
import 'app_card.dart';
import 'app_chip.dart';

/// Project card — thin wrapper around [AppCard] with project-specific content.
class ProjectCard extends StatelessWidget {
  final ProjectsData project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: () => context.pushNamed('portfolio-detail', extra: project),
      accentHeight: AppLayout.accentLineH,
      child: Padding(
        padding: const EdgeInsets.all(AppLayout.cardPad),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(project.title, style: context.textTheme.titleSmall),
            AppLayout.gapH6,
            Row(
              children: [
                AppChip(label: project.framework),
                AppLayout.gapW6,
                AppChip(label: project.category),
              ],
            ),
            AppLayout.gapH10,
            Text(
              project.overview,
              style: context.textTheme.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
