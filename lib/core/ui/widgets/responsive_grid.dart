import 'package:flutter/widgets.dart';

import '../../theme/app_layout.dart';

/// Responsive grid whose column count comes from the space it actually gets
/// (not the screen width), so it adapts inside any parent on any device.
///
/// Items size to their own content and align to the top of each row.
/// (An IntrinsicHeight-based equal-height version under-measured wrapping
/// text/chips and overflowed; intrinsics are also costly per Flutter docs.)
/// For visually equal cards, give items a fixed structure instead
/// (fixed-ratio media, maxLines on text).
class ResponsiveGrid extends StatelessWidget {
  final int itemCount;
  final double minItemWidth;
  final int maxColumns;
  final double gap;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const ResponsiveGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.minItemWidth = 320,
    this.maxColumns = 2,
    this.gap = AppLayout.cardGap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final fit = ((c.maxWidth + gap) / (minItemWidth + gap)).floor();
        final columns = fit.clamp(1, maxColumns);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var i = 0; i < itemCount; i += columns) ...[
              if (i > 0) SizedBox(height: gap),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var j = 0; j < columns; j++) ...[
                    if (j > 0) SizedBox(width: gap),
                    Expanded(
                      child: i + j < itemCount
                          ? itemBuilder(context, i + j)
                          : const SizedBox.shrink(),
                    ),
                  ],
                ],
              ),
            ],
          ],
        );
      },
    );
  }
}
