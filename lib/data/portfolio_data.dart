import 'package:your_experience/data/projects_content.dart';
import 'package:your_experience/models/contacts.dart';
import 'package:your_experience/models/experience_item.dart';
import 'package:your_experience/models/main_menu.dart';
import 'package:your_experience/models/projects_data.dart';
import 'package:your_experience/models/service_item.dart';

/// All site content. Career facts follow the version confirmed on
/// 2026-11-25 and used on LinkedIn: "since 2018", no year counts.
class PortfolioData {
  PortfolioData._();

  /// Home page sections linked from the nav, in scroll order. Labels are
  /// localized in the view by [MainMenu.widgetKey].
  static List<MainMenu> getMainMenu() => const [
    MainMenu(id: 'work', nameTab: 'Work', widgetKey: 'work'),
    MainMenu(id: 'now', nameTab: 'Now', widgetKey: 'now'),
    MainMenu(id: 'services', nameTab: 'Services', widgetKey: 'services'),
    MainMenu(id: 'about', nameTab: 'About', widgetKey: 'about'),
  ];

  /// Every case study, in page order (generated from products.json).
  static List<ProjectsData> getProjects() => projectsContent;

  static List<ProjectsData> getCurrentProjects() =>
      projectsContent.where((p) => p.isCurrent).toList();

  /// Earlier work for the grid, in the order of the home page.
  static List<ProjectsData> getPastProjects() {
    const order = ['torcons', 'aicare', 'tjar', 'badjetin', 'callink', 'paketindo'];
    return [
      for (final id in order) projectsContent.firstWhere((p) => p.id == id),
    ];
  }

  static ProjectsData? getProjectById(String id) {
    for (final p in projectsContent) {
      if (p.id == id) return p;
    }
    return null;
  }

  static List<ExperienceItem> getExperience() => const [
    ExperienceItem(
      company: 'Werkudara Group',
      detail:
          'IT Specialist, AI enablement and automation, in the Center of '
          'Excellence team. Contract.',
      period: 'Oct 2026 to now',
    ),
    ExperienceItem(
      company: 'Digital Sekuriti Indonesia',
      detail:
          'Mobile developer: Flutter apps for AI chat, calls and '
          'telemedicine, and mentoring junior developers.',
      period: '2022 to 2026',
    ),
    ExperienceItem(
      company: 'Tajar Al-Mestakbel',
      detail:
          'Flutter developer for Tjar, a remote contract, in Arabic and '
          'English.',
      period: 'Jun to Aug 2024',
    ),
    ExperienceItem(
      company: 'Imkom Academy',
      detail:
          'Android developer and technical instructor; Android apps, later '
          'React Native.',
      period: '2018 to 2022',
    ),
  ];

  static List<ServiceItem> getServices() => const [
    ServiceItem(
      title: 'A new mobile app',
      detail: 'Figma to Flutter, released to both stores.',
      tools: 'Flutter',
    ),
    ServiceItem(
      title: 'An app you already have',
      detail: "Refactor and keep it shipping, with Kotlin where Flutter can't reach.",
      tools: 'Flutter, Kotlin',
    ),
    ServiceItem(
      title: 'Web systems for a team',
      detail: 'Plan, mockup, prototype, build and upkeep, as with Journey.',
      tools: 'Next.js, Supabase',
    ),
    ServiceItem(
      title: 'Automation and AI agents',
      detail: 'Flows that move email, reports and data without a person.',
      tools: 'n8n, Claude',
    ),
  ];

  /// Tools on the About section, as names of files in assets/vector/tools/.
  static const List<String> aboutTools = [
    'Flutter', 'Dart', 'React Native', 'Kotlin', 'Firebase', 'Supabase',
    'Next.js', 'n8n', 'Claude', 'Figma',
  ];

  static const String servicesPicture = 'assets/images/portfolio/side_mix.webp';
  static const double servicesPictureRatio = 1400 / 1500;

  static List<Contacts> getContacts() => const [
    Contacts(
      iconName: 'github',
      name: 'midoandev',
      link: 'https://github.com/midoandev',
    ),
    Contacts(
      iconName: 'email',
      name: 'agusrahmadimido@gmail.com',
      link: 'mailto:agusrahmadimido@gmail.com',
    ),
    Contacts(
      iconName: 'linkedin',
      name: 'agusrahmadimido',
      link: 'https://www.linkedin.com/in/agusrahmadimido',
    ),
  ];

  static const String name = 'Agus Rakhmadi Mido';
  static const String email = 'agusrahmadimido@gmail.com';
  static const String mailto = 'mailto:agusrahmadimido@gmail.com';

  /// Standing portrait (work history) and seated portrait (about).
  static const String portraitImage = 'assets/images/profile/portrait.webp';
  static const String sitImage = 'assets/images/profile/sit.webp';
}
