import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:your_experience/core/theme/responsive.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/widgets/app_button.dart';
import 'package:your_experience/core/ui/widgets/content_width.dart';
import 'package:your_experience/core/ui/widgets/top_bar.dart';

/// Shown for unknown routes and unknown project ids.
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        child: Row(
          children: [
            BrandLogo(onTap: () => context.goNamed('home')),
            const Spacer(),
            const ThemeToggleButton(),
          ],
        ),
      ),
      body: ContentWidth(
        maxWidth: 560,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ExcludeSemantics(
                child: Text(
                  '404',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontFamily: context.textTheme.labelMedium?.fontFamily,
                    color: context.colors.primary,
                    fontSize: Responsive.isMobile(context) ? 72 : 96,
                  ),
                ),
              ),
              AppSpacing.gapH(AppSpacing.md),
              Text(
                context.l10n.notFoundTitle,
                style: context.textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              AppSpacing.gapH(AppSpacing.sm),
              Text(
                context.l10n.notFoundBody,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              AppSpacing.gapH(AppSpacing.xl),
              AppButton(
                label: context.l10n.goHome,
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () => context.goNamed('home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
