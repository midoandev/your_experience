import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:your_experience/core/theme/app_layout.dart';
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
            AppLayout.gapH24,
            Text(
              context.l10n.digitalPortfolio,
              style: context.textTheme.labelMedium,
            ),
            AppLayout.gapH16,
            const CircularProgressIndicator(),
            AppLayout.gapH8,
            Text(context.l10n.waitAMoment, style: context.textTheme.labelSmall),
          ],
        ),
      ),
    );
  }
}
