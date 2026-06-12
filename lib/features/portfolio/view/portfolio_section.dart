import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:html/parser.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_radius.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/widgets/button_inkwell.dart';
import 'package:your_experience/core/ui/widgets/image_default.dart';
import 'package:your_experience/features/portfolio/view_model/portfolio_vm.dart';
import 'package:your_experience/models/projects_data.dart';

class PortfolioSection extends ConsumerWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(portfolioVmProvider);
    final isSmallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);

    return SizedBox(
      height: context.screenHeight - 50,
      child: ResponsiveRowColumn(
        columnPadding: AppSpacing.hMd,
        columnSpacing: 16,
        columnMainAxisAlignment: MainAxisAlignment.center,
        layout: ResponsiveRowColumnType.COLUMN,
        children: [
          ResponsiveRowColumnItem(
            columnFlex: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallerThanDesktop ? 16 : 32,
              ).copyWith(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          context.l10n.takeALookAtMyPortfolio,
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleLarge,
                        ),
                        AppSpacing.gapH(4),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth:
                                context.screenWidth *
                                (isSmallerThanDesktop ? 1 : .7),
                          ),
                          child: Text(
                            context.l10n.portfolioDescription,
                            textAlign: TextAlign.center,
                            style: context.textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ResponsiveRowColumnItem(
            columnFlex: 1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: vm.projects.length,
              itemBuilder: (_, index) =>
                  _itemPortfolio(context, vm.projects[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemPortfolio(BuildContext context, ProjectsData item) {
    final isSmallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    return Container(
      height: 500,
      width: 600,
      padding: EdgeInsets.only(
        left: isSmallerThanDesktop ? 16 : 32,
        right: isSmallerThanDesktop ? 16 : 32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpacing.gapH(16),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.lg),
              clipBehavior: Clip.antiAlias,
              child: ImageDefault(
                assetImage: item.imageDashboard,
                height: double.infinity,
                width: double.infinity,
                borderCircular: AppRadius.lg,
                boxFit: BoxFit.cover,
              ),
            ),
          ),
          AppSpacing.gapH(16),
          Text(item.title, style: context.textTheme.titleLarge),
          AppSpacing.gapH(6),
          Text(
            parse(item.overview).body!.text,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w300,
              color: context.textTheme.bodyMedium?.color?.withValues(alpha: .7),
            ),
          ),
          AppSpacing.gapH(16),
          ButtonInkWell(
            onPress: () => context.pushNamed('portfolio-detail', extra: item),
            child: Padding(
              padding: AppSpacing.insetMd,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.l10n.readMore,
                    style: context.textTheme.bodyMedium,
                  ),
                  AppSpacing.gapW(8),
                  const Icon(Icons.arrow_circle_right_outlined),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
