import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/data/icon_mapper.dart';
import 'package:your_experience/features/services/view_model/services_vm.dart';

class ServicesSection extends ConsumerWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(servicesVmProvider);
    final isSmallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final height = isSmallerThanDesktop ? context.screenHeight * .1 : -50.0;

    return SizedBox(
      height: height + context.screenHeight,
      child: ResponsiveRowColumn(
        columnPadding: AppSpacing.hMd,
        columnSpacing: isSmallerThanDesktop ? 32 : context.screenHeight * .2,
        rowMainAxisAlignment: MainAxisAlignment.center,
        columnMainAxisAlignment: MainAxisAlignment.center,
        layout: ResponsiveRowColumnType.COLUMN,
        children: [
          ResponsiveRowColumnItem(
            columnFlex: 0,
            child: Column(
              children: [
                Text(
                  vm.title,
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleLarge,
                ),
                AppSpacing.gapH(4),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth:
                        context.screenWidth * (isSmallerThanDesktop ? 1 : .7),
                  ),
                  child: Text(
                    vm.description,
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleMedium,
                  ),
                ),
              ],
            ),
          ),
          ResponsiveRowColumnItem(
            columnFlex: 0,
            child: IntrinsicHeight(
              child: ResponsiveRowColumn(
                rowCrossAxisAlignment: CrossAxisAlignment.start,
                rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
                columnSpacing: 12,
                columnPadding: const EdgeInsets.symmetric(vertical: 12),
                layout: isSmallerThanDesktop
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                children: vm.items.map((item) {
                  return ResponsiveRowColumnItem(
                    child: item.iconName.isEmpty
                        ? isSmallerThanDesktop
                              ? const Divider(thickness: 2, height: 12)
                              : const VerticalDivider(thickness: 2, width: 20)
                        : _serviceCard(
                            context: context,
                            iconName: item.iconName,
                            title: item.title,
                            description: item.description,
                          ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _serviceCard({
    required BuildContext context,
    required String iconName,
    required String title,
    required String description,
  }) {
    final isSmallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    return SizedBox(
      width: context.screenWidth * (isSmallerThanDesktop ? 1 : .17),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: !isSmallerThanDesktop,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: iconWidget(iconName, size: 32),
              ),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.textTheme.titleMedium,
          ),
          AppSpacing.gapH(8),
          Text(
            description,
            textAlign: TextAlign.justify,
            style: context.textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
