import 'package:flutter/material.dart';
import 'package:your_experience/features/domain/entities/main_menu.dart';
import 'package:your_experience/features/domain/entities/main_profile.dart';

import '../../domain/entities/projects_data.dart';
import '../../domain/entities/services_data.dart';
import '../../presentation/home/footer/footer_ui.dart';
import '../../presentation/home/home_page/home_page_ui.dart';
import '../../presentation/home/portfolio/portfolio_ui.dart';
import '../../presentation/home/services/services_ui.dart';

class MainLocalDataSource {
  MainLocalDataSource();

  List<MainMenu> getMainMenu() => [
        MainMenu(
          nameTab: 'Home',
          classWidget: const HomePageUi(),
        ),
        MainMenu(
            nameTab: 'Services',
            classWidget: const ServicesUi(),
            description:
                "As a mobile developer, I offer a comprehensive range of services and skills, ensuring high-quality, efficient, and innovative application development. My expertise spans across various facets of mobile app creation, from design implementation to problem-solving and cross-platform development."),
        MainMenu(nameTab: 'Portfolio', classWidget: const PortfolioUi()),
        // MainMenu(nameTab: 'Contact', classWidget: const ContactUi()),
        MainMenu(nameTab: 'Footer', classWidget: const FooterUi()),
      ];

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

  List<ServicesData> getServices() {
    return [
      ServicesData(
        icon: Icons.design_services,
        title: 'Accurate Design Implementation',
        description:
            'I excel at accurately translating designs from Figma or similar tools into code, showcasing my expertise in design implementation and attention to visual details in the application.',
        desc:
            'Kemampuan untuk menerjemahkan desain dari Figma atau aplikasi sejenisnya ke dalam kode secara akurat, menunjukkan keahlian dalam implementasi desain dan perhatian terhadap detail visual pada aplikasi.',
      ),
      ServicesData(
        icon: Icons.touch_app,
        title: 'Clean Architecture Expertise',
        description:
            'I am experienced in using clean architecture for application development. This approach facilitates easy maintenance, feature additions, and changes within the project, while ensuring the code remains clean and scalable.',
        desc:
            'Terbiasa menggunakan clean architecture dalam pengembangan aplikasi. Pendekatan ini memudahkan perbaikan, penambahan fitur, serta perubahan dalam proyek, sambil menjaga agar kode tetap bersih dan mudah dikembangkan',
      ),
      ServicesData(
        icon: Icons.lightbulb,
        title: 'Creative Problem-Solving',
        description:
            "I have strong problem-solving skills for complex features and bring creative ideas to quickly and effectively resolve issues. My approach combines technical expertise with innovative thinking, ensuring high-quality results consistently.",
        desc:
            'Kemampuan yang baik dalam mencari solusi untuk menyelesaikan fitur-fitur yang kompleks. Saya juga memiliki ide yang kreatif untuk memecahkan masalah dengan cara yang cepat dan efektif',
      ),
      ServicesData(
        icon: Icons.code,
        title: 'Experience with Cross-Platform Development',
        description:
            "I have extensive experience in improving and enhancing previously developed applications, utilizing technologies such as Flutter and React Native to build smooth and efficient apps for both Android and iOS platforms.",
        desc:
            'Berpengalaman dalam memperbaiki dan meningkatkan aplikasi yang telah dikembangkan sebelumnya, dengan menggunakan teknologi Flutter dan React Native untuk membangun aplikasi yang berjalan lancar di platform Android dan iOS',
      ),
    ];
  }
}
