import 'package:flutter/widgets.dart';

import '../../theme/responsive.dart';

/// Centers [child] within the max content width with responsive page padding.
class ContentWidth extends StatelessWidget {
  final Widget child;

  /// Defaults to [Responsive.maxContentWidth] (wider on large monitors).
  final double? maxWidth;

  const ContentWidth({super.key, required this.child, this.maxWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Responsive.pagePad(context)),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: maxWidth ?? Responsive.maxContentWidth(context),
          ),
          child: child,
        ),
      ),
    );
  }
}
