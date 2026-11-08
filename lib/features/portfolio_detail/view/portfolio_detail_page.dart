import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:your_experience/core/services/link_service.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/theme/app_theme.dart';
import 'package:your_experience/core/theme/responsive.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_duration.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/widgets/app_button.dart';
import 'package:your_experience/core/ui/widgets/app_card.dart';
import 'package:your_experience/core/ui/widgets/app_chip.dart';
import 'package:your_experience/core/ui/widgets/content_width.dart';
import 'package:your_experience/core/ui/widgets/reveal.dart';
import 'package:your_experience/core/ui/widgets/section_header.dart';
import 'package:your_experience/core/ui/widgets/top_bar.dart';
import 'package:your_experience/data/icon_mapper.dart';
import 'package:your_experience/features/footer/view/footer_section.dart';
import 'package:your_experience/features/not_found/view/not_found_page.dart';
import 'package:your_experience/features/portfolio/view/portfolio_section.dart';
import 'package:your_experience/features/portfolio_detail/view_model/portfolio_detail_vm.dart';
import 'package:your_experience/models/projects_data.dart';

class PortfolioDetailPage extends ConsumerWidget {
  final String id;

  const PortfolioDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(portfolioDetailVmProvider(id));
    final project = vm.project;
    if (project == null) return const NotFoundPage();

    final navHeight = Responsive.navHeight(context);
    final topInset = MediaQuery.paddingOf(context).top + navHeight;
    final gap = Responsive.value(
      context,
      mobile: AppSpacing.xxl,
      tablet: AppSpacing.xxl + AppSpacing.sm,
      desktop: AppSpacing.xxl + AppSpacing.lg,
    );

    return Title(
      title: '${project.title} — ${context.l10n.navLogo}',
      color: context.colors.primary,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: TopBar(
          height: navHeight,
          child: Row(
            children: [
              AppButton.ghost(
                label: context.l10n.back,
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () => _back(context),
              ),
              const Spacer(),
              const ThemeToggleButton(),
            ],
          ),
        ),
        body: CallbackShortcuts(
          bindings: {
            const SingleActivator(LogicalKeyboardKey.escape): () =>
                _back(context),
          },
          child: Focus(
            autofocus: true,
            child: Scrollbar(
              child: SingleChildScrollView(
                child: ContentWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: topInset + AppSpacing.xl),
                      Reveal(
                        child: _Header(
                          project: project,
                          intro: vm.overview.intro,
                        ),
                      ),
                      AppSpacing.gapH(AppSpacing.xl),
                      Reveal(child: _MetaGrid(project: project)),
                      if (project.imageDashboard.isNotEmpty) ...[
                        AppSpacing.gapH(gap),
                        Reveal(child: _Cover(asset: project.imageDashboard)),
                      ],
                      if (vm.overview.bullets.isNotEmpty) ...[
                        AppSpacing.gapH(gap),
                        Reveal(
                          child: _TwoColumn(
                            title: context.l10n.highlights,
                            child: _BulletList(items: vm.overview.bullets),
                          ),
                        ),
                      ],
                      AppSpacing.gapH(gap),
                      Reveal(
                        child: _TwoColumn(
                          title: context.l10n.myRole,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (vm.execution.intro.isNotEmpty)
                                Text(
                                  vm.execution.intro,
                                  style: context.textTheme.bodyLarge?.copyWith(
                                    color: context.colors.onSurfaceVariant,
                                  ),
                                ),
                              if (vm.execution.bullets.isNotEmpty) ...[
                                AppSpacing.gapH(AppSpacing.lg),
                                _BulletList(items: vm.execution.bullets),
                              ],
                            ],
                          ),
                        ),
                      ),
                      if (project.images.isNotEmpty) ...[
                        AppSpacing.gapH(gap),
                        Reveal(child: _Gallery(images: project.images)),
                      ],
                      if (vm.next != null && vm.next!.id != project.id) ...[
                        AppSpacing.gapH(gap),
                        Reveal(child: _NextProject(project: vm.next!)),
                      ],
                      AppSpacing.gapH(gap),
                      const FooterSection(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _back(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      context.goNamed('home');
    }
  }
}

class _Header extends StatelessWidget {
  final ProjectsData project;
  final String intro;

  const _Header({required this.project, required this.intro});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AppIcon(
              asset: project.imageIcon,
              size: isMobile ? 64 : AppLayout.appIconLg,
            ),
            AppSpacing.gapW(AppSpacing.md + 4),
            Expanded(
              child: Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: [
                  ProjectStatusChip(project: project),
                  AppChip.accent(label: project.category),
                  if (project.hasStoreStats)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: StoreStatsLine(project: project, large: true),
                    ),
                ],
              ),
            ),
          ],
        ),
        AppSpacing.gapH(AppSpacing.lg),
        Semantics(
          header: true,
          child: Text(project.title, style: Responsive.displayStyle(context)),
        ),
        AppSpacing.gapH(AppSpacing.md + 4),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppLayout.maxReadingWidth,
          ),
          child: Text(
            intro,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
        ),
        AppSpacing.gapH(AppSpacing.xl),
        _StoreLinks(project: project),
      ],
    );
  }
}

