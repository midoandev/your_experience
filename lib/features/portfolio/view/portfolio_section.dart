import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/ui/tokens/app_duration.dart';
import 'package:your_experience/core/theme/app_theme.dart';
import 'package:your_experience/core/theme/responsive.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/widgets/app_card.dart';
import 'package:your_experience/core/ui/widgets/app_chip.dart';
import 'package:your_experience/core/ui/widgets/responsive_grid.dart';
import 'package:your_experience/core/ui/widgets/reveal.dart';
import 'package:your_experience/core/ui/widgets/section_header.dart';
import 'package:your_experience/data/icon_mapper.dart';
import 'package:your_experience/data/portfolio_data.dart';
import 'package:your_experience/features/portfolio/view_model/portfolio_vm.dart';
import 'package:your_experience/models/projects_data.dart';

class PortfolioSection extends ConsumerWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(portfolioVmProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          index: '01',
          eyebrow: context.l10n.workEyebrow,
          title: context.l10n.workTitle,
          subtitle: context.l10n.workSubtitle(vm.projects.length),
        ),
        AppSpacing.gapH(AppSpacing.lg),
        _DomainStrip(domains: vm.domains),
        AppSpacing.gapH(AppSpacing.xl + AppSpacing.sm),
        if (vm.projects.isEmpty)
          Padding(
            padding: AppSpacing.vXl,
            child: Text(
              context.l10n.noProjects,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.custom.textMuted,
              ),
            ),
          )
        else
          ResponsiveGrid(
            minItemWidth: 320,
            itemCount: vm.projects.length,
            itemBuilder: (_, i) => Reveal(
              delay: Duration(milliseconds: 40 * (i % 2)),
              child: ProjectCard(project: vm.projects[i]),
            ),
          ),
      ],
    );
  }
}

class _DomainStrip extends StatelessWidget {
  final List<String> domains;
  const _DomainStrip({required this.domains});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: AppSpacing.xs),
          child: Text(
            context.l10n.domainsLabel,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.custom.textMuted,
            ),
          ),
        ),
        for (final d in domains) AppChip(label: d),
      ],
    );
  }
}

class ProjectCard extends StatelessWidget {
  final ProjectsData project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final intro = RichDescription.parse(project.overview).intro;
    final meta = [
      project.category,
      project.framework,
      if (project.year.isNotEmpty) project.year,
    ].join('  ·  ');
    final pad = Responsive.isMobile(context)
        ? AppLayout.cardPadMobile
        : AppLayout.cardPad;

