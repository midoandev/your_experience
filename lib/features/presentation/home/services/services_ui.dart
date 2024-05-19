import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:your_experience/utility/shared/constants/common.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';

import 'services_logic.dart';

class ServicesUi extends StatelessWidget {
  final logic = Get.put(ServicesLogic());
  final state = Get.find<ServicesLogic>().state;

  ServicesUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - CommonConstants.heightToolbar,
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Services',
            textAlign: TextAlign.center,
            style: Get.textTheme.headlineMedium!.copyWith(
              color: Colors.black,
              height: 21.pxToDouble,
              letterSpacing: 3,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            width: Get.width * .6,
            child: Text(
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At',
              textAlign: TextAlign.center,
              style: Get.textTheme.labelLarge!.copyWith(
                color: Colors.black45,
                height: 21.pxToDouble,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Center(
                    child: Container(
                      width: Get.width * .7,
                      height: Get.height * .57,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(.1),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: SizedBox(
                      child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 26,
                          mainAxisSpacing: 23,
                          childAspectRatio: (1 / .3),
                          controller: ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: state.itemServices.map((item) {
                            return serviceCard(
                                icon: item.icon,
                                title: item.title,
                                description: item.description);
                          }).toList()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget serviceCard(
      {required IconData icon,
      required String title,
      required String description}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.blue,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Get.textTheme.bodyMedium!.copyWith(),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  textAlign: TextAlign.justify,
                  style: Get.textTheme.bodySmall!.copyWith(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
