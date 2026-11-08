import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../theme/app_layout.dart';
import '../../theme/theme_mode_provider.dart';
import '../extensions/context_ext.dart';
import '../tokens/app_duration.dart';
import 'content_width.dart';

/// Translucent, blurred top bar. Shows a hairline border once [elevated].
class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final bool elevated;

  /// Use [Responsive.navHeight] so landscape phones get a compact bar.
  final double height;

  const TopBar({
    super.key,
    required this.child,
    this.elevated = true,
    this.height = AppLayout.navHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final cs = context.colors;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: AnimatedContainer(
          duration: AppDuration.fast,
          decoration: BoxDecoration(
            color: cs.surface.withValues(alpha: elevated ? .82 : 0),
            border: Border(
              bottom: BorderSide(
                color: elevated ? cs.outlineVariant : Colors.transparent,
                width: AppLayout.hairline,
              ),
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: ContentWidth(
              child: SizedBox(height: height, child: child),
            ),
          ),
        ),
      ),
    );
  }
}

/// `mido_` wordmark.
class BrandLogo extends StatelessWidget {
  final VoidCallback? onTap;
  const BrandLogo({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme.labelMedium?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.5,
    );
    return Semantics(
      button: onTap != null,
      label: context.l10n.navLogo,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppLayout.radiusSm),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
          child: ExcludeSemantics(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: context.l10n.navLogo, style: style),
                  TextSpan(
                    text: '_',
                    style: style?.copyWith(color: context.colors.primary),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeModeProvider) == ThemeMode.dark;
    return IconButton(
      onPressed: () => ref.read(themeModeProvider.notifier).toggle(),
      tooltip: isDark
          ? context.l10n.switchThemeToLight
          : context.l10n.switchThemeToDark,
      icon: AnimatedSwitcher(
        duration: AppDuration.fast,
        transitionBuilder: (child, anim) => RotationTransition(
          turns: Tween(begin: .75, end: 1.0).animate(anim),
          child: FadeTransition(opacity: anim, child: child),
        ),
        child: Icon(
          isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
          key: ValueKey(isDark),
          size: AppLayout.iconMd,
        ),
      ),
    );
  }
}
