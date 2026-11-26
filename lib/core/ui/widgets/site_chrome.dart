import 'package:flutter/material.dart';

import '../../theme/app_layout.dart';
import '../../theme/responsive.dart';
import '../extensions/context_ext.dart';
import '../tokens/app_spacing.dart';
import 'app_button.dart';
import 'top_bar.dart';

/// A link in the nav or the footer.
class NavEntry {
  final String id;
  final String label;
  final VoidCallback onTap;
  const NavEntry(this.id, this.label, this.onTap);
}

/// The green arc mark and the name, as on the mockups.
class SiteLogo extends StatelessWidget {
  final VoidCallback? onTap;
  const SiteLogo({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: onTap != null,
      label: context.l10n.navLogo,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppLayout.radiusSm),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
          child: ExcludeSemantics(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomPaint(
                  size: const Size(20, 18),
                  painter: _ArcPainter(context.colors.primary),
                ),
                AppSpacing.gapW(AppSpacing.sm),
                Text(
                  'Mido',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ArcPainter extends CustomPainter {
  final Color color;
  _ArcPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height, t = w * .26;
    final path = Path()
      ..moveTo(0, h)
      ..lineTo(0, w / 2)
      ..arcToPoint(Offset(w, w / 2), radius: Radius.circular(w / 2))
      ..lineTo(w, h)
      ..lineTo(w - t, h)
      ..lineTo(w - t, w / 2)
      ..arcToPoint(Offset(t, w / 2), radius: Radius.circular(w / 2 - t), clockwise: false)
      ..lineTo(t, h)
      ..close();
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_ArcPainter old) => old.color != color;
}

/// The fixed top bar: logo, section links, the brief button and the theme
/// toggle; a menu sheet when the bar is narrow.
class SiteNav extends StatelessWidget implements PreferredSizeWidget {
  final List<NavEntry> links;
  final String? active;
  final VoidCallback onLogo;
  final VoidCallback onBrief;
  final bool elevated;
  final double height;

  const SiteNav({
    super.key,
    required this.links,
    required this.onLogo,
    required this.onBrief,
    this.active,
    this.elevated = true,
    this.height = AppLayout.navHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return TopBar(
      height: height,
      elevated: elevated,
      child: LayoutBuilder(
        builder: (context, c) {
          final wide = c.maxWidth >= 900;
          final mid = c.maxWidth >= AppLayout.navLinksWidth;
          return Row(
            children: [
              SiteLogo(onTap: onLogo),
              if (mid) ...[
                AppSpacing.gapW(AppSpacing.xl),
                for (final l in links)
                  _NavLink(label: l.label, active: l.id == active, onTap: l.onTap),
              ],
              const Spacer(),
              const ThemeToggleButton(),
              if (wide) ...[
                AppSpacing.gapW(AppSpacing.sm),
                AppButton(label: context.l10n.ctaBrief, onPressed: onBrief),
              ],
              if (!mid)
                IconButton(
                  tooltip: context.l10n.openMenu,
                  icon: const Icon(Icons.menu_rounded),
                  onPressed: () => _openMenu(context),
                ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _openMenu(BuildContext context) async {
    final picked = await showModalBottomSheet<VoidCallback>(
      context: context,
      showDragHandle: true,
      backgroundColor: context.colors.surface,
      builder: (sheet) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg, 0, AppSpacing.lg, AppSpacing.lg,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final l in links)
                ListTile(
                  minTileHeight: 56,
                  contentPadding: EdgeInsets.zero,
                  title: Text(l.label, style: sheet.textTheme.titleMedium),
                  trailing: Icon(
                    Icons.arrow_forward_rounded,
                    size: AppLayout.iconMd,
                    color: sheet.custom.textMuted,
                  ),
                  onTap: () => Navigator.of(sheet).pop(l.onTap),
                ),
              AppSpacing.gapH(AppSpacing.md),
              AppButton(
                label: sheet.l10n.ctaBrief,
                expand: true,
                onPressed: () => Navigator.of(sheet).pop(onBrief),
              ),
            ],
          ),
        ),
      ),
    );
    picked?.call();
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _NavLink({required this.label, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final cs = context.colors;
    return Semantics(
      selected: active,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          minimumSize: const Size(0, AppLayout.touchTarget),
          padding: AppSpacing.hMd,
          textStyle: context.textTheme.titleSmall,
          foregroundColor: active ? cs.primary : cs.onSurface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppLayout.radiusSm),
          ),
        ),
        child: Text(label),
      ),
    );
  }
}

/// A column of footer links under a heading.
class FooterGroup {
  final String title;
  final List<NavEntry> links;
  const FooterGroup(this.title, this.links);
}

/// The closing call to action and the footer columns.
class SiteFooter extends StatelessWidget {
  final VoidCallback onBrief;
  final VoidCallback onLogo;
  final List<FooterGroup> groups;

  const SiteFooter({
    super.key,
    required this.onBrief,
    required this.onLogo,
    required this.groups,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.textTheme;
    final big = Responsive.value(
      context,
      mobile: t.displaySmall,
      tablet: t.displayMedium,
      desktop: t.displayLarge,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Semantics(header: true, child: Text(context.l10n.closeTitle, style: big)),
        AppSpacing.gapH(AppSpacing.md),
        Text(
          context.l10n.closeBody,
          style: t.bodyLarge?.copyWith(color: context.custom.textMuted),
        ),
        AppSpacing.gapH(AppSpacing.xl),
        Align(
          alignment: Alignment.centerLeft,
          child: AppButton(
            label: context.l10n.ctaBrief,
            onPressed: onBrief,
            icon: const Icon(Icons.arrow_forward_rounded),
            iconAfter: true,
          ),
        ),
        AppSpacing.gapH(AppSpacing.xxl + AppSpacing.lg),
        Divider(color: context.colors.outlineVariant),
        AppSpacing.gapH(AppSpacing.xl),
        LayoutBuilder(
          builder: (context, c) {
            final lede = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SiteLogo(onTap: onLogo),
                AppSpacing.gapH(AppSpacing.sm),
                Text(
                  context.l10n.footerLede,
                  style: t.bodyMedium?.copyWith(color: context.custom.textMuted),
                ),
              ],
            );
            final cols = [
              for (final g in groups)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(g.title, style: t.titleSmall),
                    AppSpacing.gapH(AppSpacing.xs),
                    for (final l in g.links)
                      TextButton(
                        onPressed: l.onTap,
                        style: TextButton.styleFrom(
                          minimumSize: const Size(0, AppLayout.touchTarget),
                          padding: EdgeInsets.zero,
                          foregroundColor: context.custom.textMuted,
                          textStyle: t.bodyMedium,
                        ),
                        child: Text(l.label),
                      ),
                  ],
                ),
            ];
            if (c.maxWidth >= kWideFooter) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 4, child: lede),
                  for (final col in cols) Expanded(flex: 2, child: col),
                ],
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                lede,
                AppSpacing.gapH(AppSpacing.lg),
                Wrap(
                  spacing: AppSpacing.xl,
                  runSpacing: AppSpacing.lg,
                  children: [
                    for (final col in cols)
                      SizedBox(width: (c.maxWidth - AppSpacing.xl) / 2, child: col),
                  ],
                ),
              ],
            );
          },
        ),
        AppSpacing.gapH(AppSpacing.xl),
        Wrap(
          spacing: AppSpacing.lg,
          runSpacing: AppSpacing.xs,
          children: [
            Text(
              context.l10n.copyrightName(DateTime.now().year.toString()),
              style: t.bodySmall?.copyWith(color: context.custom.textMuted),
            ),
            Text(
              context.l10n.trademarks,
              style: t.bodySmall?.copyWith(color: context.custom.textMuted),
            ),
          ],
        ),
        AppSpacing.gapH(AppSpacing.xl),
      ],
    );
  }
}

const double kWideFooter = 760;