    return AppCard(
      semanticLabel: '${project.title}. ${context.l10n.viewCaseStudy}',
      padding: EdgeInsets.zero,
      onTap: () => context.pushNamed(
        'portfolio-detail',
        pathParameters: {'id': project.id},
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Lead with visuals (ui-ux-pro-max: Portfolio Grid pattern).
          _ProjectThumb(project: project),
          _body(context, intro, meta, pad),
        ],
      ),
    );
  }

  Widget _body(BuildContext context, String intro, String meta, double pad) {
    return Padding(
      padding: EdgeInsets.all(pad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppIcon(asset: project.imageIcon, size: 40),
              AppSpacing.gapW(AppSpacing.md - 4),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Single lines keep every card in a row the same
                    // shape (wrapped meta made row heights drift).
                    Text(
                      project.title,
                      style: context.textTheme.titleLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AppSpacing.gapH(2),
                    Text(
                      meta,
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.custom.textMuted,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          AppSpacing.gapH(AppSpacing.md),
          Text(
            intro,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          AppSpacing.gapH(AppSpacing.lg - 4),
          Row(
            children: [
              for (final p in project.platforms) ...[
                Tooltip(
                  message: p.name,
                  child: iconWidget(
                    p.enumPlatform,
                    size: AppLayout.iconSm,
                    color: context.custom.textMuted,
                  ),
                ),
                AppSpacing.gapW(AppSpacing.md - 4),
              ],
              Expanded(
                child: project.hasStoreStats
                    ? StoreStatsLine(project: project)
                    : const SizedBox.shrink(),
              ),
              AppSpacing.gapW(AppSpacing.sm),
              Text(
                context.l10n.viewCaseStudy,
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colors.primary,
                  fontSize: 14,
                ),
              ),
              AppSpacing.gapW(AppSpacing.xs + 2),
              Icon(
                Icons.arrow_forward_rounded,
                size: AppLayout.iconSm,
                color: context.colors.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 16:10 visual at the top of a project card:
/// cover image → phone-screenshot strip → large icon, whichever exists.
/// Zooms 4% while the card is hovered/focused (off for reduced motion).
class _ProjectThumb extends StatelessWidget {
  final ProjectsData project;
  const _ProjectThumb({required this.project});

  @override
  Widget build(BuildContext context) {
    final cs = context.colors;
    final zoom =
        AppCardState.isActive(context) &&
        !MediaQuery.disableAnimationsOf(context);
    final dpr = MediaQuery.devicePixelRatioOf(context);

    final Widget visual;
    final useScreens =
        project.images.isNotEmpty &&
        (project.preferScreensThumb || project.imageDashboard.isEmpty);
    if (useScreens) {
      visual = _ScreensStrip(images: project.images.take(3).toList());
    } else if (project.imageDashboard.isNotEmpty) {
      visual = Image.asset(
        project.imageDashboard,
        fit: BoxFit.cover,
        cacheWidth: (560 * dpr).round(),
        excludeFromSemantics: true,
        errorBuilder: (_, _, _) => _iconPanel(context),
      );
    } else {
      visual = _iconPanel(context);
    }

    return AspectRatio(
      aspectRatio: 16 / 10,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: cs.surfaceContainerHigh,
          border: Border(bottom: BorderSide(color: cs.outlineVariant)),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedScale(
              scale: zoom ? 1.04 : 1,
              duration: AppDuration.normal,
              curve: Curves.easeOutCubic,
              child: visual,
            ),
            Positioned(
              top: AppSpacing.md - 4,
              right: AppSpacing.md - 4,
              child: ProjectStatusChip(project: project, onImage: true),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconPanel(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            context.custom.accentSoft,
            context.colors.surfaceContainerHigh,
          ],
        ),
      ),
      child: Center(
        child: AppIcon(asset: project.imageIcon, size: AppLayout.appIconLg),
      ),
    );
  }
}

/// Three phone screenshots side by side on a soft tinted backdrop.
class _ScreensStrip extends StatelessWidget {
  final List<String> images;
  const _ScreensStrip({required this.images});

  @override
  Widget build(BuildContext context) {
    final dpr = MediaQuery.devicePixelRatioOf(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            context.custom.accentSoft,
            context.colors.surfaceContainerHigh,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg,
          AppSpacing.lg,
          AppSpacing.lg,
          0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (final (i, src) in images.indexed) ...[
              if (i > 0) AppSpacing.gapW(AppSpacing.sm + 2),
              Expanded(
                child: Padding(
                  // Middle screen sits higher for a little depth.
                  padding: EdgeInsets.only(top: i == 1 ? 0 : AppSpacing.lg),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(AppLayout.radiusMd),
                    ),
                    child: Image.asset(
                      src,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      cacheWidth: (200 * dpr).round(),
                      excludeFromSemantics: true,
                      errorBuilder: (_, _, _) => const SizedBox.shrink(),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Rounded app icon with a hairline border and a graceful fallback.
class AppIcon extends StatelessWidget {
  final String asset;
  final double size;
  const AppIcon({super.key, required this.asset, required this.size});

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(size * 0.26);
    final fallback = Icon(
      Icons.apps_rounded,
      size: size * .45,
      color: context.custom.textMuted,
    );
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHigh,
        borderRadius: radius,
        border: Border.all(color: context.colors.outlineVariant),
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: asset.isEmpty
            ? fallback
            : Image.asset(
                asset,
                fit: BoxFit.cover,
                cacheWidth: (size * 3).round(),
                excludeFromSemantics: true,
                errorBuilder: (_, _, _) => fallback,
              ),
      ),
    );
  }
}

class ProjectStatusChip extends StatelessWidget {
  final ProjectsData project;

  /// On top of an image: dark translucent pill so it reads on any photo.
  final bool onImage;

  const ProjectStatusChip({
    super.key,
    required this.project,
    this.onImage = false,
  });

  @override
  Widget build(BuildContext context) {
    final archived = project.isAbandoned;
    final label = archived
        ? context.l10n.statusArchived
        : context.l10n.statusLive;
    final tone = archived ? context.custom.warning : context.custom.success;
    final leading = archived
        ? Icon(Icons.inventory_2_outlined, size: 12, color: tone)
        : StatusDot(color: tone);

    if (onImage) {
      final dark = AppTheme.dark.colorScheme;
      final accent = archived
          ? CustomColors.dark.warning
          : CustomColors.dark.success;
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm + 2,
          vertical: AppSpacing.xs + 1,
        ),
        decoration: BoxDecoration(
          color: dark.surface.withValues(alpha: .78),
          borderRadius: BorderRadius.circular(AppLayout.radiusFull),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            archived
                ? Icon(Icons.inventory_2_outlined, size: 12, color: accent)
                : StatusDot(color: accent),
            AppSpacing.gapW(AppSpacing.xs + 2),
            Text(
              label,
              style: context.textTheme.labelSmall?.copyWith(
                color: dark.onSurface,
              ),
            ),
          ],
        ),
      );
    }

    return AppChip(
      label: label,
      tone: archived ? AppChipTone.warning : AppChipTone.success,
      leading: leading,
    );
  }
}

/// "★ 4.6 · 5K+ installs" from the public Google Play listing.
class StoreStatsLine extends StatelessWidget {
  final ProjectsData project;
  final bool large;

  const StoreStatsLine({super.key, required this.project, this.large = false});

  @override
  Widget build(BuildContext context) {
    final parts = [
      if (project.rating.isNotEmpty) context.l10n.storeRating(project.rating),
      if (project.installs.isNotEmpty)
        context.l10n.storeInstalls(project.installs),
    ];
    final style =
        (large ? context.textTheme.labelMedium : context.textTheme.labelSmall)
            ?.copyWith(color: context.colors.onSurfaceVariant);
    return Tooltip(
      message: context.l10n.storeSource(PortfolioData.storeStatsAsOf),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (project.rating.isNotEmpty) ...[
            Icon(
              Icons.star_rounded,
              size: large ? 16 : 14,
              color: context.custom.warning,
            ),
            AppSpacing.gapW(AppSpacing.xs),
          ],
          Flexible(
            child: Text(
              parts.join('  ·  '),
              style: style,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
