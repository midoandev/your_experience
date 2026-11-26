import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_experience/core/services/link_service.dart';
import 'package:your_experience/core/theme/responsive.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_duration.dart';
import 'package:your_experience/core/ui/widgets/content_width.dart';
import 'package:your_experience/core/ui/widgets/reveal.dart';
import 'package:your_experience/core/ui/widgets/site_chrome.dart';
import 'package:your_experience/core/ui/widgets/site_kit.dart';
import 'package:your_experience/features/about/view/about_section.dart';
import 'package:your_experience/features/experience/view/experience_section.dart';
import 'package:your_experience/features/home/view_model/home_vm.dart';
import 'package:your_experience/features/home_hero/view/hero_section.dart';
import 'package:your_experience/features/now/view/now_section.dart';
import 'package:your_experience/features/portfolio/view/portfolio_section.dart';
import 'package:your_experience/features/services/view/services_section.dart';
import 'package:your_experience/models/main_menu.dart';

class HomePage extends ConsumerStatefulWidget {
  /// Section to scroll to on open (from a project page link like /#work).
  final String? section;
  const HomePage({super.key, this.section});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
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
    final target = widget.section;
    if (target != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollTo(target));
    }
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
    );
  }

  void _toTop() => _scroll.animateTo(
    0,
    duration: AppDuration.slow,
    curve: Curves.easeInOutCubic,
  );

  Future<void> _open(String url) async {
    final ok = await LinkService.open(url);
    if (!ok && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.cannotOpenLink)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(homeVmProvider);
    final navHeight = Responsive.navHeight(context);
    final topInset = MediaQuery.paddingOf(context).top + navHeight;
    final l = context.l10n;

    Widget section(String id, Widget child) => SectionBox(
      key: _anchor(id),
      child: Reveal(child: child),
    );

    String label(MainMenu m) => switch (m.widgetKey) {
      'work' => l.navWork,
      'now' => l.navNow,
      'services' => l.navServices,
      'about' => l.navAbout,
      _ => m.nameTab,
    };

    final links = [
      for (final m in vm.sections) NavEntry(m.id, label(m), () => _scrollTo(m.id)),
    ];
    String contact(String icon) =>
        vm.contacts.firstWhere((c) => c.iconName == icon).link;

    return Title(
      title: '${l.navLogo}: ${l.heroPrefix} ${l.heroWords.split('|').first}',
      color: context.colors.primary,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: SiteNav(
          height: navHeight,
          elevated: vm.isScrolled,
          links: links,
          active: vm.activeSection,
          onLogo: _toTop,
          onBrief: () => _open(vm.mailto),
        ),
        body: Scrollbar(
          controller: _scroll,
          child: SingleChildScrollView(
            controller: _scroll,
            child: ContentWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: topInset),
                  HeroSection(
                    onBrief: () => _open(vm.mailto),
                    onSeeNow: () => _scrollTo('now'),
                  ),
                  section('now', const NowSection()),
                  section('experience', const ExperienceSection()),
                  section('work', const PortfolioSection()),
                  section('services', const ServicesSection()),
                  section('about', const AboutSection()),
                  SectionBox(
                    child: SiteFooter(
                      onBrief: () => _open(vm.mailto),
                      onLogo: _toTop,
                      groups: [
                        FooterGroup(l.footerWork, [
                          NavEntry('work', l.footerClientApps, () => _scrollTo('work')),
                          NavEntry('now', l.navNow, () => _scrollTo('now')),
                        ]),
                        FooterGroup(l.footerServices, [
                          NavEntry('services', l.footerNewApps, () => _scrollTo('services')),
                          NavEntry('services', l.footerReleases, () => _scrollTo('services')),
                        ]),
                        FooterGroup(l.footerAbout, [
                          NavEntry('experience', l.footerExperience, () => _scrollTo('experience')),
                          NavEntry('about', l.footerTools, () => _scrollTo('about')),
                        ]),
                        FooterGroup(l.footerContact, [
                          NavEntry('github', l.gitHub, () => _open(contact('github'))),
                          NavEntry('linkedin', l.linkedIn, () => _open(contact('linkedin'))),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
