/// A picture shown whole: its size gives the aspect ratio, so no view crops it.
class Picture {
  final String path;
  final String alt;
  final int width;
  final int height;

  const Picture({
    required this.path,
    required this.alt,
    required this.width,
    required this.height,
  });

  double get aspectRatio => width / height;
}

/// A row in a list: a short name and an optional line under it.
class TextRow {
  final String title;
  final String detail;
  const TextRow(this.title, [this.detail = '']);
}

/// A label and its value, like "My role: Mobile developer".
class Fact {
  final String label;
  final String value;
  const Fact(this.label, this.value);
}

/// A link with its button label. Store, web or in-page (`#work`) targets.
class LinkItem {
  final String label;
  final String url;
  const LinkItem(this.label, this.url);
}

/// One case study. Content is generated from design/directions/products.json
/// (see tool/gen_projects.py), so the site matches the reviewed mockups.
class ProjectsData {
  final String id;
  final String name;

  /// What kind of app it is, written after the name: "Torcons, an AI chat app".
  final String category;

  /// One line for the home page card.
  final String summary;
  final Picture card;
  final String icon;

  /// Short label above the headline, like "Torcons, 2024".
  final String tag;
  final String headline;
  final String lead;
  final String description;
  final List<LinkItem> links;
  final List<Fact> facts;

  final String overviewTitle;
  final String overview;
  final List<TextRow> features;

  final String buildTitle;
  final String build;
  final List<TextRow> buildRows;
  final List<String> tools;

  /// Shown in "What I'm building now" instead of the work grid.
  final bool isCurrent;
  final bool isArchived;

  /// Pictures are null for a project without real app screens yet (OpenCash).
  final Picture? hero;
  final Picture? overviewPicture;
  final Picture? buildPicture;
  final String screensTitle;
  final List<Picture> screens;

  const ProjectsData({
    required this.id,
    required this.name,
    required this.category,
    required this.summary,
    required this.card,
    required this.icon,
    required this.tag,
    required this.headline,
    required this.lead,
    required this.description,
    required this.links,
    required this.facts,
    required this.overviewTitle,
    required this.overview,
    required this.features,
    required this.buildTitle,
    required this.build,
    required this.buildRows,
    required this.tools,
    this.isCurrent = false,
    this.isArchived = false,
    this.hero,
    this.overviewPicture,
    this.buildPicture,
    this.screensTitle = '',
    this.screens = const [],
  });

  bool get hasPictures => hero != null;
}
