import 'package:flutter/material.dart';

class ServicesData {
  IconData icon;
  String title;
  String description;
  String desc;

  ServicesData(
      {required this.icon, required this.title, required this.description, this.desc = ''});

  factory ServicesData.empty() =>
      ServicesData(icon: Icons.add, title: '', description: '', desc: '');

}