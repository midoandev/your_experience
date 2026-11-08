import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/theme/responsive.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_duration.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/widgets/content_width.dart';
import 'package:your_experience/core/ui/widgets/reveal.dart';
import 'package:your_experience/core/ui/widgets/top_bar.dart';
import 'package:your_experience/features/about/view/about_section.dart';
import 'package:your_experience/features/contact/view/contact_section.dart';
import 'package:your_experience/features/footer/view/footer_section.dart';
import 'package:your_experience/features/home/view_model/home_vm.dart';
import 'package:your_experience/features/home_hero/view/hero_section.dart';
import 'package:your_experience/features/portfolio/view/portfolio_section.dart';
import 'package:your_experience/features/services/view/services_section.dart';
import 'package:your_experience/features/tech_stack/view/tech_stack_section.dart';
import 'package:your_experience/models/main_menu.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  // Widget-layer concerns: scroll controller + anchors for each section.
  final _scroll = ScrollController();
  final _anchors = <String, GlobalKey>{};

  GlobalKey _anchor(String id) => _anchors.putIfAbsent(id, GlobalKey.new);

  @override
  void initState() {
    super.initState();
    _scroll.addListener(
      () => ref
          .read(homeVmProvider.notifier)
          .onScroll(_scroll.offset, activeSection: _sectionInView()),
    );
  }

  /// Last section whose top has passed ~40% of the viewport (scroll spy).
  String? _sectionInView() {
    final line = MediaQuery.sizeOf(context).height * .4;
    String? current;
    for (final m in ref.read(homeVmProvider).sections) {
      final box =
          _anchors[m.id]?.currentContext?.findRenderObject() as RenderBox?;
      if (box == null || !box.attached) continue;
      if (box.localToGlobal(Offset.zero).dy <= line) current = m.id;
    }
    return current;
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _scrollTo(String id) async {
    final ctx = _anchors[id]?.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      duration: MediaQuery.disableAnimationsOf(context)
          ? Duration.zero
          : AppDuration.slow,
      curve: Curves.easeInOutCubic,
      alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
    );
  }

  void _scrollToTop() => _scroll.animateTo(
    0,
    duration: AppDuration.slow,
    curve: Curves.easeInOutCubic,
  );

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(homeVmProvider);
    final gap = Responsive.sectionGap(context);
    final navHeight = Responsive.navHeight(context);
    final topInset = MediaQuery.paddingOf(context).top + navHeight;

    Widget section(String id, Widget child) => Padding(
      key: _anchor(id),
      // Leaves room under the sticky nav when scrolled to.
      padding: EdgeInsets.only(top: gap),
      child: Reveal(child: child),
    );

    // Resets the tab title when coming back from a project page.
    return Title(
      title: '${context.l10n.navLogo} — ${context.l10n.heroRole}',
      color: context.colors.primary,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: TopBar(
          height: navHeight,
          elevated: vm.isScrolled,
          child: _NavBar(
            sections: vm.sections,
            active: vm.activeSection,
            onSelect: _scrollTo,
            onLogo: _scrollToTop,
          ),
        ),
        body: Stack(
          children: [
            const _BackgroundGlow(),
            Scrollbar(
              controller: _scroll,
              child: SingleChildScrollView(
                controller: _scroll,
                child: ContentWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: topInset),
                      Reveal(
                        child: HeroSection(
                          onContact: () => _scrollTo('contact'),
                        ),
                      ),
                      section('work', const PortfolioSection()),
                      section('about', const AboutSection()),
                      section('approach', const ServicesSection()),
                      section('stack', const TechStackSection()),
                      section('contact', const ContactSection()),
                      AppSpacing.gapH(gap * .75),
                      FooterSection(onBackToTop: _scrollToTop),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _labelFor(BuildContext context, MainMenu m) => switch (m.widgetKey) {
  'work' => context.l10n.navWork,
  'about' => context.l10n.navAbout,
  'approach' => context.l10n.navApproach,
  'stack' => context.l10n.navStack,
  'contact' => context.l10n.navContact,
  _ => m.nameTab,
};

class _NavBar extends StatelessWidget {
  final List<MainMenu> sections;
  final String? active;
  final ValueChanged<String> onSelect;
  final VoidCallback onLogo;

  const _NavBar({
    required this.sections,
    required this.active,
    required this.onSelect,
    required this.onLogo,
  });

  @override
  Widget build(BuildContext context) {
    // Decided by the bar's own width, so it never overflows (e.g. 451-600px,
    // larger text, longer Indonesian labels).
    return LayoutBuilder(
      builder: (context, c) {
        final showLinks = c.maxWidth >= AppLayout.navLinksWidth;
        return Row(
          children: [
            BrandLogo(onTap: onLogo),
            // Takes the free space; links shrink (never overflow) if it's tight.
            Expanded(
              child: showLinks
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          children: [
                            for (final m in sections)
                              _NavLink(
                                label: _labelFor(context, m),
                                active: m.id == active,
                                onTap: () => onSelect(m.id),
                              ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            AppSpacing.gapW(AppSpacing.xs),
            const ThemeToggleButton(),
            if (!showLinks)
              IconButton(
                tooltip: context.l10n.openMenu,
                icon: const Icon(Icons.menu_rounded),
                onPressed: () => _openMenu(context),
              ),
          ],
        );
      },
    );
  }

  Future<void> _openMenu(BuildContext context) async {
    final id = await showModalBottomSheet<String>(
      context: context,
      showDragHandle: true,
      backgroundColor: context.colors.surfaceContainerLow,
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final m in sections)
                ListTile(
                  minTileHeight: 56,
                  contentPadding: AppSpacing.hLg,
                  selected: m.id == active,
                  selectedColor: context.colors.primary,
                  title: Text(
                    _labelFor(context, m),
                    style: context.textTheme.titleMedium?.copyWith(
                      color: m.id == active ? context.colors.primary : null,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_rounded,
                    size: AppLayout.iconMd,
                    color: context.custom.textMuted,
                  ),
                  onTap: () => Navigator.of(sheetContext).pop(m.id),
                ),
            ],
          ),
        ),
      ),
    );
    if (id != null) onSelect(id);
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _NavLink({
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = context.colors;
    return Semantics(
      selected: active,
      child: TextButton(
        onPressed: onTap,
        style:
            TextButton.styleFrom(
              minimumSize: const Size(0, AppLayout.touchTarget),
              padding: AppSpacing.hMd,
              textStyle: context.textTheme.titleSmall,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppLayout.radiusFull),
              ),
            ).copyWith(
              // Current section: tinted pill + accent text (not color alone:
              // the pill shape also marks it).
              backgroundColor: WidgetStatePropertyAll(
                active ? context.custom.accentSoft : Colors.transparent,
              ),
              foregroundColor: WidgetStateProperty.resolveWith(
                (s) => active
                    ? cs.primary
                    : s.contains(WidgetState.hovered) ||
                          s.contains(WidgetState.focused)
                    ? cs.onSurface
                    : cs.onSurfaceVariant,
              ),
            ),
        child: Text(label),
      ),
    );
  }
}

/// Soft radial light at the top of the page.
class _BackgroundGlow extends StatelessWidget {
  const _BackgroundGlow();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -320,
      right: -200,
      child: IgnorePointer(
        child: Container(
          width: 900,
          height: 900,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                context.custom.glow,
                context.custom.glow.withValues(alpha: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