class _StoreLinks extends StatelessWidget {
  final ProjectsData project;
  const _StoreLinks({required this.project});

  @override
  Widget build(BuildContext context) {
    if (project.isAbandoned || project.platforms.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        constraints: const BoxConstraints(maxWidth: 560),
        decoration: BoxDecoration(
          color: context.custom.warningSoft,
          borderRadius: BorderRadius.circular(AppLayout.radiusMd),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.info_outline_rounded,
              size: AppLayout.iconMd,
              color: context.custom.warning,
            ),
            AppSpacing.gapW(AppSpacing.md - 4),
            Expanded(
              child: Text(
                context.l10n.archivedNotice,
                style: context.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      );
    }

    return Wrap(
      spacing: AppSpacing.md - 4,
      runSpacing: AppSpacing.md - 4,
      children: [
        for (final (i, p) in project.platforms.indexed)
          AppButton(
            variant: i == 0
                ? AppButtonVariant.primary
                : AppButtonVariant.secondary,
            label: p.storeName == null
                ? context.l10n.openWebsite
                : context.l10n.getItOn(p.storeName!),
            icon: iconWidget(
              p.enumPlatform,
              size: AppLayout.iconSm,
              color: i == 0 ? context.colors.onPrimary : context.colors.primary,
            ),
            onPressed: () async {
              final ok = await LinkService.open(p.linkUrl);
              if (!ok && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(context.l10n.cannotOpenLink)),
                );
              }
            },
          ),
      ],
    );
  }
}

class _MetaGrid extends StatelessWidget {
  final ProjectsData project;
  const _MetaGrid({required this.project});

