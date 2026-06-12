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
      id: 'torcons',
      title: 'Torcons',
      framework: 'Flutter',
      platforms: [],
      category: 'Productivity',
      imageDashboard: '',
      imageIcon: 'assets/images/portfolio/icon_torcons.png',
      website: 'https://torcons.app',
      overview:
          '<p><strong>Torcons</strong> is a productivity and collaboration application designed to help teams and individuals manage projects, threads, and structured discussions efficiently. The application focuses on organized communication, scalable workspace management, and real-time interaction. Users can create multiple workspaces, manage hierarchical threads, and maintain structured conversations inside each project. <strong>Key features include:</strong></p><ol><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Workspace-based project organization system</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Hierarchical thread &amp; discussion management</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Contextual actions (rename, move, delete, create new thread/project)</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Real-time state updates with reactive UI</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Speech-to-text input with interactive microphone animation</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Multi-platform support (Android &amp; iOS)</li></ol>',
      execution:
          '<p>The development of Torcons was built with a scalable Flutter architecture emphasizing separation of concerns between data models and UI components. Riverpod and StateNotifier were implemented to ensure reactive and maintainable state management across complex hierarchical structures such as workspaces and threads. The sidebar navigation system was built using a model-driven approach to maintain clean architecture and extensibility. <strong>Key technical implementations include:</strong></p><ol><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Model-driven sidebar architecture (SidebarItemModel &amp; ItemSideBar)</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Riverpod + StateNotifier for reactive dashboard state management</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Speech-to-Text integration with stable error &amp; cancel handling</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Buffered Text-to-Speech streaming playback system</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Feature-based folder structure for scalability</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>CI/CD automation for streamlined build &amp; deployment</li></ol>',
      result: '',
      timeCreated: 'June, 1 2024',
      images: List.generate(
        6,
        (index) => 'assets/images/portfolio/torcons${index + 1}.png',
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
              'https://play.google.com/store/apps/details?id=com.badjetin.app',
        ),
      ],
      category: 'Finance',
      imageDashboard: '',
      imageIcon: 'assets/images/portfolio/icon_badjetin.png',
      website: 'https://badjetin.app',
      overview:
          '<p><strong>Badjetin</strong> is a couple &amp; family finance tracker application designed to simplify daily financial management for young families. The app focuses on transparency, collaboration, and structured budgeting between partners. Users can record income and expenses in real-time, organize finances into workspaces, and discuss transactions through threaded conversations. <strong>Key features include:</strong></p><ol><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Real-time income &amp; expense tracking</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Workspace-based collaborative finance system</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Threaded discussion per transaction</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Multi-language support</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Google &amp; Apple authentication</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Clean and modern user interface</li></ol>',
      execution:
          '<p>The development of Badjetin followed a scalable and maintainable architecture using Flutter and Riverpod for state management. The application was structured with separation between model and UI components to ensure long-term maintainability. CI/CD automation was implemented using GitHub Actions to streamline build and deployment processes for both Android and iOS platforms. <strong>Key technical implementations include:</strong></p><ol><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Riverpod-based reactive state management for scalable architecture</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Modular feature-based folder structure</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Map-based localization system implementation</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Secure authentication integration (Google &amp; Apple Sign-In)</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Automated CI/CD pipeline for build and deployment</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Production-ready release to Play Store and TestFlight</li></ol>',
      result: '',
      timeCreated: 'January, 1 2024',
      images: List.generate(
        6,
        (index) => 'assets/images/portfolio/badjetin${index + 1}.png',
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
          '<p><strong>AI Care</strong> is a health application designed to help users analyze their symptoms through interaction with Katherine, the app\'s artificial intelligence. The app provides a feature for self-diagnosis and offers teleconsultation services to enhance user healthcare experience. It includes real-time updates on health conditions and personalized recommendations based on user input. <strong>Key features include:</strong></p><ol><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Symptom analysis using AI</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Teleconsultation improvements</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Profile management capabilities</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>Enhanced data privacy and security</li></ol>',
      execution:
          '<p>The execution of the AI Care application involved a comprehensive and meticulous approach to ensure a seamless user experience in healthcare. The project began with extensive requirement gathering, involving consultations with healthcare professionals and potential users to define essential features. A thorough feasibility study was conducted to assess the technical and financial viability, leading to the development of a detailed project plan covering scope, timeline, resources, risk management, and quality assurance. <strong>Key features in the AI Care app include:</strong></p><ol><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>The AI Care app employs an advanced expert system to analyze patient symptoms. Users can input their symptoms, and the system will provide medical analysis and recommendations based on the available data.</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>This feature allows users to speak directly into the app, which then converts their speech into text. This makes it easier for users to input symptoms or medical information without needing to type.</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>With the text-to-speech feature, the app can read the text displayed on the screen aloud to the user. This is particularly useful for users who have difficulty reading or prefer listening to information.</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>AI Care supports various local languages, enabling users to select the language they are most comfortable with. This feature ensures that the app is accessible and usable by people from different linguistic backgrounds.</li></ol>',
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
      imageIcon: 'assets/images/portfolio/icon_paketindo.png',
      website: '',
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
      name: 'andev.mido@gmail.com',
      link: 'mailto:andev.mido@gmail.com?subject=SendMail&body=Description',
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
