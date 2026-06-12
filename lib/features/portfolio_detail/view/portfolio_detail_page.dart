import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
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
    final isSmallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);

    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        physics: const NeverScrollableScrollPhysics(),
        body: SingleChildScrollView(
          child: ResponsiveRowColumn(
            columnPadding: EdgeInsets.symmetric(
              horizontal: isSmallerThanDesktop
                  ? AppSpacing.md
                  : AppLayout.pagePadDesktop,
              vertical: AppLayout.sectionGap,
            ),
            columnSpacing: isSmallerThanDesktop ? AppSpacing.lg : AppSpacing.xl,
            columnCrossAxisAlignment: CrossAxisAlignment.start,
            columnMainAxisAlignment: MainAxisAlignment.start,
            layout: ResponsiveRowColumnType.COLUMN,
            children: [
              ResponsiveRowColumnItem(
                columnFlex: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ButtonInkWell(
                          child: const Padding(
                            padding: AppSpacing.insetMd,
                            child: Icon(Icons.chevron_left, size: 24),
                          ),
                          onPress: () => context.goNamed('home'),
                        ),
                        AppSpacing.gapW(AppSpacing.xl),
                        Text(
                          project.timeCreated,
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w300,
                            color: context.textTheme.bodyMedium?.color
                                ?.withValues(alpha: .5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ResponsiveRowColumnItem(
                child: Text(
                  project.title,
                  style: context.textTheme.displayLarge?.copyWith(
                    letterSpacing: 3,
                  ),
                ),
              ),
              ResponsiveRowColumnItem(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _titleDesc(
                      context: context,
                      title: context.l10n.framework,
                      desc: project.framework,
                    ),
                    _titleDesc(
                      context: context,
                      title: context.l10n.platforms,
                      desc: project.platformText,
                    ),
                    _titleDesc(
                      context: context,
                      title: context.l10n.categories,
                      desc: project.category,
                    ),
                    _titleDesc(
                      context: context,
                      title: context.l10n.visit,
                      desc: '',
                      customWidget: _visitWidget(context, project.platforms),
                    ),
                  ],
                ),
              ),
              ResponsiveRowColumnItem(
                child: ImageDefault(
                  assetImage: project.imageDashboard,
                  height:
                      context.screenHeight * (isSmallerThanDesktop ? .5 : .9),
                  width: double.infinity,
                  borderCircular: AppRadius.lg,
                  boxFit: BoxFit.cover,
                ),
              ),
              ResponsiveRowColumnItem(
                child: Column(
                  children: [
                    _listSections(context, project),
                    const FooterSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
        headerSliverBuilder: (_, _) => [],
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
      _SectionItem(
        title: context.l10n.results,
        desc: '',
        images: portfolio.images,
      ),
    ];

    final isSmallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (_, index) {
        final item = items[index];
        return Column(
          children: [
            const Divider(height: 1),
            AppSpacing.gapH(AppLayout.sectionGap),
            item.images != null
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.title, style: context.textTheme.displayMedium),
                      AppSpacing.gapH(
                        isSmallerThanDesktop
                            ? AppSpacing.md
                            : AppLayout.sectionGap,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: AppSpacing.xxl * 8 + AppSpacing.md,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: item.images!.length,
                          itemBuilder: (_, i) => ImageDefault(
                            assetImage: item.images![i],
                            height: AppSpacing.xxl * 5 + AppSpacing.xs * 3,
                            width: AppSpacing.xxl * 4 + AppSpacing.sm * 2,
                            borderCircular: AppRadius.sm,
                            padding: AppSpacing.hMd,
                            boxFit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  )
                : StickyHeader(
                    overlapHeaders: !isSmallerThanDesktop,
                    header: Text(
                      item.title,
                      style: context.textTheme.displayMedium,
                    ),
                    content: Row(
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: isSmallerThanDesktop
                                ? 0
                                : context.screenWidth * .4,
                          ),
                        ),
                        Expanded(
                          child: HtmlWidget(
                            item.desc,
                            textStyle: context.textTheme.bodyMedium,
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

  Widget _titleDesc({
    required BuildContext context,
    required String title,
    required String desc,
    Widget? customWidget,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.textTheme.bodyLarge),
          AppSpacing.gapH(6),
          customWidget ??
              Text(
                desc,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w300,
                  color: context.textTheme.bodyMedium?.color?.withValues(
                    alpha: .7,
                  ),
                ),
              ),
        ],
      ),
    );
  }

  Widget _visitWidget(BuildContext context, List<Platforms> platforms) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: platforms.map((e) {
        return Row(
          children: [
            ButtonInkWell(
              onPress: () => _launchUrl(e.linkUrl, context),
              child: iconWidget(e.enumPlatform, size: 16),
            ),
            if (e != platforms.last)
              Padding(
                padding: AppSpacing.hSm,
                child: Text(
                  ' | ',
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w300,
                    color: context.textTheme.bodyMedium?.color?.withValues(
                      alpha: .7,
                    ),
                  ),
                ),
              ),
          ],
        );
      }).toList(),
    );
  }

  Future<void> _launchUrl(String url, BuildContext context) async {
    final uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(context.l10n.cannotOpenLink)));
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.l10n.errorOccurred)));
      }
    }
  }
}

class _SectionItem {
  final String title;
  final String desc;
  final List<String>? images;

  const _SectionItem({required this.title, required this.desc, this.images});
}
