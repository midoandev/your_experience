import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_radius.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/widgets/button_inkwell.dart';
import 'package:your_experience/core/ui/widgets/image_default.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/data/icon_mapper.dart';
import 'package:your_experience/features/footer/view/footer_section.dart';
import 'package:your_experience/models/projects_data.dart';

class PortfolioDetailPage extends ConsumerWidget {
  final ProjectsData data;

  const PortfolioDetailPage({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final project = data;
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header with back + icon + title ──
            _Header(project: project, isMobile: isMobile),
            AppSpacing.gapH(AppSpacing.lg),

            // ── Meta info row (framework, platforms, categories) ──
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? AppSpacing.md : AppLayout.pagePadDesktop,
              ),
              child: _MetaRow(project: project, isMobile: isMobile),
            ),
            AppSpacing.gapH(AppSpacing.lg),

            // ── Dashboard image ──
            if (project.imageDashboard.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile
                      ? AppSpacing.md
                      : AppLayout.pagePadDesktop,
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ImageDefault(
                    assetImage: project.imageDashboard,
                    width: double.infinity,
                    borderCircular: AppRadius.lg,
                    boxFit: BoxFit.contain,
                  ),
                ),
              ),
            if (project.imageDashboard.isNotEmpty)
              AppSpacing.gapH(AppSpacing.lg),

            // ── Sections ──
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? AppSpacing.md : AppLayout.pagePadDesktop,
              ),
              child: _listSections(context, project),
            ),
            const FooterSection(),
            AppSpacing.gapH(AppSpacing.xl),
          ],
        ),
      ),
    );
  }

  Widget _listSections(BuildContext context, ProjectsData portfolio) {
    final items = [
      _SectionItem(
        title: context.l10n.projectOverview,
        desc: portfolio.overview,
      ),
      _SectionItem(title: context.l10n.execution, desc: portfolio.execution),
      if (portfolio.images.isNotEmpty) _SectionItem(
        title: context.l10n.results,
        desc: '',
        images: portfolio.images,
      ),
    ];

    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (_, index) {
        final item = items[index];
        return Column(
          children: [
            Divider(height: 1, color: context.colors.outlineVariant),
            AppSpacing.gapH(AppLayout.sectionGap),
            item.images != null && item.images!.isNotEmpty
                ? _ImagesSection(title: item.title, images: item.images!)
                : StickyHeader(
                    overlapHeaders: !isMobile,
                    header: Text(
                      item.title,
                      style: context.textTheme.displayMedium,
                    ),
                    content: Row(
                      children: [
                        if (!isMobile)
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: context.screenWidth * .4,
                            ),
                          ),
                        Expanded(
                          child: Text(
                            item.desc,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
            AppSpacing.gapH(AppSpacing.sm),
          ],
        );
      },
    );
  }
}

// ── Header: back + icon + title + date ──
class _Header extends StatelessWidget {
  final ProjectsData project;
  final bool isMobile;

  const _Header({required this.project, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerLow,
        border: Border(
          bottom: BorderSide(color: context.colors.outlineVariant),
        ),
      ),
      padding: EdgeInsets.only(
        top: MediaQuery.paddingOf(context).top + AppSpacing.md,
        left: isMobile ? AppSpacing.md : AppLayout.pagePadDesktop,
        right: isMobile ? AppSpacing.md : AppLayout.pagePadDesktop,
        bottom: AppSpacing.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back button
          ButtonInkWell(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.chevron_left,
                  size: 24,
                  color: context.custom.textMuted,
                ),
                AppSpacing.gapW(AppSpacing.xs),
                Text(
                  'Back',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.custom.textMuted,
                  ),
                ),
              ],
            ),
            onPress: () => context.goNamed('home'),
          ),
          AppSpacing.gapH(AppSpacing.md),

          // Icon + Title row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (project.imageIcon.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(right: AppSpacing.md),
                  child: ClipRRect(
                    borderRadius: AppRadius.circularMd,
                    child: Image.asset(
                      project.imageIcon,
                      width: isMobile ? 40 : 56,
                      height: isMobile ? 40 : 56,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => Container(
                        width: isMobile ? 40 : 56,
                        height: isMobile ? 40 : 56,
                        decoration: BoxDecoration(
                          color: context.custom.bgTag,
                          borderRadius: AppRadius.circularMd,
                        ),
                        child: Icon(
                          Icons.folder_outlined,
                          color: context.custom.textMuted,
                        ),
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: Text(
                  project.title,
                  style: context.textTheme.displayLarge?.copyWith(
                    letterSpacing: isMobile ? 0 : 3,
                  ),
                ),
              ),
            ],
          ),
          _StoreRow(project: project),
        ],
      ),
    );
  }
}

