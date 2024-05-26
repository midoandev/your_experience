import 'package:flutter/cupertino.dart';
import 'package:your_experience/features/domain/entities/main_profile.dart';

import '../../domain/entities/projects_data.dart';

class MainLocalDataSource {
  MainLocalDataSource();

  MainProfile getMainProfile() {
    var json = {
      "button_iam": {"text": "Download CV", "url": "www.google.com"},
      "description_iam":
          "Welcome to my official Portfolio website, explore a comprehensive collection of my projects carefully crafted using the versatile platforms Flutter and React Native.",
      "hi_iam": "Mido",
      "iam": "Mobile Developer",
      "image_iam": {"text": "mido", "url": "assets/images/home_image.png"}
    };
    return MainProfile.fromJson(json);
  }

  List<ProjectsData> getProject() {
    var listName = [
      ProjectsData(
          id: UniqueKey().toString(),
          title: 'Lorem ipsum dolor sit amet,',
          expertise: 'Lorem ipsum',
          platforms: 'Lorem ipsum',
          deliverables: 'Lorem ipsum',
          website: 'www.google.com',
          imageDashboard: 'assets/images/statistic_app_ss.jpeg',
          overview:
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,',
          execution:
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam',
          result:
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam',
          images: [
            'assets/images/statistic_app_ss.jpeg',
            'assets/images/todo_app_ss.jpeg'
          ],
          timeCreated: DateTime.now().toString()),
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
          execution:
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam',
          result:
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam',
          images: [
            'assets/images/statistic_app_ss.jpeg',
            'assets/images/todo_app_ss.jpeg'
          ],
          timeCreated: DateTime.now().toString()),
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
          execution:
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam',
          result:
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam',
          images: [
            'assets/images/statistic_app_ss.jpeg',
            'assets/images/todo_app_ss.jpeg'
          ],
          timeCreated: DateTime.now().toString()),
    ];
    return listName;
  }
}
