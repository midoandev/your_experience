import 'package:flutter/material.dart';

import '../extensions/context_ext.dart';
import '../../theme/app_layout.dart';

/// Universal card with hover effect, accent gradient line, and optional tap.
/// Provides the card chrome — content goes in [child].
class AppCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double? accentHeight;

  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.accentHeight,
  });

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final cs = context.colors;
    final cus = context.custom;

    final card = AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: _hovered ? cs.surfaceContainerHigh : cs.surfaceContainerLow,
        border: Border.all(
          color: _hovered ? cus.borderAccent : cs.outlineVariant,
          width: AppLayout.cardBorder,
        ),
        borderRadius: BorderRadius.circular(AppLayout.cardRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.accentHeight != null)
            Container(
              height: widget.accentHeight! + 2,
              decoration: BoxDecoration(
                gradient: _hovered
                    ? LinearGradient(colors: [cs.primary, cus.teal400])
                    : LinearGradient(colors: [cus.blue800, cus.blue800]),
              ),
            ),
          widget.child,
        ],
      ),
    );

    if (widget.onTap != null) {
      return MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(onTap: widget.onTap, child: card),
      );
    }

    return card;
  }
}
