import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:your_experience/core/services/link_service.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/theme/responsive.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/widgets/app_button.dart';
import 'package:your_experience/core/ui/widgets/content_width.dart';
import 'package:your_experience/core/ui/widgets/reveal.dart';
import 'package:your_experience/core/ui/widgets/site_chrome.dart';
import 'package:your_experience/core/ui/widgets/site_kit.dart';
import 'package:your_experience/features/not_found/view/not_found_page.dart';
import 'package:your_experience/features/portfolio_detail/view_model/portfolio_detail_vm.dart';
import 'package:your_experience/models/projects_data.dart';

/// One case study: hero with its picture, what the app does, every screen
/// shown whole, and how it was built. A project without real app screens
/// yet (OpenCash) shows its text and icon only.
class PortfolioDetailPage extends ConsumerStatefulWidget {
  final String id;
  const PortfolioDetailPage({super.key, required this.id});

  @override
  ConsumerState<PortfolioDetailPage> createState() => _PortfolioDetailPageState();
}

class _PortfolioDetailPageState extends ConsumerState<PortfolioDetailPage> {
  final _scroll = ScrollController();

  @override
  void didUpdateWidget(PortfolioDetailPage old) {
    super.didUpdateWidget(old);
    if (old.id != widget.id && _scroll.hasClients) _scroll.jumpTo(0);
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _open(String url) async {
    // In-page links from the data ("a.html#work") go back to the home page.
    final hash = RegExp(r'^a\.html#(\w+)$').firstMatch(url);
    if (hash != null) {
      context.go('/?s=${hash.group(1)}');
      return;
    }
    final ok = await LinkService.open(url);
    if (!ok && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.cannotOpenLink)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(portfolioDetailVmProvider(widget.id));
    final p = vm.project;
    if (p == null) return const NotFoundPage();
    final l = context.l10n;
    final navHeight = Responsive.navHeight(context);
    String contact(String icon) =>
        vm.contacts.firstWhere((c) => c.iconName == icon).link;
    void home(String s) => context.go('/?s=$s');

    return Title(
      title: '${p.name}: ${p.headline.split(', ').skip(1).join(', ')}',
      color: context.colors.primary,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: SiteNav(
          height: navHeight,
          links: [
            NavEntry('work', l.navWork, () => home('work')),
            NavEntry('now', l.navNow, () => home('now')),
            NavEntry('services', l.navServices, () => home('services')),
            NavEntry('about', l.navAbout, () => home('about')),
          ],
          onLogo: () => context.go('/'),
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
                  SizedBox(height: MediaQuery.paddingOf(context).top + navHeight),
                  _Hero(project: p, onLink: _open),
                  SectionBox(child: Reveal(child: _Overview(project: p))),
                  if (p.screens.isNotEmpty)
                    SectionBox(child: Reveal(child: _Screens(project: p))),
                  SectionBox(
                    child: Reveal(
                      child: _Build(
                        project: p,
                        next: vm.next!,
                        onNext: () => context.goNamed(
                          'portfolio-detail',
                          pathParameters: {'id': vm.next!.id},
                        ),
                      ),
                    ),
                  ),
                  SectionBox(
                    child: SiteFooter(
                      onBrief: () => _open(vm.mailto),
                      onLogo: () => context.go('/'),
                      groups: [
                        FooterGroup(l.footerWork, [
                          NavEntry('work', l.footerClientApps, () => home('work')),
                          NavEntry('now', l.navNow, () => home('now')),
                        ]),
                        FooterGroup(l.footerServices, [
                          NavEntry('services', l.footerNewApps, () => home('services')),
                          NavEntry('services', l.footerReleases, () => home('services')),
                        ]),
                        FooterGroup(l.footerAbout, [
                          NavEntry('experience', l.footerExperience, () => home('experience')),
                          NavEntry('about', l.footerTools, () => home('about')),
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

class _Hero extends StatelessWidget {
  final ProjectsData project;
  final ValueChanged<String> onLink;
  const _Hero({required this.project, required this.onLink});

  @override
  Widget build(BuildContext context) {
    final p = project;
    final t = context.textTheme;
    final h1 = Responsive.value(
      context,
      mobile: t.displaySmall,
      tablet: t.displayMedium,
      desktop: t.displayLarge,
    );
    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.asset(p.icon, width: 28, height: 28, excludeFromSemantics: true),
            ),
            AppSpacing.gapW(AppSpacing.sm + 2),
            Flexible(
              child: Text(
                p.tag,
                style: t.bodySmall?.copyWith(color: context.custom.textMuted),
              ),
            ),
          ],
        ),
        AppSpacing.gapH(AppSpacing.md),
        Semantics(header: true, child: Text(p.headline, style: h1)),
        AppSpacing.gapH(AppSpacing.lg),
        Text(p.lead, style: t.bodyLarge?.copyWith(fontSize: 19)),
        AppSpacing.gapH(AppSpacing.lg),
        Wrap(
          spacing: AppSpacing.sm + 4,
          runSpacing: AppSpacing.sm + 4,
          children: [
            for (final (i, link) in p.links.indexed)
              i == 0
                  ? AppButton(label: link.label, onPressed: () => onLink(link.url))
                  : AppButton.secondary(
                      label: link.label,
                      onPressed: () => onLink(link.url),
                    ),
          ],
        ),
        AppSpacing.gapH(AppSpacing.xl),
        _Facts(p.facts),
      ],
    );
    final pad = EdgeInsets.only(top: AppSpacing.xl, bottom: Responsive.sectionGap(context) / 2);
    if (p.hero == null) return Padding(padding: pad, child: text);
    return Padding(
      padding: pad,
      child: LayoutBuilder(
        builder: (context, c) {
          final picture = WholePicture(
            path: p.hero!.path,
            aspectRatio: p.hero!.aspectRatio,
            alt: p.hero!.alt,
          );
          if (c.maxWidth < 860) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                text,
                AppSpacing.gapH(AppSpacing.xl),
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 520),
                    child: picture,
                  ),
                ),
              ],
            );
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 5, child: text),
              const Spacer(),
              Expanded(flex: 6, child: picture),
            ],
          );
        },
      ),
    );
  }
}

