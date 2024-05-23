

class ProjectsData {
  String id;
  String title;
  String expertise;
  String platforms;
  String deliverables;
  String website;
  String imageDashboard;
  String overview;
  String execution;
  String result;
  List<String> images;

  ProjectsData(
      {required this.id,
      required this.title,
      required this.expertise,
      required this.platforms,
      required this.deliverables,
      required this.website,
      required this.imageDashboard,
      required this.overview,
      required this.execution,
      required this.result,
      required this.images});

  factory ProjectsData.empty() => ProjectsData(
    id: '',
    title: '',
      expertise: '',
      platforms: '',
      deliverables: '',
      website: '',
      imageDashboard: '',
      overview: '',
      execution: '',
      result: '',
      images: []);
}
