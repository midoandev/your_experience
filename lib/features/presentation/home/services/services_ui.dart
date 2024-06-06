import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:your_experience/utility/shared/constants/common.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';

import 'services_logic.dart';

class ServicesUi extends GetView<ServicesLogic> {
  const ServicesUi({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = controller;
    final state = logic.state;
    final double height =
        isSmallerThanDesktop ? Get.height * .1 : (-Common.heightToolbar);
    return SizedBox(
        height: height + Get.height,
        child: ResponsiveRowColumn(
            columnPadding: const EdgeInsets.symmetric(horizontal: 16),
            columnSpacing: isSmallerThanDesktop ? 32 : Get.height*.2,
            rowMainAxisAlignment: MainAxisAlignment.center,
            columnMainAxisAlignment: MainAxisAlignment.center,
            layout: ResponsiveRowColumnType.COLUMN,
            children: [
              ResponsiveRowColumnItem(
                columnFlex: 0,
                child: Column(
                  children: [
                    Text(
                      controller.menu.nameTab,
                      textAlign: TextAlign.center,
                      style: Get.textTheme.titleLarge!.copyWith(
                        // color: Colors.black,
                        height: 21.pxToDouble,
                        letterSpacing: 3,
                      ),
                    ),
                    4.zh,
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: Get.width * (isSmallerThanDesktop ? 1 : .7),
                      ),
                      child: Text(
                        controller.menu.description,
                        textAlign: TextAlign.center,
                        style: Get.textTheme.titleMedium!.copyWith(
                          // color: Colors.black45,
                          height: 21.pxToDouble,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ResponsiveRowColumnItem(
                columnFlex: 0,
                child: IntrinsicHeight(
                  child: Obx(() {
                    return ResponsiveRowColumn(
                      rowCrossAxisAlignment: CrossAxisAlignment.start,
                      rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      columnSpacing: 12,
                      columnPadding: const EdgeInsets.symmetric(vertical: 12),
                      layout: isSmallerThanDesktop
                          ? ResponsiveRowColumnType.COLUMN
                          : ResponsiveRowColumnType.ROW,
                      children: state.itemServices.map((item) {
                        return ResponsiveRowColumnItem(
                          child: item.title.isEmpty
                              ? isSmallerThanDesktop
                                  ? const Divider(
                                      thickness: 2,
                                      height: 12,
                                    )
                                  : const VerticalDivider(
                                      thickness: 2,
                                      width: 20,
                                    )
                              : serviceCard(
                                  icon: item.icon,
                                  title: item.title,
                                  description: item.description),
                        );
                      }).toList(),
                    );
                  }),
                ),
              ),
            ]));
  }

  Widget serviceCard(
      {required IconData icon,
      required String title,
      required String description}) {
    final isSmallerThanDesktop =
        ResponsiveBreakpoints.of(Get.context!).smallerThan(DESKTOP);
    return SizedBox(
      // height: 320,
      width: Get.width * (isSmallerThanDesktop ? 1 : .17),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Visibility(
            visible: !isSmallerThanDesktop,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Icon(
                  icon,
                  size: 32,
                ),
              ),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Get.textTheme.titleMedium,
          ),
          8.zh,
          Text(
            description,
            textAlign: TextAlign.justify,
            style: Get.textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
