import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';

class CreatePortfolioPage extends ConsumerWidget {
  const CreatePortfolioPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'Save',
        onPressed: () {},
        child: const Icon(Icons.save, size: 28),
      ),
      body: Padding(
        padding: AppSpacing.insetMd,
        child: ListView(
          children: [
            const TextField(
              maxLines: null,
              decoration: InputDecoration(hintText: 'Project Overview'),
            ),
            AppSpacing.gapH(16),
            const TextField(
              maxLines: null,
              decoration: InputDecoration(hintText: 'Execution'),
            ),
            AppSpacing.gapH(16),
            const TextField(
              maxLines: null,
              decoration: InputDecoration(hintText: 'Results'),
            ),
          ],
        ),
      ),
    );
  }
}
