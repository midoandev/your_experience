import 'package:your_experience/models/contacts.dart';
import 'package:your_experience/models/main_menu.dart';
import 'package:your_experience/models/main_profile.dart';
import 'package:your_experience/models/projects_data.dart';
import 'package:your_experience/models/services_data.dart';
import 'package:your_experience/models/tech_group.dart';

class PortfolioData {
  PortfolioData._();

  /// Home page sections, in scroll order. Labels are localized in the view
  /// by [MainMenu.widgetKey].
  static List<MainMenu> getMainMenu() => const [
    MainMenu(id: 'work', nameTab: 'Work', widgetKey: 'work'),
    MainMenu(id: 'about', nameTab: 'About', widgetKey: 'about'),
    MainMenu(id: 'approach', nameTab: 'Approach', widgetKey: 'approach'),
    MainMenu(id: 'stack', nameTab: 'Stack', widgetKey: 'stack'),
    MainMenu(id: 'contact', nameTab: 'Contact', widgetKey: 'contact'),
  ];

  static MainProfile getMainProfile() {
    return MainProfile.fromJson({
      'button_iam': {'text': 'Download CV', 'url': 'assets/cv/cv.html'},
      'description_iam':
          "I've spent 7+ years building mobile apps with Flutter, React "
          'Native and Android Native. Most of that work runs in production: '
          'AI chat, fintech, telemedicine, e-commerce and real-time calling.'
          '\n\n'
          'I like owning the whole path, from turning a Figma file into '
          'screens to setting up CI/CD and publishing on Google Play and the '
          'App Store. Badjetin is my own product: I designed, built and '
          'published it, and I still ship updates.',
      'hi_iam': 'Agus Rakhmadi Mido',
      'iam': 'Mobile Application Developer',
      'image_iam': {'text': 'mido', 'url': 'assets/images/profile/avatar.webp'},
    });
  }

