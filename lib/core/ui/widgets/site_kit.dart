import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/app_layout.dart';
import '../../theme/responsive.dart';
import '../extensions/context_ext.dart';
import '../tokens/app_duration.dart';
import '../tokens/app_spacing.dart';

/// Below this available width a split stacks its picture under the text.
const double kSplitWidth = 800;

/// A section heading (h2) with an optional line under it. [muted] continues
/// the heading in the muted colour, as in "Six more apps. For clients…".
class Heading extends StatelessWidget {
  final String title;
  final String? muted;
  final String? subtitle;

  const Heading(this.title, {super.key, this.muted, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final style = Responsive.value(
      context,
      mobile: context.textTheme.headlineMedium,
      tablet: context.textTheme.headlineLarge,
      desktop: context.textTheme.headlineLarge,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          header: true,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: title),
                if (muted != null)
                  TextSpan(
                    text: ' $muted',
                    style: TextStyle(color: context.custom.textMuted),
                  ),
              ],
            ),
            style: style,
          ),
        ),
        if (subtitle != null) ...[
          AppSpacing.gapH(AppSpacing.md),
          Text(
            subtitle!,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.custom.textMuted,
            ),
          ),
        ],
      ],
    );
  }
}

/// One entry of a [RowList].
class RowEntry {
  final String title;
  final String detail;
  final String value;
  const RowEntry(this.title, {this.detail = '', this.value = ''});
}

/// Rows split by hairlines: a name, an optional line under it and an
/// optional value on the right. [showDetail] hides the lines on small screens.
class RowList extends StatelessWidget {
  final List<RowEntry> rows;
  final bool showDetail;

  const RowList(this.rows, {super.key, this.showDetail = true});

  @override
  Widget build(BuildContext context) {
    final line = BorderSide(color: context.colors.outlineVariant);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final r in rows)
          Container(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
            decoration: BoxDecoration(border: Border(bottom: line)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(r.title, style: context.textTheme.titleSmall),
                    ),
                    if (r.value.isNotEmpty) ...[
                      AppSpacing.gapW(AppSpacing.md),
                      Flexible(
                        child: Text(
                          r.value,
                          textAlign: TextAlign.end,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.colors.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                if (showDetail && r.detail.isNotEmpty) ...[
                  AppSpacing.gapH(AppSpacing.xs),
                  Text(
                    r.detail,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.custom.textMuted,
                    ),
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }
}

/// A picture shown whole: the box takes the picture's own ratio, so nothing
/// is cropped. Zooms a little on hover inside its frame.
class WholePicture extends StatefulWidget {
  final String path;
  final double aspectRatio;
  final String alt;
  final double radius;

  /// Crop position, only for a photograph in a box of another ratio.
  final Alignment alignment;

  const WholePicture({
    super.key,
    required this.path,
    required this.aspectRatio,
    required this.alt,
    this.radius = AppLayout.radiusLg,
    this.alignment = Alignment.center,
  });

  @override
  State<WholePicture> createState() => _WholePictureState();
}

class _WholePictureState extends State<WholePicture> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final still = MediaQuery.disableAnimationsOf(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Semantics(
        image: true,
        label: widget.alt,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.radius),
          child: AspectRatio(
            aspectRatio: widget.aspectRatio,
            child: ColoredBox(
              color: context.colors.surfaceContainerLow,
              child: AnimatedScale(
                scale: _hover && !still ? 1.025 : 1,
                duration: AppDuration.fast,
                curve: Curves.easeOutCubic,
                child: Image.asset(
                  widget.path,
                  fit: BoxFit.cover,
                  alignment: widget.alignment,
                  excludeFromSemantics: true,
                  filterQuality: FilterQuality.medium,
                  errorBuilder: (_, _, _) => const SizedBox.expand(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Text on the left, a visual on the right (the visual centred on the text).
/// Stacks below [kSplitWidth] of available width.
class TextSplit extends StatelessWidget {
  final Widget text;
  final Widget visual;

  const TextSplit({super.key, required this.text, required this.visual});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        if (c.maxWidth < kSplitWidth) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [text, AppSpacing.gapH(AppSpacing.xl), visual],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: text),
            AppSpacing.gapW(AppSpacing.lg),
            Expanded(child: visual),
          ],
        );
      },
    );
  }
}

/// Real tool marks on small tiles. Names map to assets/vector/tools/*.svg.
class ToolIcons extends StatelessWidget {
  final List<String> names;
  final String label;

  const ToolIcons(this.names, {super.key, required this.label});

  static const _files = {
    'Flutter': 'flutter',
    'Dart': 'dart',
    'React Native': 'react',
    'Kotlin': 'kotlin',
    'Firebase': 'firebase',
    'Supabase': 'supabase',
    'Next.js': 'nextjs',
    'n8n': 'n8n',
    'Claude': 'claude',
    'Figma': 'figma',
    'GitHub Actions': 'github-actions',
    'Android': 'android',
    'iOS': 'apple',
  };

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      child: Wrap(
        spacing: AppSpacing.sm + 4,
        runSpacing: AppSpacing.sm + 4,
        children: [
          for (final n in names)
            if (_files[n] != null)
              Tooltip(
                message: n,
                child: Container(
                  width: 52,
                  height: 52,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: context.colors.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(AppLayout.radiusMd),
                  ),
                  child: SvgPicture.asset(
                    'assets/vector/tools/${_files[n]}.svg',
                    semanticsLabel: n,
                  ),
                ),
              ),
        ],
      ),
    );
  }
}

/// Vertical space of one section, from [Responsive.sectionGap].
class SectionBox extends StatelessWidget {
  final Widget child;
  const SectionBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(vertical: Responsive.sectionGap(context) / 2),
    child: child,
  );
}
