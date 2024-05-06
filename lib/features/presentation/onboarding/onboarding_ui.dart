
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';
import 'package:your_experience/utility/shared/constants/string_helper.dart';

import 'onboarding_logic.dart';

class OnboardingPage extends StatelessWidget {
  static const String namePath = '/';
  final logic = Get.put(OnboardingLogic());
  final state = Get.find<OnboardingLogic>().state;
  final String dearName;

  OnboardingPage({Key? key, required this.dearName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullName = dearName.substring(1).replaceAll('-', ' ');
    final textTheme = Theme.of(context).textTheme;
    return Container(
      child: Column(
        children: [
          Text('djfjnfksd',style: textTheme.headlineLarge?.copyWith(
            fontSize: 36,
            height: 26.pxToDouble,
            color: '#D4927D'.hexToColor,
          ),)
        ],
      ),
    );
  }
}
