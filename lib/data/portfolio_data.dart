import 'package:your_experience/models/contacts.dart';
import 'package:your_experience/models/main_menu.dart';
import 'package:your_experience/models/main_profile.dart';
import 'package:your_experience/models/projects_data.dart';
import 'package:your_experience/models/services_data.dart';

class PortfolioData {
  PortfolioData._();

  static List<MainMenu> getMainMenu() => [
    MainMenu(id: 'home_hero', nameTab: 'Home', widgetKey: 'home_hero'),
    MainMenu(
      id: 'services',
      nameTab: 'Services',
      description:
          'Mobile Developer with 7+ years of experience shipping cross-platform '
          'applications to Play Store and App Store across AI chat systems, '
          'fintech, telemedicine, e-commerce, and real-time communication '
          'platforms. Proficient in Flutter, Riverpod, BLoC, React Native, '
          'Android Native, and CI/CD automation.',
      widgetKey: 'services',
    ),
    MainMenu(id: 'portfolio', nameTab: 'Portfolio', widgetKey: 'portfolio'),
    MainMenu(id: 'footer', nameTab: 'Footer', widgetKey: 'footer'),
  ];

  static MainProfile getMainProfile() {
    return MainProfile.fromJson({
      'button_iam': {'text': 'Download CV', 'url': 'assets/cv/cv.html'},
      'description_iam':
          'Mobile Developer with 7+ years of experience shipping cross-platform applications (Flutter, React Native, Android Native) to Play Store and App Store across AI chat systems, fintech, telemedicine, e-commerce, and real-time communication platforms.',
      'hi_iam': 'Agus Rakhmadi Mido',
      'iam': 'Mobile Application Developer',
      'image_iam': {'text': 'mido', 'url': 'assets/images/home_image.png'},
    });
  }

