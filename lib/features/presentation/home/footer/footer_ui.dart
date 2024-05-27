import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';

import 'footer_logic.dart';

class FooterUi extends GetView<FooterLogic> {
  const FooterUi({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = controller;
    // final state = controller.state;

    final isSmallerThanDesktop =
        ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Divider(thickness: 2),
        24.zh,
        ResponsiveRowColumn(
          columnSpacing: 16,
          columnVerticalDirection: VerticalDirection.down,
          rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
          rowCrossAxisAlignment: CrossAxisAlignment.start,
          columnMainAxisAlignment: MainAxisAlignment.start,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          rowPadding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          columnPadding: const EdgeInsets.all(32),
          layout: isSmallerThanDesktop
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/stickers/fist_sticker.png',
                        width: 46,
                      ),
                      24.zw,
                      Text(
                        'Mido',
                        textAlign: TextAlign.center,
                        style: Get.textTheme.headlineMedium!.copyWith(
                          // color: Colors.black,
                          height: 21.pxToDouble,
                          letterSpacing: 3,
                        ),
                      ),
                    ],
                  ),
                  12.zh,
                  Text(
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At',
                    textAlign: TextAlign.justify,
                    style: Get.textTheme.labelLarge!.copyWith(
                      color: Get.textTheme.bodyMedium!.color!.withOpacity(.7),
                      height: 21.pxToDouble,
                    ),
                  ),
                  24.zh,
                  Row(
                    children: [
                      const Icon(Icons.mail_outlined, size: 20),
                      24.zw,
                      const Icon(FontAwesomeIcons.linkedinIn, size: 20),
                      24.zw,
                      const Icon(FontAwesomeIcons.instagram, size: 20),
                      24.zw,
                      const Icon(FontAwesomeIcons.github, size: 20),
                    ],
                  ),
                ],
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Text(
                                'Single Project',
                                textAlign: TextAlign.justify,
                                style: Get.textTheme.bodyMedium!.copyWith(
                                  height: 21.pxToDouble,
                                  color: Get.textTheme.bodyMedium!.color!
                                      .withOpacity(.7),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Text(
                                'About This App',
                                textAlign: TextAlign.justify,
                                style: Get.textTheme.bodyMedium!.copyWith(
                                  height: 21.pxToDouble,
                                  color: Get.textTheme.bodyMedium!.color!
                                      .withOpacity(.7),
                                ),
                              ),
                            )
                          ]),
                    ],
                  )
                ],
              ),
            ),
            ResponsiveRowColumnItem(
                rowFlex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Contact Me',
                      textAlign: TextAlign.justify,
                      style: Get.textTheme.titleLarge!.copyWith(
                        // color: Colors.black45,
                        height: 21.pxToDouble,
                      ),
                    ),
                    24.zh,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(FontAwesomeIcons.envelope, size: 16),
                        12.zw,
                        Text(
                          'andev.mido@gmail.com',
                          textAlign: TextAlign.justify,
                          style: Get.textTheme.bodyMedium!.copyWith(
                            height: 21.pxToDouble,
                            color: Get.textTheme.bodyMedium!.color!
                                .withOpacity(.7),
                          ),
                        ),
                      ],
                    ),
                    24.zh,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(FontAwesomeIcons.phone, size: 16),
                        12.zw,
                        Text(
                          '(415) 200 - 8613',
                          textAlign: TextAlign.justify,
                          style: Get.textTheme.bodyMedium!.copyWith(
                            height: 21.pxToDouble,
                            color: Get.textTheme.bodyMedium!.color!
                                .withOpacity(.7),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
        24.zh,
        const Divider(thickness: 2),
        8.zh,
        Text(
          'Copyright © Mido | Power by Flutter',
          textAlign: TextAlign.justify,
          style: Get.textTheme.titleMedium!,
        ),
        16.zh,
      ],
    );
  }
}
