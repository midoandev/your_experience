import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../../domain/entities/projects_data.dart';

class MainLocalDataSource {
  MainLocalDataSource();

  List<ProjectsData> getProject() {
    var listName = [
      ProjectsData(
          id: UniqueKey().toString(),
          title: 'Lorem ipsum',
          expertise: 'Lorem ipsum',
          platforms: 'Lorem ipsum',
          deliverables: 'Lorem ipsum',
          website: 'www.google.com',
          imageDashboard: 'assets/images/statistic_app_ss.jpeg',
          overview:
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,',
          execution: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam',
          result: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam',
          images: [
            'assets/images/statistic_app_ss.jpeg',
            'assets/images/todo_app_ss.jpeg'
          ]),
      ProjectsData(
          id: UniqueKey().toString(),
          title: 'Lorem ipsum',
          expertise: 'Lorem ipsum',
          platforms: 'Lorem ipsum',
          deliverables: 'Lorem ipsum',
          website: 'www.google.com',
          imageDashboard: 'assets/images/todo_app_ss.jpeg',
          overview:
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,',
          execution: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam',
          result: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam',
          images: [
            'assets/images/statistic_app_ss.jpeg',
            'assets/images/todo_app_ss.jpeg'
          ]),
      ProjectsData(
          id: UniqueKey().toString(),
          title: 'Lorem ipsum',
          expertise: 'Lorem ipsum',
          platforms: 'Lorem ipsum',
          deliverables: 'Lorem ipsum',
          website: 'www.google.com',
          imageDashboard: 'assets/images/statistic_app_ss.jpeg',
          overview:
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,',
          execution: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam',
          result: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam',
          images: [
            'assets/images/statistic_app_ss.jpeg',
            'assets/images/todo_app_ss.jpeg'
          ]),
    ];
    return listName;
  }
}
