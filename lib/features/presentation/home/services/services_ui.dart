import 'package:flutter/material.dart';
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
      height: Get.height - Common.heightToolbar,
      padding: const EdgeInsets.symmetric(horizontal: Common.paddingHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Services',
            textAlign: TextAlign.center,
            style: Get.textTheme.headlineMedium!.copyWith(
              // color: Colors.black,
              height: 21.pxToDouble,
              letterSpacing: 3,
            ),
          ),
          4.zh,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            width: Get.width * .6,
            child: Text(
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At',
              textAlign: TextAlign.center,
              style: Get.textTheme.labelLarge!.copyWith(
                // color: Colors.black45,
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
                        color: Colors.black.withOpacity(.1),
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
                          childAspectRatio: (1 / .24),
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
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        // side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              icon,
              size: 40,
              // color: Colors.grey.shade500,
            ),
            16.zw,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Get.textTheme.bodyMedium!.copyWith(),
                  ),
                  6.zh,
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
      ),
    );
  }
}
