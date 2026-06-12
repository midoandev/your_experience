import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:your_experience/core/ui/widgets/button_inkwell.dart';

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
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonInkWell(
                    child: const Icon(Icons.arrow_circle_left, size: 24),
                    onPress: () => context.pop(),
                  ),
                  ButtonInkWell(
                    onPress: () {},
                    child: const Icon(Icons.save_as, size: 24),
                  ),
                ],
              ),
            ),
            // ToolBar placeholder
          ],
        ),
      ),
      body: Center(child: Text('Editor: ${initialText ?? ''}')),
    );
  }
}