  static List<ProjectsData> getProjects() => [
    ProjectsData(
      id: 'torcons',
      title: 'Torcons',
      framework: 'Flutter',
      installs: '1K+',
      rating: '4.4',
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
      imageIcon: 'assets/images/portfolio/icon_torcons.webp',
      website: 'https://torcons.app',
      overview:
          'Torcons is an AI-powered chat platform conceived, architected, and shipped in ~1 month from design mockups and an existing web reference (Open WebUI). Supports Google, Apple, and Meta OAuth with real-time AI streaming. Later refactored into a modular monorepo (Melos + Riverpod) and extended with a Notion-like notes feature (Torcons Note) sharing the same modules. Key highlights:\n'
          '- AI-powered chat with real-time streaming\n'
          '- Multi-OAuth (Google, Apple, Meta)\n'
          '- Modular monorepo architecture (Melos + Riverpod)\n'
          '- Speech-to-Text and Text-to-Speech integration\n'
          '- Concurrent workspace and thread management\n'
          '- CI/CD pipeline for Play Store and App Store',
      execution:
          'Lead mobile developer for Torcons responsible for the full lifecycle from interpreting UI/UX designs and architecting the codebase to deployment and store publishing. Built with a scalable Flutter architecture emphasizing separation of concerns between data models and UI components. Riverpod was implemented to ensure reactive and maintainable state management across complex hierarchical structures such as workspaces and threads. The sidebar navigation system was built using a model-driven approach. Key technical implementations:\n'
          '- Model-driven sidebar architecture (SidebarItemModel and ItemSideBar)\n'
          '- Riverpod + Notifier for reactive state management\n'
          '- Speech-to-Text and buffered TTS streaming playback\n'
          '- Modular monorepo (Melos) enabling code sharing across apps\n'
          '- CI/CD automation for streamlined build and deployment',
      result: '',
      timeCreated: 'June, 1 2024',
      images: List.generate(
        5,
        (index) => 'assets/images/portfolio/torcons_${index + 1}.webp',
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
          linkUrl: 'https://app.badjetin.my.id',
        ),
      ],
      category: 'Finance',
      imageDashboard: 'assets/images/portfolio/front_badjetin.webp',
      // Card shows the product UI; the detail page uses the feature graphic.
      preferScreensThumb: true,
      imageIcon: 'assets/images/portfolio/icon_badjetin.webp',
      website: 'https://badjetin.my.id/en/',
      overview:
          'Badjetin is my own money app for individuals and couples. Log '
          'income and spending, keep budgets on track, and follow bills, '
          'savings goals and debts. Couples sign in with one account on both '
          'phones and the data stays in sync, even offline.\n'
          '- Log an expense, income or transfer in seconds, or scan a receipt on Android\n'
          '- Budgets per category showing what is spent and what is left\n'
          '- Bill reminders, savings goals, debts and loans, shopping list\n'
          '- Offline-first sync across devices with Firestore\n'
          '- Light and dark mode, Indonesian and English, Android and web',
      execution:
          'Solo project from idea to Google Play: product and UI design, a '
          'custom warm design system, Flutter with Clean Architecture, a '
          'Firebase backend and a release pipeline triggered by git tags. '
          'Version 1.1.0 added bills, savings goals and on-device receipt '
          'scanning.\n'
          '- Clean Architecture (domain, infrastructure, presentation) with GetX and flutter_hooks\n'
          '- Firestore sync with offline support and full re-sync\n'
          '- On-device receipt scanning on Android\n'
          '- freezed and json_serializable models, dartz Either for errors\n'
          '- GitHub Actions release on every version tag',
      result: '',
      timeCreated: 'January, 1 2024',
      images: List.generate(
        8,
        (index) => 'assets/images/portfolio/badjetin_${index + 1}.webp',
      ),
    ),
    ProjectsData(
      id: 'aicare',
      title: 'AI Care',
      framework: 'Flutter',
      installs: '5K+',
      rating: '4.6',
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
      imageDashboard: 'assets/images/portfolio/front_aicare.webp',
      imageIcon: 'assets/images/portfolio/icon_aicare.webp',
      website: '',
      overview:
          'AI Care is a telemedicine platform that helps users analyze symptoms through AI interaction and offers teleconsultation services. The app provides self-diagnosis features, real-time health updates, and personalized recommendations. Contributed two major feature areas: (1) expert-system diagnosis engine (later refactored to use AI directly), and (2) payment integration via Xendit gateway. Also worked on push notifications and speech-to-text.\n'
          '- AI-powered symptom analysis and self-diagnosis\n'
          '- Teleconsultation with healthcare professionals\n'
          '- Xendit payment gateway integration\n'
          '- Speech-to-Text and Text-to-Speech features\n'
          '- Multi-language support and data privacy',
      execution:
          'Contributed to AI Care — a comprehensive telemedicine platform — working on two major feature areas: the expert-system diagnosis engine and payment integration via Xendit. The diagnosis engine was later refactored to leverage AI directly for more accurate symptom analysis. Also implemented push notifications and speech-to-text functionality for enhanced user accessibility.\n'
          '- Expert-system symptom analysis engine\n'
          '- Xendit payment gateway integration\n'
          '- Push notification system\n'
          '- Speech-to-Text feature implementation\n'
          '- Data privacy and security compliance',
      result: '',
      timeCreated: 'May, 1 2023',
      // Google Play listing screenshots (fetched Nov 2026).
      images: List.generate(
        7,
        (index) => 'assets/images/portfolio/aicare_${index + 1}.webp',
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
      imageDashboard: 'assets/images/portfolio/front_callink.webp',
      imageIcon: 'assets/images/portfolio/icon_callink.webp',
      website: '',
      overview:
          'Callink is a real-time VoIP and messaging platform — built and evolved across three tech generations: React Native → Flutter → native module (Kotlin Jetpack Compose, VIPER). Features WebRTC-based voice/video calls, group chat, and an all-in-one hub for team communication. Key highlights:\n'
          '- WebRTC-based real-time voice and video calls\n'
          '- Three-generation tech evolution: RN → Flutter → Native\n'
          '- Android Native companion app for incoming call screens\n'
          '- Offline-first with local caching and data sync\n'
          '- Private and public group channels',
      execution:
          'Built and evolved Callink across three technology generations to adapt to changing requirements and platform capabilities. Started with React Native for rapid prototyping, then migrated to Flutter for better cross-platform consistency. Later extended with a native Kotlin Jetpack Compose module (VIPER architecture) for the VoIP engine, and a companion Android Native app handling incoming call screens via push notification triggers — a Flutter limitation at the time.\n'
          '- WebRTC engine implementation in Flutter and Android Native\n'
          '- Push-triggered incoming call screen (Android Native)\n'
          '- Offline experience with local caching and data synchronisation\n'
          '- iOS and Android app store publishing and maintenance',
      result: '',
      timeCreated: 'June, 2 2022',
      images: List.generate(
        6,
        (index) => 'assets/images/portfolio/callink${index + 1}.webp',
      ),
    ),
    ProjectsData(
      id: 'paketindo',
      title: 'Paketindo',
      framework: 'React Native',
      platforms: [],
      category: 'Travel & Logistics',
      imageDashboard: 'assets/images/portfolio/front_paketindo.webp',
      imageIcon: 'assets/images/portfolio/icon_paketindo.webp',
      isAbandoned: true,
      website: '',
      overview:
          'Paketindo is a courier and logistics platform serving Indonesia — offering document, package, and box delivery services nationwide. Migrated from Android Native to React Native, building both user and driver apps with real-time tracking.\n'
          '- Real-time package tracking with Google Maps\n'
          '- Driver location streaming via SSE\n'
          '- Geofencing and OCR document scanning\n'
          '- User and driver dual-app architecture',
      execution:
          'Led the migration from Android Native (Java) to React Native, expanding the app\'s reach to iOS. Built separate user and driver applications with real-time communication via SSE (Server-Sent Events) for live driver location tracking on Google Maps. Implemented geofencing for delivery zone management and OCR for document scanning.\n'
          '- Android Native to React Native migration\n'
          '- SSE-based real-time driver location streaming\n'
          '- Google Maps API integration and geofencing\n'
          '- OCR document scanning feature\n'
          '- Dual-app architecture (user and driver)',
      result: '',
      timeCreated: 'February, 10 2020',
      images: List.generate(
        6,
        (index) => 'assets/images/portfolio/paketindo${index + 1}.webp',
      ),
    ),
    ProjectsData(
      id: 'tjar',
      title: 'Tjar',
      framework: 'Flutter',
      installs: '1K+',
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
      imageIcon: 'assets/images/portfolio/icon_tjar.webp',
      website: '',
      overview:
          'Tjar is a full e-commerce marketplace ecosystem serving the Middle Eastern market — with separate customer and merchant apps. Collaborated remotely with an international team at Tajar Al-Mestakbel (Saudi Arabia) to deliver and maintain the platform.\n'
          '- Arabic RTL localization for Middle Eastern market\n'
          '- Order management and real-time order tracking\n'
          '- Analytics and reporting integration\n'
          '- Refactored app architecture for maintainability',
      execution:
          'Collaborated remotely with an international team at Tajar Al-Mestakbel (Saudi Arabia) to deliver and maintain Tjar — an e-commerce marketplace for the Saudi Arabian market. Refactored the app architecture for long-term maintainability and scalability. Implemented Arabic RTL localization, analytics, order management, and real-time order tracking. Managed release preparation and deployment for both Android and iOS.\n'
          '- Full marketplace for customers and merchants\n'
          '- Arabic RTL localization implementation\n'
          '- Real-time order tracking system\n'
          '- Play Store and App Store deployment',
      result: '',
      timeCreated: 'August, 1 2024',
      // Google Play listing screenshots (fetched Nov 2026).
      images: List.generate(
        6,
        (index) => 'assets/images/portfolio/tjar_${index + 1}.webp',
      ),
    ),
  ];

