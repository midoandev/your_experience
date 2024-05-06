import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeadingDefault extends StatelessWidget {
  final Function()? onBack;
  final Color color;

  const LeadingDefault({
    Key? key,
    this.onBack,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 24,
      padding: EdgeInsets.zero,
      onPressed: onBack ?? () => Get.back(),
      icon: Icon(
        Icons.arrow_back,
        color: color,
      ),
    );
  }
}
