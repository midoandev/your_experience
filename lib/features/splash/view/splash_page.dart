import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (mounted) context.goNamed('home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/stickers/yoga_sticker.png',
              width: AppSpacing.xxl,
            ),
            AppSpacing.gapH(AppSpacing.lg),
            Text(
              context.l10n.digitalPortfolio,
              style: context.textTheme.labelMedium,
            ),
            AppSpacing.gapH(AppSpacing.md),
            const CircularProgressIndicator(),
            AppSpacing.gapH(AppSpacing.sm),
            Text(context.l10n.waitAMoment, style: context.textTheme.labelSmall),
          ],
        ),
      ),
    );
  }
}
