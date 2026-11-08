import 'package:flutter/material.dart';

import '../../theme/app_layout.dart';
import '../extensions/context_ext.dart';
import '../tokens/app_duration.dart';

/// Surface card with hover lift, focus ring and keyboard support.
/// When [onTap] is null it renders as a static surface.
class AppCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final String? semanticLabel;

  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
    this.semanticLabel,
  });

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  bool _hovered = false;
  bool _focused = false;

  bool get _interactive => widget.onTap != null;

  @override
  Widget build(BuildContext context) {
    final cs = context.colors;
    final custom = context.custom;
    final active = _interactive && (_hovered || _focused);
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    final radius = BorderRadius.circular(AppLayout.radiusLg);

    final card = AnimatedContainer(
      duration: AppDuration.fastest,
      curve: Curves.easeOut,
      // Clips edge-to-edge media (project thumbnails) to the card radius.
      clipBehavior: Clip.antiAlias,
      transform: Matrix4.translationValues(
        0,
        active && !reduceMotion ? -3 : 0,
        0,
      ),
      decoration: BoxDecoration(
        color: active ? custom.cardHover : cs.surfaceContainerLow,
        borderRadius: radius,
        border: Border.all(
          color: _focused
              ? cs.primary
              : active
              ? custom.borderStrong
              : cs.outlineVariant,
          width: _focused ? 2 : AppLayout.hairline,
        ),
        boxShadow: [
          if (active)
            BoxShadow(
              color: custom.glow,
              blurRadius: 32,
              offset: const Offset(0, 12),
              spreadRadius: -12,
            ),
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: widget.onTap,
          onHover: (v) => setState(() => _hovered = v),
          onFocusChange: (v) => setState(() => _focused = v),
          borderRadius: radius,
          mouseCursor: _interactive
              ? SystemMouseCursors.click
              : MouseCursor.defer,
          overlayColor: WidgetStatePropertyAll(
            cs.primary.withValues(alpha: 0.04),
          ),
          child: Padding(
            padding: widget.padding ?? const EdgeInsets.all(AppLayout.cardPad),
            child: AppCardState(active: active, child: widget.child),
          ),
        ),
      ),
    );

    if (!_interactive) return card;
    return Semantics(button: true, label: widget.semanticLabel, child: card);
  }
}

/// Lets card content react to the card's hover/focus (e.g. image zoom)
/// without tracking its own pointer state.
class AppCardState extends InheritedWidget {
  final bool active;

  const AppCardState({super.key, required this.active, required super.child});

  static bool isActive(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppCardState>()?.active ??
      false;

  @override
  bool updateShouldNotify(AppCardState old) => old.active != active;
}
