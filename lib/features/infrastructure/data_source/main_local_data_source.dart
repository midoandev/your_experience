import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_experience/features/domain/entities/main_menu.dart';
import 'package:your_experience/features/domain/entities/main_profile.dart';
import 'package:your_experience/utility/shared/constants/date_time_helper.dart';

import '../../domain/entities/contacts.dart';
import '../../domain/entities/projects_data.dart';
import '../../domain/entities/services_data.dart';
import '../../presentation/footer/footer_ui.dart';
import '../../presentation/home/home_page/home_page_ui.dart';
import '../../presentation/home/portfolio/portfolio_ui.dart';
import '../../presentation/home/services/services_ui.dart';

class MainLocalDataSource {
  MainLocalDataSource();

  List<Contacts> getContacts() {
    return [
      Contacts(
          name: 'midoandev',
          icon: FontAwesomeIcons.github,
          link: 'https://github.com/midoandev'),
      Contacts(
          name: 'andev.mido@gmail.com',
          icon: Icons.mail_outlined,
          link:
              'mailto:andev.mido@gmail.com?subject=SendMail&body=Description'),
      Contacts(
          name: 'agusrahmadimido',
          icon: FontAwesomeIcons.linkedinIn,
          link: 'https://www.linkedin.com/in/agusrahmadimido'),
      Contacts(
          name: '@agusrahmadimido',
          icon: FontAwesomeIcons.twitter,
          link: 'https://www.twitter.com/agusrahmadimido'),
      Contacts(
          name: 'telegram',
          icon: FontAwesomeIcons.telegram,
          link: 'https://t.me/midosaurus'),
    ];
  }

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

//   {name: 'Paketindo', desc: '', path: require('../assets/paketindo.png'), and: 'https://play.google.com/store/apps/details?id=com.paketindo', ios: 'https://apps.apple.com/id/app/paketindo/id1573115358?l=id',
//   doc: 'Aplikasi dibidang pengiriman paket, aplikasi memiliki fitur mencari dan memilih lokasi dengan menggunakan API Google Map.'},
// {name: 'Nakula Paketindo', desc: '', path: require('../assets/nakula.png'), and: 'https://play.google.com/store/apps/details?id=com.nakulapaketindo', ios: 'https://apps.apple.com/id/app/nakula-paketindo/id1589885237',
// doc: 'Aplikasi driver untuk pengantaran, memiliki fitur berbagi lokasi secara realtime.'},
// {name: 'Relasi Paketindo', desc: '', path: require('../assets/rm.png'), and: 'https://play.google.com/store/apps/details?id=com.rmclient', ios: 'https://apps.apple.com/id/app/relasi-paketindo/id1567033846',
// doc: 'Aplikasi untuk menarik relasi untuk bekerja sama. Desain menu yang kompleks degan menggabungkan menu bawah dan samping'},
// {name: 'Agen Paketindo', desc: '', path: require('../assets/agent.png'), and: 'https://play.google.com/store/apps/details?id=com.paketindokuriragen', ios: '',
// doc: 'Aplikasi memiliki fitur yang sederhana seperti mengisikan formulir untuk bertransaksi'},
// {name: 'Droppoint Paketindo', desc: '', path: require('../assets/dp.png'), and: 'https://play.google.com/store/apps/details?id=com.pektindokurirdroppoint', ios: '',
// doc: 'Aplikasi memiliki fitur yang sederhana seperti mengisikan formulir untuk bertransaksi'},
// {name: 'Pasarindo', desc: '', path: require('../assets/pasar.png'), and: 'https://play.google.com/store/apps/details?id=com.pasarindoapp', ios: '',
// doc: 'Aplikasi E-commerce yang berpusat pada Pasar lokal, memiliki fitur belanja dan berjualan. seperti aplikasi E-commerce lainnya.'},
// {name: 'PesananQu', desc: '', path: require('../assets/pesananqu.png'), and: '', ios: '',
// doc: 'Aplikasi E-commerce yang berpusat pada buah tangan atau biasa disebut oleh-oleh, memiliki fitur belanja dan berjualan. seperti aplikasi E-commerce lainnya.'},
// ],
  List<ProjectsData> getProject() {
    var listName = [
      ProjectsData(
          id: UniqueKey().toString(),
          title: "AI Care",
          framework: 'Flutter',
          platforms: [
            Platforms(
                enumPlatform: EnumPlatform.android,
                linkUrl:
                    'https://play.google.com/store/apps/details?id=net.atmatech.hcp'),
            Platforms(
                enumPlatform: EnumPlatform.ios,
                linkUrl: 'https://apps.apple.com/id/app/ai-care/id1545122059'),
          ],
          category: 'Medical',
          website: 'www.google.com',
          imageDashboard: 'assets/images/portfolio/front_aicare.png',
          imageIcon: 'assets/images/portfolio/icon_aicare.png',
          overview: DetailsDescription(
            top:
                "Ai Care is a health application designed to help users analyze their symptoms through interaction with Katherine, the app's artificial intelligence. The app provides a feature for self-diagnosis and offers teleconsultation services to enhance user healthcare experience. It includes real-time updates on health conditions and personalized recommendations based on user input. Key features include:",
            body: [
              "Symptom analysis using AI",
              "Teleconsultation improvements",
              "Profile management capabilities",
              "Enhanced data privacy and security"
            ],
          ),
          execution: DetailsDescription(
              top:
                  "The execution of the Ai Care application involved a comprehensive and meticulous approach to ensure a seamless user experience in healthcare. The project began with extensive requirement gathering, involving consultations with healthcare professionals and potential users to define essential features. A thorough feasibility study was conducted to assess the technical and financial viability, leading to the development of a detailed project plan covering scope, timeline, resources, risk management, and quality assurance. Key features in the Ai Care app include:",
              body: [
                "The Ai Care app employs an advanced expert system to analyze patient symptoms. Users can input their symptoms, and the system will provide medical analysis and recommendations based on the available data.",
                "This feature allows users to speak directly into the app, which then converts their speech into text. This makes it easier for users to input symptoms or medical information without needing to type.",
                "With the text-to-speech feature, the app can read the text displayed on the screen aloud to the user. This is particularly useful for users who have difficulty reading or prefer listening to information.",
                "Ai Care supports various local languages, enabling users to select the language they are most comfortable with. This feature ensures that the app is accessible and usable by people from different linguistic backgrounds."
              ]),
          images: List.generate(
              6, (index) => 'assets/images/portfolio/aicare${index + 1}.png'),
          timeCreated: DateTime(2023, 5, 1).formatDateTime),
      ProjectsData(
          id: UniqueKey().toString(),
          title: "Callink",
          framework: 'Flutter',
          platforms: [
            Platforms(
                enumPlatform: EnumPlatform.android,
                linkUrl:
                    'https://play.google.com/store/apps/details?id=chat.callink.id'),
            Platforms(
                enumPlatform: EnumPlatform.ios,
                linkUrl: 'https://apps.apple.com/id/app/callink/id1551523355'),
          ],
          category: 'Communication',
          website: 'www.google.com',
          imageDashboard: 'assets/images/portfolio/front_callink.jpeg',
          imageIcon: 'assets/images/portfolio/icon_callink.png',
          overview: DetailsDescription(
              top:
                  "Callink is an app designed to simplify communication within your team. It falls into the category of team chat apps, which are designed for group communication and collaboration among colleagues. Here's a breakdown of Callink's features:",
              body: [
                "All-in-one hub: Keep messages, files, and tasks organized in one place for easy access and collaboration.",
                "Chat simplicity: Enjoy a user-friendly interface for sending messages to your team.",
                "Group chats: Create private or public channels for focused discussions or team announcements.",
                "Voice video calls: Make voice calls or even hop on video calls for a more personal touch, all within the Callink app"
              ],
              bottom:
                  "In short, Callink helps your team stay connected and get work done efficiently, making it a valuable tool for businesses and organizations."),
          execution: DetailsDescription(
              top:
                  "Execution in mobile cross-platform development involves implementing the app’s design and functionality across various mobile platforms, such as Android and iOS. The steps involved include:",
              body: [
                "Framework Selection: Callink chose Flutter as the cross-platform framework. Flutter allows us to write code once and run it on both Android and iOS platforms.",
                "Feature Development: The Callink development team wrote code for all major features, such as messaging, voice and video calls, and file sharing. We ensured that the code runs smoothly on all Android and iOS devices.",
                "Comprehensive Testing: Callink was thoroughly tested to ensure it functions correctly on all Android and iOS devices. We used various testing techniques, including unit testing, integration testing, and UI/UX testing.",
                "App Publishing: The Callink developers published the app to the Google Play Store and App Store, following the guidelines and publication processes for each platform."
              ],
              bottom:
                  "Key features of Callink, developed by me and my team, include: video and voice calls using WebRTC technology, RocketChat, Chat stickers, modern and trendy design implementation"),
          images: List.generate(
              5, (index) => 'assets/images/portfolio/callink${index + 1}.jpg'),
          timeCreated: DateTime(2022, 6, 2).formatDateTime),
      ProjectsData(
          id: UniqueKey().toString(),
          title: 'Paketindo',
          framework: 'React Native',
          platforms: [
            Platforms(
                enumPlatform: EnumPlatform.android,
                linkUrl:
                    'https://play.google.com/store/apps/details?id=com.paketindo'),
            Platforms(
                enumPlatform: EnumPlatform.ios,
                linkUrl:
                    'https://apps.apple.com/id/app/paketindo/id1573115358?l=id'),
          ],
          category: 'Travel',
          website: 'www.google.com',
          imageDashboard: 'assets/images/portfolio/front_paketindo.jpeg',
          imageIcon: 'assets/images/portfolio/icon_paketindo.png',
          overview: DetailsDescription(
              top:
                  "Paketindo is a reliable and affordable courier service in Indonesia that offers document, package, and box delivery services nationwide. Paketindo guarantees that your shipments will arrive safely and on time.Here are some of the key features of Paketindo:",
              body: [
                "Reliable delivery: Paketindo uses an extensive network of experienced couriers to ensure that your shipments arrive safely and on time.",
                "Cost-effective shipping: Paketindo offers a variety of shipping options to meet your needs and budget.",
                "Shipment tracking: You can track your shipments online or through the Paketindo app.",
                "Shipping insurance: Paketindo offers shipping insurance to protect your shipments from damage or loss.",
                "Friendly customer service: Paketindo has a team of friendly customer service representatives who are ready to assist you with any questions or concerns."
              ]),
          execution: DetailsDescription(
              top:
                  "Paketindo is a multi-functional app developed with a focus on efficiency and performance. As a developer, I was responsible for addressing challenges during the development process. This project showcases how planned and systematic execution can result in a high-quality application.Execution in mobile cross-platform development involves implementing the app’s design and functionality across various platforms, such as Android and iOS. I developed all the standout features mobile app of Paketindo, including:",
              body: [
                "Real-time tracking based on the locations of customers and partners",
                "Integration of Google Maps API features like directions, places, and more",
                "Instant and scheduled delivery of goods or services",
                "Support for various payment methods"
              ]),
          images: List.generate(7,
              (index) => 'assets/images/portfolio/paketindo${index + 1}.jpg'),
          timeCreated: DateTime(2020, 2, 10).formatDateTime),
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
