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
  });

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

  String get platformText => platforms.map((e) => e.name).join(' | ');
}

class Platforms {
  final String enumPlatform;
  final String linkUrl;

  const Platforms({required this.enumPlatform, required this.linkUrl});

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
