import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';
import 'package:your_experience/utility/shared/widgets/body_widget/button_inkwell.dart';

import '../../../utility/shared/constants/common.dart';
import 'footer_logic.dart';

class FooterUi extends GetView<FooterLogic> {
  const FooterUi({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = controller;
    final state = logic.state;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        40.zh,
        const Divider(thickness: 2),
        16.zh,
        ResponsiveRowColumn(
          rowSpacing: 80,
          columnSpacing: 40,
          columnVerticalDirection: VerticalDirection.down,
          // rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
          rowCrossAxisAlignment: CrossAxisAlignment.start,
          columnMainAxisAlignment: MainAxisAlignment.start,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          rowPadding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          columnPadding: EdgeInsets.all( isSmallerThanDesktop? 16 : 32),
          layout: isSmallerThanDesktop
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 0,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth:  (isSmallerThanDesktop ? Get.width *1 : 550),
                ),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      color: Get.theme.primaryColor.withOpacity(.5),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 2,
                          spreadRadius: 1,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Available for Freelance',
                        textAlign: TextAlign.start,
                        style: Get.textTheme.headlineMedium!.copyWith(
                          color: Colors.white,
                          height: 19.pxToDouble,
                          letterSpacing: 2,
                        ),
                      ),
                      12.zh,
                      Text(
                        "Looking for a freelance mobile developer? I’m available for hire! Let's work together to bring your app ideas to life. Get in touch!",
                        textAlign: TextAlign.justify,
                        style: Get.textTheme.labelLarge!.copyWith(
                          color: Colors.white.withOpacity(.8),
                          height: 21.pxToDouble,
                        ),
                      ),
                      16.zh,
                      Obx(() {
                        return Row(
                          children: state.itemsContacts.map((element) {
                            return Container(
                              margin: EdgeInsets.only(right: 16),
                              child: ButtonInkWell(
                                onPress: () => logic.gotoAddress(element.link),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Icon(
                                    element.icon,
                                    size: 20,
                                    color: Colors.white.withOpacity(.8),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Pages',
                    textAlign: TextAlign.justify,
                    style: Get.textTheme.titleLarge!.copyWith(
                      // color: Colors.black45,
                      height: 21.pxToDouble,
                    ),
                  ),
                  24.zh,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: logic.logicMain.state.menu
                            .sublist(0, logic.logicMain.state.menu.length - 1)
                            .map((e) {
                          return Container(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              e.nameTab,
                              textAlign: TextAlign.justify,
                              style: Get.textTheme.bodyMedium!.copyWith(
                                height: 21.pxToDouble,
                                color: Get.textTheme.bodyMedium!.color!
                                    .withOpacity(.7),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      32.zw,
                      // Column(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisSize: MainAxisSize.min,
                      //     children: [
                      //       Container(
                      //         padding: const EdgeInsets.only(bottom: 12),
                      //         child: Text(
                      //           'Single Project',
                      //           textAlign: TextAlign.justify,
                      //           style: Get.textTheme.bodyMedium!.copyWith(
                      //             height: 21.pxToDouble,
                      //             color: Get.textTheme.bodyMedium!.color!
                      //                 .withOpacity(.7),
                      //           ),
                      //         ),
                      //       ),
                      //       Container(
                      //         padding: const EdgeInsets.only(bottom: 12),
                      //         child: Text(
                      //           'About This App',
                      //           textAlign: TextAlign.justify,
                      //           style: Get.textTheme.bodyMedium!.copyWith(
                      //             height: 21.pxToDouble,
                      //             color: Get.textTheme.bodyMedium!.color!
                      //                 .withOpacity(.7),
                      //           ),
                      //         ),
                      //       )
                      //     ]),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        24.zh,
        const Divider(thickness: 2),
        8.zh,
        Text(
          '© 2024 Mido. All rights reserved.',
          textAlign: TextAlign.justify,
          style: Get.textTheme.titleMedium!,
        ),
        16.zh,
      ],
    );
  }
}
