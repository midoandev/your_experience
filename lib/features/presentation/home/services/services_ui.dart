import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:your_experience/utility/shared/constants/common.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';

import 'services_logic.dart';

class ServicesUi extends GetView<ServicesLogic> {
  const ServicesUi({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = controller;
    final state = controller.state;
    final isSmallerThanDesktop =
        ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
    final double height =
        isSmallerThanDesktop ? Get.height * .1 : (-Common.heightToolbar);
    return SizedBox(
        height: height + Get.height,
        child: ResponsiveRowColumn(
            columnPadding: const EdgeInsets.symmetric(horizontal: 16),
            rowMainAxisAlignment: MainAxisAlignment.center,
            columnMainAxisAlignment: MainAxisAlignment.center,
            layout: ResponsiveRowColumnType.COLUMN,
            children: [
              ResponsiveRowColumnItem(
                columnFlex: 0,
                child: Column(
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
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: isSmallerThanDesktop ? Get.width : 550,
                      ),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At',
                        textAlign: TextAlign.center,
                        style: Get.textTheme.labelLarge!.copyWith(
                          // color: Colors.black45,
                          height: 21.pxToDouble,
                        ),
                      ),
                    ),
                    24.zh
                  ],
                ),
              ),
              ResponsiveRowColumnItem(
                  columnFlex: 1,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth:
                            isSmallerThanDesktop ? Get.width : Get.width * .85),
                    child: ResponsiveGridList(
                        horizontalGridSpacing: isSmallerThanDesktop ? 0 : 20,
                        verticalGridSpacing: 16,
                        verticalGridMargin: 20,
                        minItemWidth:
                            Get.width / (isSmallerThanDesktop ? 1 : 3),
                        minItemsPerRow: 1,
                        children: state.itemServices
                            .map((item) => serviceCard(
                                icon: item.icon,
                                title: item.title,
                                description: item.description))
                            .toList()),
                  ))
            ])

        //           Positioned.fill(
        //             child: Center(
        //               child: Container(
        //                 width: Get.width * .7,
        //                 height: Get.height * .57,
        //                 decoration: BoxDecoration(
        //                   color: Colors.black.withOpacity(.1),
        //                   borderRadius: const BorderRadius.all(
        //                     Radius.circular(20),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ),
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
              size: 32,
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
