import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/widgets/button_inkwell.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';

class EditorContentPage extends ConsumerWidget {
  final String? initialText;

  const EditorContentPage({super.key, this.initialText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSmallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(isSmallerThanDesktop ? 169 : 98),
        child: Column(
          children: [
            Padding(
              padding: AppSpacing.insetMd,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonInkWell(
                    child: const Icon(Icons.arrow_circle_left, size: 24),
                    onPress: () => context.pop(),
                  ),
                  ButtonInkWell(
                    onPress: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(context.l10n.contentSaved)),
                      );
                    },
                    child: const Icon(Icons.save_as, size: 24),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          '${context.l10n.editorLabel}: ${initialText ?? context.l10n.exNewProject}',
        ),
      ),
    );
  }
}
