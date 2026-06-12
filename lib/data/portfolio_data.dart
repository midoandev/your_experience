import 'package:your_experience/models/main_menu.dart';
import 'package:your_experience/models/main_profile.dart';
import 'package:your_experience/models/projects_data.dart';
import 'package:your_experience/models/services_data.dart';
import 'package:your_experience/models/contacts.dart';

class PortfolioData {
  PortfolioData._();

  static List<MainMenu> getMainMenu() => [
    MainMenu(id: 'home_hero', nameTab: 'Home', widgetKey: 'home_hero'),
    MainMenu(
      id: 'services',
      nameTab: 'Services',
      description:
          'As a mobile developer, I offer a comprehensive range of services and skills, ensuring high-quality, efficient, and innovative application development. My expertise spans across various facets of mobile app creation, from design implementation to problem-solving and cross-platform development.',
      widgetKey: 'services',
    ),
    MainMenu(id: 'portfolio', nameTab: 'Portfolio', widgetKey: 'portfolio'),
    MainMenu(id: 'footer', nameTab: 'Footer', widgetKey: 'footer'),
  ];

  static MainProfile getMainProfile() {
    return MainProfile.fromJson({
      'button_iam': {'text': 'Download CV', 'url': 'www.google.com'},
      'description_iam':
          'Welcome to my official Portfolio website, explore a comprehensive collection of my projects carefully crafted using the versatile platforms Flutter and React Native.',
      'hi_iam': 'Mido',
      'iam': 'Mobile Developer',
      'image_iam': {'text': 'mido', 'url': 'assets/images/home_image.png'},
    });
  }

  static List<ProjectsData> getProjects() => [
    ProjectsData(
      id: 'callink',
      title: 'Callink',
      framework: 'Flutter',
      platforms: [
        const Platforms(
          enumPlatform: 'android',
          linkUrl:
              'https://play.google.com/store/apps/details?id=chat.callink.id',
        ),
        const Platforms(
          enumPlatform: 'ios',
          linkUrl: 'https://apps.apple.com/id/app/callink/id1551523355',
        ),
      ],
      category: 'Communication',
      imageDashboard: 'assets/images/portfolio/front_callink.jpeg',
      overview:
          '<p><strong>Callink</strong> is an app designed to simplify communication within your team. It falls into the category of <strong>team chat apps</strong>, which are designed for group communication and collaboration among colleagues.</p><ol><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span><strong>All-in-one hub:</strong> Keep messages, files, and tasks organized in one place for easy access and collaboration.</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span><strong>Chat simplicity:</strong> Enjoy a user-friendly interface for sending messages to your team.</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span><strong>Group chats:</strong> Create private or public channels for focused discussions or team announcements.</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span><strong>Voice &amp; video calls:</strong> Make voice calls or even hop on video calls for a more personal touch, all within the Callink app.</li></ol><p><strong>In short, Callink helps your team stay connected and get work done efficiently, making it a valuable tool for businesses and organizations.</strong><br></p>',
      execution:
          '<p>Execution in mobile cross-platform development involves implementing the app\'s design and functionality across various mobile platforms, such as Android and iOS.</p><p><br></p><p>- Framework Selection: Callink chose Flutter as the cross-platform framework.</p><p>- Feature Development: The Callink development team wrote code for all major features.</p><p>- Comprehensive Testing: Callink was thoroughly tested to ensure it functions correctly on all Android and iOS devices.</p><p>- App Publishing: The Callink developers published the app to the Google Play Store and App Store.</p>',
      result: '',
      timeCreated: 'June, 2 2022',
      images: List.generate(
        5,
        (index) => 'assets/images/portfolio/callink${index + 1}.jpg',
      ),
    ),
    ProjectsData(
      id: 'paketindo',
      title: 'Paketindo',
      framework: 'React Native',
      platforms: [
        const Platforms(
          enumPlatform: 'android',
          linkUrl:
              'https://play.google.com/store/apps/details?id=com.paketindo',
        ),
        const Platforms(
          enumPlatform: 'ios',
          linkUrl: 'https://apps.apple.com/id/app/paketindo/id1573115358?l=id',
        ),
      ],
      category: 'Travel',
      imageDashboard: 'assets/images/portfolio/front_paketindo.jpeg',
      overview:
          '<p><strong>Paketindo</strong> is a reliable and affordable courier service in Indonesia that offers document, package, and box delivery services nationwide.</p>',
      execution:
          '<p>Paketindo is a multi-functional app developed with a focus on efficiency and performance.</p><p>1. <strong>Feature Development</strong>: Writing code for all major features, such as delivery booking, transaction processing, and Google Maps integration.</p><p>2. <strong>App Publishing</strong>: Publishing the app to the Google Play Store and App Store.</p><p>3. <strong>Framework Selection</strong>: Choosing React Native as the cross-platform framework.</p>',
      result: '',
      timeCreated: 'February, 10 2020',
      images: List.generate(
        7,
        (index) => 'assets/images/portfolio/paketindo${index + 1}.jpg',
      ),
    ),
  ];

  static List<ServicesData> getServices() => [
    const ServicesData(
      iconName: 'design_services',
      title: 'Accurate Design Implementation',
      description:
          'I excel at accurately translating designs from Figma or similar tools into code, showcasing my expertise in design implementation and attention to visual details in the application.',
      desc:
          'Kemampuan untuk menerjemahkan desain dari Figma atau aplikasi sejenisnya ke dalam kode secara akurat, menunjukkan keahlian dalam implementasi desain dan perhatian terhadap detail visual pada aplikasi.',
    ),
    const ServicesData(
      iconName: 'touch_app',
      title: 'Clean Architecture Expertise',
      description:
          'I am experienced in using clean architecture for application development. This approach facilitates easy maintenance, feature additions, and changes within the project, while ensuring the code remains clean and scalable.',
      desc:
          'Terbiasa menggunakan clean architecture dalam pengembangan aplikasi. Pendekatan ini memudahkan perbaikan, penambahan fitur, serta perubahan dalam proyek, sambil menjaga agar kode tetap bersih dan mudah dikembangkan',
    ),
    const ServicesData(
      iconName: 'lightbulb',
      title: 'Creative Problem-Solving',
      description:
          'I have strong problem-solving skills for complex features and bring creative ideas to quickly and effectively resolve issues.',
      desc:
          'Kemampuan yang baik dalam mencari solusi untuk menyelesaikan fitur-fitur yang kompleks.',
    ),
    const ServicesData(
      iconName: 'code',
      title: 'Experience with Cross-Platform Development',
      description:
          'I have extensive experience in improving and enhancing previously developed applications, utilizing technologies such as Flutter and React Native.',
      desc:
          'Berpengalaman dalam memperbaiki dan meningkatkan aplikasi yang telah dikembangkan sebelumnya.',
    ),
  ];

  static List<Contacts> getContacts() => [
    const Contacts(
      iconName: 'github',
      name: 'midoandev',
      link: 'https://github.com/midoandev',
    ),
    const Contacts(
      iconName: 'email',
      name: 'andev.mido@gmail.com',
      link: 'mailto:andev.mido@gmail.com?subject=SendMail&body=Description',
    ),
    const Contacts(
      iconName: 'linkedin',
      name: 'agusrahmadimido',
      link: 'https://www.linkedin.com/in/agusrahmadimido',
    ),
    const Contacts(
      iconName: 'twitter',
      name: '@agusrahmadimido',
      link: 'https://www.twitter.com/agusrahmadimido',
    ),
    const Contacts(
      iconName: 'telegram',
      name: 'telegram',
      link: 'https://t.me/midosaurus',
    ),
  ];
}
