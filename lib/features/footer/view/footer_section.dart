import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/widgets/button_inkwell.dart';
import 'package:your_experience/data/icon_mapper.dart';
import 'package:your_experience/features/footer/view_model/footer_vm.dart';

class FooterSection extends ConsumerWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(footerVmProvider);
    final isSmallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppSpacing.gapH(40),
        const Divider(thickness: 2),
        AppSpacing.gapH(16),
        ResponsiveRowColumn(
          rowSpacing: 80,
          columnSpacing: 40,
          columnVerticalDirection: VerticalDirection.down,
          rowCrossAxisAlignment: CrossAxisAlignment.start,
          columnMainAxisAlignment: MainAxisAlignment.start,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          rowPadding: AppSpacing.hXl + AppSpacing.vLg,
          columnPadding: AppSpacing.insetXl,
          layout: isSmallerThanDesktop
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 0,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: (isSmallerThanDesktop ? context.screenWidth : 550),
                ),
                child: Container(
                  padding: AppSpacing.insetLg,
                  decoration: BoxDecoration(
                    color: context.colors.primary.withOpacity(.5),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 2,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.availableForFreelance,
                        textAlign: TextAlign.start,
                        style: context.textTheme.headlineMedium?.copyWith(
                          color: context.colors.onPrimary,
                        ),
                      ),
                      AppSpacing.gapH(12),
                      Text(
                        context.l10n.freelanceDescription,
                        textAlign: TextAlign.justify,
                        style: context.textTheme.labelLarge?.copyWith(
                          color: context.colors.onPrimary.withOpacity(.8),
                        ),
                      ),
                      AppSpacing.gapH(16),
                      Row(
                        children: vm.contacts.map((element) {
                          return Container(
                            margin: const EdgeInsets.only(right: 16),
                            child: ButtonInkWell(
                              onPress: () => _launchUrl(element.link),
                              child: Padding(
                                padding: AppSpacing.insetSm,
                                child: iconWidget(
                                  element.iconName,
                                  size: 20,
                                  color: context.colors.onPrimary.withOpacity(
                                    .8,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(context.l10n.pages, style: context.textTheme.titleLarge),
                  AppSpacing.gapH(24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: vm.contacts.map((e) {
                          return Container(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              e.name,
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: context.textTheme.bodyMedium?.color
                                    ?.withOpacity(.7),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        AppSpacing.gapH(24),
        const Divider(thickness: 2),
        AppSpacing.gapH(8),
        Text(context.l10n.copyright, style: context.textTheme.titleMedium),
        AppSpacing.gapH(16),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
