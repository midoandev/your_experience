import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectsData {
  String id;
  String title;
  String framework;
  List<Platforms> platforms;
  String website;
  String imageDashboard;
  String imageIcon;
  DetailsDescription overview;
  DetailsDescription execution;
  // String result;
  String timeCreated;
  String category;
  List<String> images;

  ProjectsData({required this.id,
    required this.title,
    required this.framework,
    required this.platforms,
    required this.website,
    required this.imageDashboard,
    required this.imageIcon,
    required this.overview,
    required this.execution,
    // required this.result,
    required this.timeCreated,
    required this.category,
    required this.images});

  factory ProjectsData.empty() =>
      ProjectsData(
          id: '',
          title: '',
          framework: '',
          platforms: [],
          website: '',
          imageDashboard: '',
          imageIcon: '',
          overview: DetailsDescription.empty(),
          execution: DetailsDescription.empty(),
          // result: '',
          timeCreated: '',
          category: '',
          images: []);

  String get platformText {
    final List<String> platformText = platforms.map((e) => e.enumPlatform.text)
        .toList();
    return platformText.join(' | ');
  }
}

class DetailsDescription {
  String top;
  List<String> body;
  String bottom;

  DetailsDescription({required this.top, required this.body, this.bottom = ''});
  factory DetailsDescription.empty() => DetailsDescription(top: '', bottom: '', body: []);
}
enum EnumPlatform {
  android('Android'),
  ios('iOS'),
  web('Website');

  const EnumPlatform(this.text);

  final String text;

}

class Platforms {
  EnumPlatform enumPlatform;
  String linkUrl;
  String desc;

  Platforms({
    required this.enumPlatform,
    required this.linkUrl,
    this.desc = ''});

  factory Platforms.empty() =>
      Platforms(desc: '', linkUrl: '', enumPlatform: EnumPlatform.android);


  IconData get iconUrl {
    switch (enumPlatform) {
      case EnumPlatform.android:
        return FontAwesomeIcons.googlePlay;
      case EnumPlatform.ios:
      return FontAwesomeIcons.appStore;
      case EnumPlatform.web:
        return FontAwesomeIcons.globe;
      default:
        return Icons.code;
    }
  }

}
