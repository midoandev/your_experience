import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'contact_logic.dart';

class ContactUi extends StatelessWidget {
  const ContactUi({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(ContactLogic());
    final state = Get.find<ContactLogic>().state;

    return Container(height: Get.height, color: Colors.red);
  }
}
