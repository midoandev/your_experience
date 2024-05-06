import 'package:flutter/rendering.dart';

class HeartClipper extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
  Path path = Path();
  path.moveTo(0, size.height / 2);
  path.lineTo(size.width / 2, size.height);
  path.lineTo(size.width, size.height / 2);
  path.lineTo(size.width / 2, 0);
  path.lineTo(0, size.height / 2);
  path.close();
  canvas.drawPath(path, Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
  return false;
  }
  }