  static List<ProjectsData> getProjects() => [
    ProjectsData(
      id: 'torcons',
      title: 'Torcons',
      framework: 'Flutter',
      platforms: [
        const Platforms(
          enumPlatform: 'android',
          linkUrl:
              'https://play.google.com/store/apps/details?id=ai.torcons.chat',
        ),
        const Platforms(
          enumPlatform: 'ios',
          linkUrl: 'https://apps.apple.com/id/app/torcons/id6771310514',
        ),
      ],
      category: 'AI Chat',
      imageDashboard: '',
      imageIcon: 'assets/images/portfolio/icon_torcons.png',
      website: 'https://torcons.app',
      overview:
          '<p><strong>Torcons</strong> is an AI-powered chat platform — conceived, architected, and shipped in ~1 month from design mockups and an existing web reference (Open WebUI). Supports Google, Apple, and Meta OAuth with real-time AI streaming. Later refactored into a modular monorepo (Melos + Riverpod) and extended with a Notion-like notes feature (Torcons Note) sharing the same modules. <strong>Key highlights:</strong></p><ol><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>AI-powered chat with real-time streaming</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Multi-OAuth (Google, Apple, Meta)</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Modular monorepo architecture (Melos + Riverpod)</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Speech-to-Text &amp; Text-to-Speech integration</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Concurrent workspace &amp; thread management</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>CI/CD pipeline for Play Store &amp; App Store</li></ol>',
      execution:
          '<p>Lead mobile developer for Torcons — responsible for the full lifecycle from interpreting UI/UX designs and architecting the codebase to deployment and store publishing. Built with a scalable Flutter architecture emphasizing separation of concerns between data models and UI components. Riverpod was implemented to ensure reactive and maintainable state management across complex hierarchical structures such as workspaces and threads. The sidebar navigation system was built using a model-driven approach. <strong>Key technical implementations:</strong></p><ol><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Model-driven sidebar architecture (SidebarItemModel &amp; ItemSideBar)</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Riverpod + Notifier for reactive state management</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Speech-to-Text &amp; buffered TTS streaming playback</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Modular monorepo (Melos) enabling code sharing across apps</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>CI/CD automation for streamlined build &amp; deployment</li></ol>',
      result: '',
      timeCreated: 'June, 1 2024',
      images: List.generate(
        5,
        (index) => 'assets/images/portfolio/torcons_${index + 1}.png',
      ),
    ),
    ProjectsData(
      id: 'badjetin',
      title: 'Badjetin',
      framework: 'Flutter',
      platforms: [
        const Platforms(
          enumPlatform: 'android',
          linkUrl:
              'https://play.google.com/store/apps/details?id=id.mido.badjetin&hl=id',
        ),
        const Platforms(
          enumPlatform: 'web',
          linkUrl: 'https://badjetin.web.id/dashbboard',
        ),
      ],
      category: 'Finance',
      imageDashboard: 'assets/images/portfolio/front_badjetin.png',
      imageIcon: 'assets/images/portfolio/icon_badjetin.png',
      website: 'https://badjetin.app',
      overview:
          '<p><strong>Badjetin</strong> is a collaborative couple &amp; family finance tracker — personal project covering the full lifecycle from concept through CI/CD and store publishing. Built with real-time Firebase sync for shared budgeting between partners. <strong>Key features include:</strong></p><ol><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Real-time income &amp; expense tracking with Firebase sync</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Workspace-based collaborative finance system</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Threaded discussion per transaction</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Multi-language support</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Google &amp; Apple authentication</li></ol>',
      execution:
          '<p>Full personal project — from concept design through CI/CD automation (GitHub Actions) and store publishing. Built with Flutter + Riverpod for scalable state management and Firebase (Firestore, Auth, Analytics, Crashlytics) for the backend. Structured with separation between model and UI components for maintainability. <strong>Key implementations:</strong></p><ol><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Riverpod-based reactive state management</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Firebase real-time sync for collaborative finance</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Map-based localization system</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Google &amp; Apple Sign-In authentication</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Automated CI/CD pipeline (GitHub Actions)</li></ol>',
      result: '',
      timeCreated: 'January, 1 2024',
      images: List.generate(
        6,
        (index) => 'assets/images/portfolio/badjetin_${index + 1}.jpg',
      ),
    ),
    ProjectsData(
      id: 'aicare',
      title: 'AI Care',
      framework: 'Flutter',
      platforms: [
        const Platforms(
          enumPlatform: 'android',
          linkUrl:
              'https://play.google.com/store/apps/details?id=net.atmatech.hcp',
        ),
        const Platforms(
          enumPlatform: 'ios',
          linkUrl: 'https://apps.apple.com/id/app/ai-care/id1545122059',
        ),
      ],
      category: 'Medical',
      imageDashboard: 'assets/images/portfolio/front_aicare.png',
      imageIcon: 'assets/images/portfolio/icon_aicare.png',
      website: '',
      overview:
          '<p><strong>AI Care</strong> is a telemedicine platform that helps users analyze symptoms through AI interaction and offers teleconsultation services. The app provides self-diagnosis features, real-time health updates, and personalized recommendations. Contributed two major feature areas: (1) expert-system diagnosis engine (later refactored to use AI directly), and (2) payment integration via Xendit gateway. Also worked on push notifications and speech-to-text.</p><ol><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>AI-powered symptom analysis &amp; self-diagnosis</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Teleconsultation with healthcare professionals</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Xendit payment gateway integration</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Speech-to-Text &amp; Text-to-Speech features</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Multi-language support &amp; data privacy</li></ol>',
      execution:
          '<p>Contributed to AI Care — a comprehensive telemedicine platform — working on two major feature areas: the expert-system diagnosis engine and payment integration via Xendit. The diagnosis engine was later refactored to leverage AI directly for more accurate symptom analysis. Also implemented push notifications and speech-to-text functionality for enhanced user accessibility.</p><ol><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Expert-system symptom analysis engine</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Xendit payment gateway integration</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Push notification system</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Speech-to-Text feature implementation</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Data privacy &amp; security compliance</li></ol>',
      result: '',
      timeCreated: 'May, 1 2023',
      images: List.generate(
        6,
        (index) => 'assets/images/portfolio/aicare${index + 1}.png',
      ),
    ),
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
      imageIcon: 'assets/images/portfolio/icon_callink.png',
      website: '',
      overview:
          '<p><strong>Callink</strong> is a real-time VoIP &amp; messaging platform — built and evolved across three tech generations: React Native → Flutter → native module (Kotlin Jetpack Compose, VIPER). Features WebRTC-based voice/video calls, group chat, and an all-in-one hub for team communication. <strong>Key highlights:</strong></p><ol><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>WebRTC-based real-time voice &amp; video calls</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Three-generation tech evolution: RN → Flutter → Native</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Android Native companion app for incoming call screens</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Offline-first with local caching &amp; data sync</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Private &amp; public group channels</li></ol>',
      execution:
          '<p>Built and evolved Callink across three technology generations to adapt to changing requirements and platform capabilities. Started with React Native for rapid prototyping, then migrated to Flutter for better cross-platform consistency. Later extended with a native Kotlin Jetpack Compose module (VIPER architecture) for the VoIP engine, and a companion Android Native app handling incoming call screens via push notification triggers — a Flutter limitation at the time.</p><ol><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>WebRTC engine implementation in Flutter &amp; Android Native</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Push-triggered incoming call screen (Android Native)</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Offline experience with local caching &amp; data synchronisation</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>iOS &amp; Android app store publishing &amp; maintenance</li></ol>',
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
      platforms: [],
      category: 'Travel & Logistics',
      imageDashboard: 'assets/images/portfolio/front_paketindo.jpeg',
      imageIcon: 'assets/images/portfolio/icon_paketindo.png',
      website: '',
      overview:
          '<p><strong>Paketindo</strong> is a courier and logistics platform serving Indonesia — offering document, package, and box delivery services nationwide. Migrated from Android Native to React Native, building both user and driver apps with real-time tracking.</p><p><strong>[ABANDONED]</strong> — This application is no longer maintained. Both Play Store and App Store listings have been taken down.</p><ol><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Real-time package tracking with Google Maps</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Driver location streaming via SSE</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Geofencing &amp; OCR document scanning</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>User &amp; driver dual-app architecture</li></ol>',
      execution:
          '<p>Led the migration from Android Native (Java) to React Native, expanding the app\'s reach to iOS. Built separate user and driver applications with real-time communication via SSE (Server-Sent Events) for live driver location tracking on Google Maps. Implemented geofencing for delivery zone management and OCR for document scanning.</p><ol><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Android Native to React Native migration</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>SSE-based real-time driver location streaming</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Google Maps API integration &amp; geofencing</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>OCR document scanning feature</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Dual-app architecture (user &amp; driver)</li></ol>',
      result: '',
      timeCreated: 'February, 10 2020',
      images: List.generate(
        7,
        (index) => 'assets/images/portfolio/paketindo${index + 1}.jpg',
      ),
    ),
    ProjectsData(
      id: 'tjar',
      title: 'Tjar',
      framework: 'Flutter',
      platforms: [
        const Platforms(
          enumPlatform: 'android',
          linkUrl:
              'https://play.google.com/store/apps/details?id=com.tjar.tjar_app',
        ),
        const Platforms(
          enumPlatform: 'ios',
          linkUrl:
              'https://apps.apple.com/id/app/tjar-%D8%AA%D8%AC%D8%A7%D8%B1/id6511244018',
        ),
      ],
      category: 'E-Commerce',
      imageDashboard: '',
      imageIcon: '',
      website: '',
      overview:
          '<p><strong>Tjar</strong> is a full e-commerce marketplace ecosystem serving the Middle Eastern market — with separate customer and merchant apps. Collaborated remotely with an international team at Tajar Al-Mestakbel (Saudi Arabia) to deliver and maintain the platform.</p><ol><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Arabic RTL localization for Middle Eastern market</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Order management &amp; real-time order tracking</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Analytics &amp; reporting integration</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Refactored app architecture for maintainability</li></ol>',
      execution:
          '<p>Collaborated remotely with an international team at Tajar Al-Mestakbel (Saudi Arabia) to deliver and maintain Tjar — an e-commerce marketplace for the Saudi Arabian market. Refactored the app architecture for long-term maintainability and scalability. Implemented Arabic RTL localization, analytics, order management, and real-time order tracking. Managed release preparation and deployment for both Android and iOS.</p><ol><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Full marketplace for customers &amp; merchants</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Arabic RTL localization implementation</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Real-time order tracking system</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Play Store &amp; App Store deployment</li></ol>',
      result: '',
      timeCreated: 'August, 1 2024',
      images: [],
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
          'I have strong problem-solving skills for complex features and bring creative ideas to quickly and effectively resolve issues. My approach combines technical expertise with innovative thinking, ensuring high-quality results consistently.',
      desc:
          'Kemampuan yang baik dalam mencari solusi untuk menyelesaikan fitur-fitur yang kompleks. Saya juga memiliki ide yang kreatif untuk memecahkan masalah dengan cara yang cepat dan efektif',
    ),
    const ServicesData(
      iconName: 'code',
      title: 'Experience with Cross-Platform Development',
      description:
          'I have extensive experience in improving and enhancing previously developed applications, utilizing technologies such as Flutter and React Native to build smooth and efficient apps for both Android and iOS platforms.',
      desc:
          'Berpengalaman dalam memperbaiki dan meningkatkan aplikasi yang telah dikembangkan sebelumnya, dengan menggunakan teknologi Flutter dan React Native untuk membangun aplikasi yang berjalan lancar di platform Android dan iOS',
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
      name: 'agusrahmadimido@gmail.com',
      link:
          'mailto:agusrahmadimido@gmail.com?subject=SendMail&body=Description',
    ),
    const Contacts(
      iconName: 'linkedin',
      name: 'agusrahmadimido',
      link: 'https://www.linkedin.com/in/agusrahmadimido',
    ),
    // Contacts(
    //   iconName: 'twitter',
    //   name: '@agusrahmadimido',
    //   link: 'https://www.twitter.com/agusrahmadimido',
    // ),
    // Contacts(
    //   iconName: 'telegram',
    //   name: 'telegram',
    //   link: 'https://t.me/midosaurus',
    // ),
  ];
}
