import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';

class CreatePortfolioPage extends ConsumerStatefulWidget {
  const CreatePortfolioPage({super.key});

  @override
  ConsumerState<CreatePortfolioPage> createState() =>
      _CreatePortfolioPageState();
}

class _CreatePortfolioPageState extends ConsumerState<CreatePortfolioPage> {
  final _overviewCtrl = TextEditingController();
  final _executionCtrl = TextEditingController();
  final _resultsCtrl = TextEditingController();

  @override
  void dispose() {
    _overviewCtrl.dispose();
    _executionCtrl.dispose();
    _resultsCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: context.l10n.save,
        onPressed: () {
          // TODO: persist text when backend available
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(context.l10n.projectSaved)));
        },
        child: const Icon(Icons.save, size: 28),
      ),
      body: Padding(
        padding: AppSpacing.insetMd,
        child: ListView(
          children: [
            TextField(
              controller: _overviewCtrl,
              maxLines: null,
              decoration: InputDecoration(
                hintText: context.l10n.projectOverview,
              ),
            ),
            AppSpacing.gapH(AppSpacing.md),
            TextField(
              controller: _executionCtrl,
              maxLines: null,
              decoration: InputDecoration(hintText: context.l10n.execution),
            ),
            AppSpacing.gapH(AppSpacing.md),
            TextField(
              controller: _resultsCtrl,
              maxLines: null,
              decoration: InputDecoration(hintText: context.l10n.results),
            ),
          ],
        ),
      ),
    );
  }
}
