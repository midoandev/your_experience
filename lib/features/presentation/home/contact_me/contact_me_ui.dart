import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'contact_me_logic.dart';

class Contact_meUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.put(Contact_meLogic());
    final state = Get.find<Contact_meLogic>().state;

    return Container();
  }
}
