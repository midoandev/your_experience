import 'package:flutter/material.dart';

class ButtonInkWell extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPress;
  final Color? splashColor;

  const ButtonInkWell({
    super.key,
    required this.child,
    this.onPress,
    this.splashColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(onTap: onPress, splashColor: splashColor, child: child),
    );
  }
}
