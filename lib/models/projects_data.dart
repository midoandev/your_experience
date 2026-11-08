class ProjectsData {
  final String id;
  final String title;
  final String framework;
  final List<Platforms> platforms;
  final String category;
  final String imageDashboard;
  final String imageIcon;
  final String website;
  final String overview;
  final String execution;
  final String result;
  final String timeCreated;
  final List<String> images;
  final bool isAbandoned;

  /// Card thumbnail uses the app screenshots even if a cover exists
  /// (for covers that are logo banners rather than visuals).
  final bool preferScreensThumb;

  /// Public Google Play figures (empty = not shown), e.g. '5K+', '4.6'.
  /// Source + date: [PortfolioData.storeStatsAsOf].
  final String installs;
  final String rating;

  const ProjectsData({
    required this.id,
    required this.title,
    required this.framework,
    required this.platforms,
    required this.category,
    required this.imageDashboard,
    this.imageIcon = '',
    this.website = '',
    required this.overview,
    required this.execution,
    required this.result,
    required this.timeCreated,
    required this.images,
    this.isAbandoned = false,
    this.preferScreensThumb = false,
    this.installs = '',
    this.rating = '',
  });

  bool get hasStoreStats => installs.isNotEmpty || rating.isNotEmpty;

  /// [installs] as a number for sorting: '5K+' -> 5000, '1M+' -> 1000000.
  int get installsCount {
    final m = RegExp(r'([\d.]+)\s*([KMB]?)').firstMatch(installs);
    if (m == null) return 0;
    final n = double.tryParse(m.group(1)!) ?? 0;
    final mult = switch (m.group(2)) {
      'K' => 1e3,
      'M' => 1e6,
      'B' => 1e9,
      _ => 1.0,
    };
    return (n * mult).round();
  }

  static const empty = ProjectsData(
    id: '',
    title: '',
    framework: '',
    platforms: [],
    category: '',
    imageDashboard: '',
    overview: '',
    execution: '',
    result: '',
    timeCreated: '',
    images: [],
  );

  String get platformText => platforms.map((e) => e.name).join(' · ');

  /// Year parsed from [timeCreated] ("June, 1 2024" → "2024").
  String get year {
    final match = RegExp(r'(\d{4})').firstMatch(timeCreated);
    return match?.group(1) ?? '';
  }

  bool get isLive => !isAbandoned && platforms.isNotEmpty;
}

/// Splits a description like "Intro text.\n- point a\n- point b"
/// into an intro paragraph and a list of bullet points.
class RichDescription {
  final String intro;
  final List<String> bullets;

  const RichDescription({required this.intro, required this.bullets});

  factory RichDescription.parse(String raw) {
    final introLines = <String>[];
    final bullets = <String>[];
    for (final line in raw.split('\n')) {
      final trimmed = line.trim();
      if (trimmed.isEmpty) continue;
      if (trimmed.startsWith('- ')) {
        bullets.add(trimmed.substring(2).trim());
      } else {
        introLines.add(trimmed);
      }
    }
    var intro = introLines.join(' ');
    // Drop trailing "Key highlights:" style lead-ins — bullets follow anyway.
    intro = intro.replaceFirst(RegExp(r'\s*[A-Z][\w\s]{0,40}:\s*$'), '.');
    intro = intro.replaceAll(RegExp(r'\.\.$'), '.');
    return RichDescription(intro: intro, bullets: bullets);
  }
}

class Platforms {
  final String enumPlatform;
  final String linkUrl;

  const Platforms({required this.enumPlatform, required this.linkUrl});

  /// Store name for CTA labels; null for the web (not a store).
  String? get storeName => switch (enumPlatform) {
    'android' => 'Google Play',
    'ios' => 'App Store',
    _ => null,
  };

  String get name {
    switch (enumPlatform) {
      case 'android':
        return 'Android';
      case 'ios':
        return 'iOS';
      case 'web':
        return 'Website';
      default:
        return enumPlatform;
    }
  }
}
