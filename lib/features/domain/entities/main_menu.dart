import 'package:flutter/material.dart';

import '../../../utility/shared/constants/string_helper.dart';

class MainMenu {
  String? id = StringHelper.randomId();
  String nameTab;
  String description;
  StatelessWidget classWidget;

  MainMenu(
      {this.id,
      required this.nameTab,
      this.description = '',
      required this.classWidget});

  factory MainMenu.empty() => MainMenu(nameTab: '', description: '', classWidget: const ClassEmpty());
}


class ClassEmpty extends StatelessWidget {
  const ClassEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