  @override
  Widget build(BuildContext context) {
    final items = [
      (context.l10n.framework, project.framework),
      (
        context.l10n.platforms,
        project.platforms.isEmpty ? '—' : project.platformText,
      ),
      (context.l10n.categories, project.category),
      (context.l10n.year, project.year.isEmpty ? '—' : project.year),
    ];
    final border = BorderSide(color: context.colors.outlineVariant);

    return Container(
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppLayout.radiusLg),
        border: Border.fromBorderSide(border),
      ),
      child: LayoutBuilder(
        builder: (context, c) {
          final columns = c.maxWidth >= 560 ? 4 : 2;
          final cellWidth = c.maxWidth / columns;
          return Wrap(
            children: [
              for (final (i, (label, value)) in items.indexed)
                Container(
                  width: cellWidth,
                  padding: const EdgeInsets.all(AppSpacing.lg - 4),
                  decoration: BoxDecoration(
                    border: Border(
                      left: i % columns == 0 ? BorderSide.none : border,
                      top: i < columns ? BorderSide.none : border,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label.toUpperCase(),
                        style: context.textTheme.labelSmall?.copyWith(
                          color: context.custom.textMuted,
                          letterSpacing: 1,
                        ),
                      ),
                      AppSpacing.gapH(AppSpacing.sm),
                      Text(value, style: context.textTheme.titleSmall),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _Cover extends StatelessWidget {
  final String asset;
  const _Cover({required this.asset});

  @override
  Widget build(BuildContext context) {
    final dpr = MediaQuery.devicePixelRatioOf(context);
    return Container(
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppLayout.radiusXl),
        border: Border.all(color: context.colors.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      // Fixed ratio reserves the space before the image decodes, so the
      // page doesn't jump (no layout shift).
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: LayoutBuilder(
          builder: (context, c) => Image.asset(
            asset,
            fit: BoxFit.cover,
            cacheWidth: (c.maxWidth * dpr).round(),
            excludeFromSemantics: true,
            frameBuilder: (_, child, frame, sync) => AnimatedOpacity(
              opacity: sync || frame != null ? 1 : 0,
              duration: AppDuration.normal,
              child: child,
            ),
            errorBuilder: (_, _, _) => const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}

/// Section title on the left (desktop) or on top (mobile/tablet).
class _TwoColumn extends StatelessWidget {
  final String title;
  final Widget child;

  const _TwoColumn({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final heading = Semantics(
      header: true,
      child: Text(title, style: context.textTheme.headlineSmall),
    );
    return LayoutBuilder(
      builder: (context, c) {
        if (c.maxWidth < AppLayout.detailSplitWidth) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [heading, AppSpacing.gapH(AppSpacing.lg), child],
          );
        }
        return _split(heading, c.maxWidth);
      },
    );
  }

  Widget _split(Widget heading, double width) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: width * .28, child: heading),
        AppSpacing.gapW(AppSpacing.xl),
        Expanded(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppLayout.maxReadingWidth,
            ),
            child: child,
          ),
        ),
      ],
    );
  }
}

class _BulletList extends StatelessWidget {
  final List<String> items;
  const _BulletList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final (i, item) in items.indexed) ...[
          if (i > 0) AppSpacing.gapH(AppSpacing.md - 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 2),
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: context.custom.accentSoft,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_rounded,
                  size: 14,
                  color: context.colors.primary,
                ),
              ),
              AppSpacing.gapW(AppSpacing.md - 2),
              Expanded(child: Text(item, style: context.textTheme.bodyMedium)),
            ],
          ),
        ],
      ],
    );
  }
}

class _Gallery extends StatefulWidget {
  final List<String> images;
  const _Gallery({required this.images});

