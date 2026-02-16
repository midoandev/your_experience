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

    // Pastikan variabel ini terdefinisi dengan benar di context
    final bool isSmallerThanDesktop = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    final double calculatedHeight =
    isSmallerThanDesktop ? Get.height * .26 : (-Common.heightToolbar);

    return Container( // Gunakan Container/SizedBox untuk membungkus seluruh section
        height: calculatedHeight + Get.height,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ResponsiveRowColumn(
            columnPadding: const EdgeInsets.symmetric(horizontal: 16),
            columnSpacing: isSmallerThanDesktop ? 32 : Get.height * .1,
            rowMainAxisAlignment: MainAxisAlignment.center,
            columnMainAxisAlignment: MainAxisAlignment.center,
            layout: ResponsiveRowColumnType.COLUMN,
            children: [
              ResponsiveRowColumnItem(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      controller.menu.nameTab,
                      textAlign: TextAlign.center,
                      style: Get.textTheme.titleLarge!.copyWith(
                        fontSize: (Get.textTheme.titleLarge!.fontSize! - 4),
                        height: 21.pxToDouble,
                        letterSpacing: 3,
                      ),
                    ),
                    4.zh,
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: Get.width * (isSmallerThanDesktop ? 0.9 : 0.7),
                      ),
                      child: Text(
                        controller.menu.description,
                        textAlign: TextAlign.center,
                        style: Get.textTheme.titleMedium!.copyWith(
                          fontSize: (Get.textTheme.titleMedium!.fontSize! - 2),
                          letterSpacing: 1,
                          height: 19.pxToDouble,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ResponsiveRowColumnItem(
                child: Obx(() {
                  return ResponsiveRowColumn(
                    rowCrossAxisAlignment: CrossAxisAlignment.start,
                    rowMainAxisAlignment: MainAxisAlignment.center,
                    columnSpacing: 24,
                    columnPadding: const EdgeInsets.symmetric(vertical: 12),
                    layout: isSmallerThanDesktop
                        ? ResponsiveRowColumnType.COLUMN
                        : ResponsiveRowColumnType.ROW,
                    children: state.itemServices.map((item) {
                      // Jika item kosong (Divider)
                      if (item.title.isEmpty) {
                        return ResponsiveRowColumnItem(
                          child: isSmallerThanDesktop
                              ? const Divider(thickness: 2, height: 32)
                              : const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: SizedBox(
                              height: 200, // Beri tinggi eksplisit untuk divider vertical
                              child: VerticalDivider(thickness: 2),
                            ),
                          ),
                        );
                      }

                      // Bungkus serviceCard dengan Expanded/Flexible jika di mode ROW
                      return ResponsiveRowColumnItem(
                        rowFlex: 1, // Ini kunci agar tidak overflow di Row
                        child: serviceCard(
                          context: context,
                          icon: item.icon,
                          title: item.title,
                          description: item.description,
                        ),
                      );
                    }).toList(),
                  );
                }),
              ),
            ]));
  }

  Widget serviceCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String description,
  }) {
    final bool isSmallerThanDesktop = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: isSmallerThanDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          if (!isSmallerThanDesktop)
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Icon(icon, size: 32),
            ),
          Text(
            title,
            textAlign: isSmallerThanDesktop ? TextAlign.left : TextAlign.center,
            style: Get.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          8.zh,
          Text(
            description,
            textAlign: isSmallerThanDesktop ? TextAlign.left : TextAlign.center,
            style: Get.textTheme.titleSmall,
            softWrap: true, // Pastikan teks membungkus ke bawah
          ),
        ],
      ),
    );
  }
}