class _Facts extends StatelessWidget {
  final List<Fact> facts;
  const _Facts(this.facts);

  @override
  Widget build(BuildContext context) {
    final t = context.textTheme;
    return LayoutBuilder(
      builder: (context, c) {
        final w = (c.maxWidth - AppSpacing.lg) / 2;
        return Wrap(
          spacing: AppSpacing.lg,
          runSpacing: AppSpacing.md,
          children: [
            for (final f in facts)
              SizedBox(
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      f.label,
                      style: t.bodySmall?.copyWith(color: context.custom.textMuted),
                    ),
                    Text(f.value, style: t.bodyMedium),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}

class _Overview extends StatelessWidget {
  final ProjectsData project;
  const _Overview({required this.project});

  @override
  Widget build(BuildContext context) {
    final p = project;
    final rows = RowList(
      [for (final f in p.features) RowEntry(f.title, detail: f.detail)],
      showDetail: context.screenWidth >= 1024 || p.overviewPicture == null,
    );
    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Heading(p.overviewTitle),
        AppSpacing.gapH(AppSpacing.lg),
        Text(p.overview, style: context.textTheme.bodyLarge),
        if (p.overviewPicture != null) ...[AppSpacing.gapH(AppSpacing.md), rows],
      ],
    );
    return TextSplit(
      text: text,
      visual: p.overviewPicture == null
          ? rows
          : WholePicture(
              path: p.overviewPicture!.path,
              aspectRatio: p.overviewPicture!.aspectRatio,
              alt: p.overviewPicture!.alt,
            ),
    );
  }
}

class _Screens extends StatelessWidget {
  final ProjectsData project;
  const _Screens({required this.project});

  @override
  Widget build(BuildContext context) {
    final p = project;
    final many = p.screens.length > 5;
    final h = Responsive.value<double>(
      context,
      mobile: 240,
      tablet: many ? 340 : 300,
      desktop: many ? 500 : 420,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Heading(p.screensTitle),
        AppSpacing.gapH(AppSpacing.xl),
        LayoutBuilder(
          builder: (context, c) => Wrap(
            alignment: WrapAlignment.center,
            spacing: AppSpacing.lg,
            runSpacing: AppSpacing.lg,
            children: [
              for (final s in p.screens)
                SizedBox(
                  // Every screen whole at one height; a wide one never
                  // runs past the column.
                  width: (h * s.aspectRatio).clamp(0, c.maxWidth),
                  child: WholePicture(
                    path: s.path,
                    aspectRatio: s.aspectRatio,
                    alt: s.alt,
                    radius: AppLayout.radiusMd,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Build extends StatelessWidget {
  final ProjectsData project;
  final ProjectsData next;
  final VoidCallback onNext;
  const _Build({required this.project, required this.next, required this.onNext});

  @override
  Widget build(BuildContext context) {
    final p = project;
    final rows = RowList(
      [for (final r in p.buildRows) RowEntry(r.title, detail: r.detail)],
      showDetail: context.screenWidth >= 1280 || p.buildPicture == null,
    );
    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Heading(p.buildTitle),
        AppSpacing.gapH(AppSpacing.lg),
        Text(p.build, style: context.textTheme.bodyLarge),
        if (p.buildPicture != null) ...[AppSpacing.gapH(AppSpacing.md), rows],
        AppSpacing.gapH(AppSpacing.lg),
        ToolIcons(p.tools, label: context.l10n.toolsUsed),
        AppSpacing.gapH(AppSpacing.lg),
        Align(
          alignment: Alignment.centerLeft,
          child: AppButton.ghost(
            label: context.l10n.nextProjectName(next.name),
            icon: const Icon(Icons.arrow_forward_rounded),
            iconAfter: true,
            onPressed: onNext,
          ),
        ),
      ],
    );
    return TextSplit(
      text: text,
      visual: p.buildPicture == null
          ? rows
          : WholePicture(
              path: p.buildPicture!.path,
              aspectRatio: p.buildPicture!.aspectRatio,
              alt: p.buildPicture!.alt,
            ),
    );
  }
}
