import 'package:flutter/material.dart';

class Contacts {
  IconData icon;
  String name;
  String link;

  Contacts({required this.icon, required this.name, required this.link});

  factory Contacts.empty() => Contacts(icon: Icons.add, name: '', link: '');
}