  /// "How I work" — the approach cards on the home page.
  static List<ServicesData> getServices() => const [
    ServicesData(
      iconName: 'design_services',
      title: 'Designs built as drawn',
      description:
          'Figma files turned into Flutter screens with matching spacing, '
          'type and motion, checked on small and large phones.',
    ),
    ServicesData(
      iconName: 'architecture',
      title: 'Code the next developer can read',
      description:
          'Feature modules and clear layers with Riverpod, BLoC or GetX, so '
          'changes stay small and testable.',
    ),
    ServicesData(
      iconName: 'devices',
      title: 'One codebase where it fits',
      description:
          'Flutter or React Native for most products, and native Kotlin when '
          "a feature needs it, like Callink's incoming-call screen.",
    ),
    ServicesData(
      iconName: 'rocket',
      title: 'Through release and after',
      description:
          'CI/CD with Fastlane and GitHub Actions, store listings and review, '
          'then updates after launch.',
    ),
  ];

  /// Product domains shipped to production.
  static List<String> getDomains() => const [
    'AI Chat',
    'Fintech',
    'Telemedicine',
    'E-Commerce',
    'Real-time',
  ];

  /// Tools grouped by role.
  static List<TechGroup> getTechStack() => const [
    TechGroup(
      iconName: 'devices',
      title: 'Mobile',
      items: ['Flutter', 'Dart', 'React Native', 'Kotlin', 'Jetpack Compose'],
    ),
    TechGroup(
      iconName: 'architecture',
      title: 'Architecture & State',
      items: ['Riverpod', 'BLoC', 'Clean Architecture', 'MVVM', 'GoRouter'],
    ),
    TechGroup(
      iconName: 'cloud',
      title: 'Backend & Realtime',
      items: ['Firebase', 'Supabase', 'REST', 'WebSocket', 'WebRTC'],
    ),
    TechGroup(
      iconName: 'rocket',
      title: 'Delivery',
      items: ['Melos', 'Fastlane', 'GitHub Actions', 'Crashlytics'],
    ),
  ];

  static ProjectsData? getProjectById(String id) {
    for (final p in getProjects()) {
      if (p.id == id) return p;
    }
    return null;
  }

  static const String email = 'agusrahmadimido@gmail.com';

  /// Candid studio portrait used in the hero (2:3).
  static const String portraitImage = 'assets/images/profile/portrait.webp';

  static const int yearsExperience = 7;

  /// When the Google Play installs/ratings in [getProjects] were read.
  static const String storeStatsAsOf = 'Nov 2026';

  static List<Contacts> getContacts() => [
    const Contacts(
      iconName: 'github',
      name: 'midoandev',
      link: 'https://github.com/midoandev',
    ),
    const Contacts(
      iconName: 'email',
      name: 'agusrahmadimido@gmail.com',
      link: 'mailto:agusrahmadimido@gmail.com',
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
