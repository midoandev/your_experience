import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_experience/core/theme/responsive.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/widgets/app_button.dart';

/// "Mobile apps and AI tools for startups." with the last word changing,
/// the lead, two actions and four facts.
class HeroSection extends ConsumerStatefulWidget {
  final VoidCallback onBrief;
  final VoidCallback onSeeNow;

  const HeroSection({super.key, required this.onBrief, required this.onSeeNow});

  @override
  ConsumerState<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends ConsumerState<HeroSection> {
  Timer? _timer;
  int _word = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _timer?.cancel();
    // Reduced motion: the first word stays.
    if (!MediaQuery.disableAnimationsOf(context)) {
      _timer = Timer.periodic(const Duration(milliseconds: 2600), (_) {
        if (mounted) setState(() => _word++);
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.textTheme;
    final words = l.heroWords.split('|');
    final word = words[_word % words.length];
    final h1 = Responsive.value(
      context,
      mobile: t.displaySmall,
      tablet: t.displayMedium,
      desktop: t.displayLarge?.copyWith(fontSize: 96, letterSpacing: -3.6),
    );
    final facts = [
      (l.factBuilding, l.factBuildingValue),
      (l.factShipped, l.factShippedValue),
      (l.factNow, l.factNowValue),
      (l.factStack, l.factStackValue),
    ];

    final lead = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l.heroLeadNew,
          style: t.bodyLarge?.copyWith(fontSize: 19),
        ),
        AppSpacing.gapH(AppSpacing.lg),
        Wrap(
          spacing: AppSpacing.sm + 4,
          runSpacing: AppSpacing.sm + 4,
          children: [
            AppButton(label: l.ctaBrief, onPressed: widget.onBrief),
            AppButton.secondary(label: l.heroSeeNow, onPressed: widget.onSeeNow),
          ],
        ),
      ],
    );
    final factList = Column(
      children: [
        for (final (a, b) in facts)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: context.colors.outlineVariant)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    a,
                    style: t.bodySmall?.copyWith(color: context.custom.textMuted),
                  ),
                ),
                Text(b, style: t.bodyMedium),
              ],
            ),
          ),
      ],
    );

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: (context.screenHeight - Responsive.navHeight(context) - 40)
            .clamp(480, 1000),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(
            header: true,
            label: '${l.heroPrefix} ${words.first}',
            child: ExcludeSemantics(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: '${l.heroPrefix} '),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.baseline,
                      baseline: TextBaseline.alphabetic,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 380),
                        transitionBuilder: (child, a) => FadeTransition(
                          opacity: a,
                          child: SlideTransition(
                            position: Tween(
                              begin: const Offset(0, .25),
                              end: Offset.zero,
                            ).animate(a),
                            child: child,
                          ),
                        ),
                        child: Container(
                          key: ValueKey(word),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: context.colors.primary,
                                width: 5,
                              ),
                            ),
                          ),
                          child: Text(word, style: h1),
                        ),
                      ),
                    ),
                  ],
                ),
                style: h1,
              ),
            ),
          ),
          AppSpacing.gapH(AppSpacing.xxl),
          LayoutBuilder(
            builder: (context, c) => c.maxWidth >= 860
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 6, child: lead),
                      const Spacer(flex: 1),
                      Expanded(flex: 5, child: factList),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [lead, AppSpacing.gapH(AppSpacing.xl), factList],
                  ),
          ),
        ],
      ),
    );
  }
}
