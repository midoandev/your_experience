import 'package:flutter/material.dart';

class ServicesState {
  ServicesState() {
    ///Initialize variables
  }
  var itemServices = [
    ServiceCardItems(
      icon: Icons.design_services,
      title: 'UI/UX Implementation Specialist',
      description:
          'Kemampuan untuk menerjemahkan desain dari Figma atau aplikasi sejenisnya ke dalam kode secara akurat, menunjukkan keahlian dalam implementasi desain dan perhatian terhadap detail visual pada aplikasi.',
    ),
    ServiceCardItems(
      icon: Icons.touch_app,
      title: 'Efficient Clean Architecture',
      description:
          'Terbiasa menggunakan clean architecture dalam pengembangan aplikasi. Pendekatan ini memudahkan perbaikan, penambahan fitur, serta perubahan dalam proyek, sambil menjaga agar kode tetap bersih dan mudah dikembangkan',
    ),
    ServiceCardItems(
      icon: Icons.lightbulb,
      title: 'Creativity and Solution Skills',
      description:
          'Kemampuan yang baik dalam mencari solusi untuk menyelesaikan fitur-fitur yang kompleks. Saya juga memiliki ide yang kreatif untuk memecahkan masalah dengan cara yang cepat dan efektif',
    ),
    ServiceCardItems(
      icon: Icons.code,
      title: 'Proficiency in App Enhancement',
      description:
          'Berpengalaman dalam memperbaiki dan meningkatkan aplikasi yang telah dikembangkan sebelumnya, dengan menggunakan teknologi Flutter dan React Native untuk membangun aplikasi yang berjalan lancar di platform Android dan iOS',
    ),
  ];
}

class ServiceCardItems {
  IconData icon;
  String title;
  String description;

  ServiceCardItems(
      {required this.icon, required this.title, required this.description});
}
