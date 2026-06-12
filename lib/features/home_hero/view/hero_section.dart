import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:universal_html/html.dart' as html;
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_radius.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/features/home_hero/view_model/hero_vm.dart';

class HeroSection extends ConsumerWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(heroVmProvider);
    final isSmallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);

    return SizedBox(
      height: context.screenHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: AppSpacing.insetLg,
            child: Icon(
              vm.isLightMode ? Icons.dark_mode : Icons.light_mode,
              size: 24,
            ),
          ),
          Expanded(
            child: ResponsiveRowColumn(
              columnSpacing: 32,
              columnVerticalDirection: VerticalDirection.down,
              rowMainAxisAlignment: MainAxisAlignment.spaceAround,
              columnMainAxisAlignment: MainAxisAlignment.center,
              rowPadding: AppSpacing.insetXl,
              columnPadding: AppSpacing.insetLg,
              layout: isSmallerThanDesktop
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              children: [
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  columnFlex: 1,
                  rowColumn: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${context.l10n.hiIAm} ${vm.profile.hiIam}',
                        style: context.textTheme.displaySmall?.copyWith(
                          letterSpacing: 3,
                        ),
                      ),
                      Text(
                        vm.profile.iam,
                        style: context.textTheme.displayMedium?.copyWith(
                          letterSpacing: 2.4,
                        ),
                      ),
                      AppSpacing.gapH(12),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: isSmallerThanDesktop
                              ? context.screenWidth
                              : 550,
                        ),
                        child: Text(
                          vm.profile.descriptionIam,
                          textAlign: TextAlign.start,
                          style: context.textTheme.titleMedium,
                        ),
                      ),
                      AppSpacing.gapH(24),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: _viewCv,
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                vertical: 24,
                                horizontal: 24,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppRadius.lg,
                                ),
                              ),
                              textStyle: context.textTheme.labelLarge,
                            ),
                            child: Text(context.l10n.downloadCv),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  columnOrder: 2,
                  columnFlex: 1,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: isSmallerThanDesktop ? 320 : 500,
                    ),
                    child: Image.asset(
                      vm.profile.imageIam.url,
                      fit: BoxFit.contain,
                      errorBuilder: (_, _, _) => const Icon(Icons.error),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _viewCv() async {
    final htmlContent = await rootBundle.loadString('assets/cv/cv.html');
    final encoded = base64.encode(htmlContent.codeUnits);
    html.window.open(
      'data:text/html;base64,$encoded',
      'CV - Agus Rakhmadi Mido',
    );
  }
}