  @override
  State<_Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<_Gallery> {
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _page(int dir) {
    final viewport = _controller.position.viewportDimension;
    _controller.animateTo(
      (_controller.offset + dir * viewport * .8).clamp(
        0,
        _controller.position.maxScrollExtent,
      ),
      duration: AppDuration.normal,
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = Responsive.value<double>(
      context,
      mobile: 420,
      tablet: 460,
      desktop: 520,
    ).clamp(260.0, context.screenHeight * .7);
    final dpr = MediaQuery.devicePixelRatioOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Semantics(
                header: true,
                child: Text(
                  context.l10n.screenshots,
                  style: context.textTheme.headlineSmall,
                ),
              ),
            ),
            if (!Responsive.isMobile(context)) ...[
              IconButton.outlined(
                tooltip: context.l10n.previous,
                onPressed: () => _page(-1),
                icon: const Icon(Icons.chevron_left_rounded),
              ),
              AppSpacing.gapW(AppSpacing.sm),
              IconButton.outlined(
                tooltip: context.l10n.next,
                onPressed: () => _page(1),
                icon: const Icon(Icons.chevron_right_rounded),
              ),
            ],
          ],
        ),
        AppSpacing.gapH(AppSpacing.lg),
        SizedBox(
          height: height,
          child: ListView.separated(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: widget.images.length,
            separatorBuilder: (_, _) => AppSpacing.gapW(AppSpacing.md),
            itemBuilder: (context, i) => Semantics(
              button: true,
              label: context.l10n.openScreenshot(i + 1),
              child: AppCard(
                padding: EdgeInsets.zero,
                onTap: () => _openLightbox(context, widget.images, i),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppLayout.radiusLg - 1),
                  child: Image.asset(
                    widget.images[i],
                    height: height - 2,
                    fit: BoxFit.contain,
                    cacheHeight: (height * dpr).round(),
                    excludeFromSemantics: true,
                    errorBuilder: (_, _, _) => SizedBox(
                      width: height * .5,
                      child: Icon(
                        Icons.broken_image_outlined,
                        color: context.custom.textMuted,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Future<void> _openLightbox(
  BuildContext context,
  List<String> images,
  int initial,
) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: context.l10n.close,
    barrierColor: AppTheme.dark.colorScheme.surface.withValues(alpha: .94),
    transitionDuration: AppDuration.fast,
    pageBuilder: (_, _, _) => _Lightbox(images: images, initial: initial),
    transitionBuilder: (_, anim, _, child) =>
        FadeTransition(opacity: anim, child: child),
  );
}

class _Lightbox extends StatefulWidget {
  final List<String> images;
  final int initial;

  const _Lightbox({required this.images, required this.initial});

  @override
  State<_Lightbox> createState() => _LightboxState();
}

class _LightboxState extends State<_Lightbox> {
  late final PageController _pc = PageController(initialPage: widget.initial);
  late int _index = widget.initial;

  @override
  void dispose() {
    _pc.dispose();
    super.dispose();
  }

  void _go(int dir) {
    final target = (_index + dir).clamp(0, widget.images.length - 1);
    _pc.animateToPage(
      target,
      duration: AppDuration.fast,
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Lightbox is always dark regardless of theme, for photo contrast.
    final fg = AppTheme.dark.colorScheme.onSurface;
    final dpr = MediaQuery.devicePixelRatioOf(context);
    final h = MediaQuery.sizeOf(context).height;

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () => _go(-1),
        const SingleActivator(LogicalKeyboardKey.arrowRight): () => _go(1),
      },
      child: Focus(
        autofocus: true,
        child: SafeArea(
          child: Stack(
            children: [
              PageView.builder(
                controller: _pc,
                itemCount: widget.images.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (_, i) => Padding(
                  // Room for the arrows/close button, smaller on phones.
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth < 600
                        ? AppSpacing.md
                        : AppSpacing.xxl + AppSpacing.lg,
                    vertical: context.screenHeight < 600
                        ? AppSpacing.xxl
                        : AppSpacing.xxl + AppSpacing.md,
                  ),
                  child: InteractiveViewer(
                    child: Image.asset(
                      widget.images[i],
                      fit: BoxFit.contain,
                      cacheHeight: (h * dpr).round(),
                      frameBuilder: (_, child, frame, sync) =>
                          sync || frame != null
                          ? child
                          : Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: fg,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: AppSpacing.md,
                left: AppSpacing.lg,
                child: Text(
                  context.l10n.imageCounter(_index + 1, widget.images.length),
                  style: context.textTheme.labelMedium?.copyWith(color: fg),
                ),
              ),
              Positioned(
                top: AppSpacing.xs,
                right: AppSpacing.sm,
                child: IconButton(
                  tooltip: context.l10n.close,
                  color: fg,
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close_rounded),
                ),
              ),
              if (_index > 0)
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    tooltip: context.l10n.previous,
                    color: fg,
                    iconSize: 32,
                    onPressed: () => _go(-1),
                    icon: const Icon(Icons.chevron_left_rounded),
                  ),
                ),
              if (_index < widget.images.length - 1)
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    tooltip: context.l10n.next,
                    color: fg,
                    iconSize: 32,
                    onPressed: () => _go(1),
                    icon: const Icon(Icons.chevron_right_rounded),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NextProject extends StatelessWidget {
  final ProjectsData project;
  const _NextProject({required this.project});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      semanticLabel: '${context.l10n.nextProject}: ${project.title}',
      onTap: () => context.pushReplacementNamed(
        'portfolio-detail',
        pathParameters: {'id': project.id},
      ),
      padding: EdgeInsets.all(
        Responsive.isMobile(context) ? AppLayout.cardPadMobile : AppSpacing.xl,
      ),
      child: Row(
        children: [
          AppIcon(asset: project.imageIcon, size: AppLayout.appIconSm),
          AppSpacing.gapW(AppSpacing.md + 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Eyebrow(context.l10n.nextProject),
                AppSpacing.gapH(AppSpacing.xs + 2),
                Text(project.title, style: context.textTheme.headlineSmall),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_rounded,
            color: context.colors.primary,
            size: AppLayout.iconLg,
          ),
        ],
      ),
    );
  }
}
