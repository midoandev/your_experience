/// Layout constants. Breakpoints are the single source of truth for both
/// [Responsive] and the `ResponsiveBreakpoints` setup in `app.dart`.
abstract class AppLayout {
  // Breakpoints (see CLAUDE.md → Responsive Layout)
  static const double bpTablet = 451;
  static const double bpDesktop = 801;
  static const double bp4k = 1921;

  // Page padding (horizontal)
  static const double pagePadMobile = 20;
  static const double pagePadTablet = 32;
  static const double pagePadDesktop = 48;

  // Max content width (grows a little on large monitors)
  static const double maxWidth = 1120;
  static const double maxWidthWide = 1280;
  static const double wideScreen = 1600;

  // Component thresholds based on *available* width (LayoutBuilder)
  static const double heroSplitWidth = 880;
  static const double heroWideWidth = 760;
  static const double contactSplitWidth = 760;
  static const double navLinksWidth = 600;
  static const double detailSplitWidth = 900;

  // Below this viewport height (landscape phones) chrome gets tighter.
  static const double shortScreenHeight = 560;
  static const double maxReadingWidth = 680;

  // Vertical rhythm between home sections
  static const double sectionGapMobile = 72;
  static const double sectionGapDesktop = 112;

  // Card
  static const double cardPad = 24;
  static const double cardPadMobile = 20;
  static const double cardGap = 20;

  // Radius
  static const double radiusSm = 6;
  static const double radiusMd = 10;
  static const double radiusLg = 16;
  static const double radiusXl = 24;
  static const double radiusFull = 999;

  // Lines
  static const double hairline = 1;

  // Nav
  static const double navHeight = 68;
  static const double navHeightCompact = 56;

  // Accessibility: minimum interactive size (WCAG 2.5.5 / Material)
  static const double touchTarget = 44;

  // Button
  static const double buttonHeight = 48;
  static const double buttonPadH = 22;

  // Icons
  static const double iconSm = 16;
  static const double iconMd = 20;
  static const double iconLg = 24;
  static const double appIconSm = 52;
  static const double appIconLg = 80;
}