// ── Meta info row ──
class _MetaRow extends StatelessWidget {
  final ProjectsData project;
  final bool isMobile;

  const _MetaRow({required this.project, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.lg,
      runSpacing: AppSpacing.md,
      children: [
        _MetaChip(label: context.l10n.framework, value: project.framework),
        if (project.platforms.isNotEmpty) _MetaChip(label: context.l10n.platforms, value: project.platformText),
        _MetaChip(label: context.l10n.categories, value: project.category),
      ],
    );
  }
}

class _MetaChip extends StatelessWidget {
  final String label;
  final String value;

  const _MetaChip({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: context.textTheme.labelSmall?.copyWith(
            letterSpacing: 1,
            color: context.custom.textMuted,
          ),
        ),
        AppSpacing.gapH(AppSpacing.xs),
        Text(value, style: context.textTheme.bodyMedium),
      ],
    );
  }
}

// ── Store links ──
class _StoreRow extends StatelessWidget {
  final ProjectsData project;

  const _StoreRow({required this.project});

  @override
  Widget build(BuildContext context) {
    if (project.isAbandoned) return const SizedBox.shrink();
    return Padding(
      padding: EdgeInsets.only(top: AppSpacing.md),
      child: Wrap(
        spacing: AppSpacing.sm,
        children: [
          Text(
            context.l10n.visit.toUpperCase(),
            style: context.textTheme.labelSmall?.copyWith(
              letterSpacing: 1,
              color: context.custom.textMuted,
            ),
          ),
          AppSpacing.gapW(AppSpacing.xs),
          ...project.platforms.map((e) {
            return ButtonInkWell(
              onPress: () => _launchUrl(e.linkUrl, context),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: context.custom.bgTag,
                  borderRadius: AppRadius.circularSm,
                  border: Border.all(
                    color: context.colors.outlineVariant,
                    width: 0.5,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    iconWidget(
                      e.enumPlatform,
                      size: 14,
                      color: context.custom.blue400,
                    ),
                    AppSpacing.gapW(AppSpacing.xs),
                    Text(
                      e.name,
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.custom.blue400,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

Future<void> _launchUrl(String url, BuildContext context) async {
  final uri = Uri.parse(url);
  try {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.l10n.cannotOpenLink)));
    }
  } catch (_) {
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.l10n.errorOccurred)));
    }
  }
}

// ── Images gallery section ──
class _ImagesSection extends StatelessWidget {
  final String title;
  final List<String> images;

  const _ImagesSection({required this.title, required this.images});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: AppSpacing.md),
          child: Text(title, style: context.textTheme.displayMedium),
        ),
        SizedBox(
          height: isMobile ? 280 : 400,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (_, i) => Padding(
              padding: EdgeInsets.only(right: AppSpacing.sm),
              child: SizedBox(
                width: 218,
                child: ClipRRect(
                  borderRadius: AppRadius.circularMd,
                  child: AspectRatio(
                    aspectRatio: 1.3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.colors.surfaceContainerLow,
                        borderRadius: AppRadius.circularMd,
                      ),
                      child: ClipRRect(
                        borderRadius: AppRadius.circularMd,
                        child: Image.asset(
                          images[i],
                          fit: BoxFit.contain,
                          errorBuilder: (_, _, _) => Center(
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
            ),
          ),
        ),
      ],
    );
  }
}

class _SectionItem {
  final String title;
  final String desc;
  final List<String>? images;

  const _SectionItem({required this.title, required this.desc, this.images});
}
