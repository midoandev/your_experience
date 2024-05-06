import 'package:flutter/material.dart';

import 'leading_default.dart';
import 'title_appbar_default.dart';

class AppBarDefault extends AppBar {
  AppBarDefault(
      {Key? key,
      Function()? onBack,
      required String labelTitle,
      double? elevation,
      List<Widget>? actionListWidget})
      : super(
          key: key,
          title: TitleAppBarDefault(labelTitle: labelTitle),
          titleSpacing: 0,
          centerTitle: false,
          elevation: elevation ?? .4,
          leading: LeadingDefault(onBack: onBack),
          actions: actionListWidget,
        );
}
