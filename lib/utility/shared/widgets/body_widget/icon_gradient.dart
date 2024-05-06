import 'package:flutter/material.dart';

class IconGradient extends StatelessWidget {
  final Widget child;

  const IconGradient({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const RadialGradient(
        center: Alignment.topRight,
        radius: .35,
        colors: [
          Color(0xFF1D74F5),
          Color(0xFFFF0099),
        ],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
