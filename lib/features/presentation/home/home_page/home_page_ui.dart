import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';

import '../../../../utility/shared/constants/common.dart';
import '../../../../utility/shared/widgets/body_widget/button_inkwell.dart';
import 'home_page_logic.dart';

class HomePageUi extends GetView<HomePageLogic> {
  const HomePageUi({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = controller;
    final stateMain = logic.logicMain.state;
    return SizedBox(
      height: Get.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Obx(() {
              return ButtonInkWell(
                onPress: () =>
                    logic.logicMain.changeTheme(
                        !logic.logicMain.state.isLightMode.value),
                child: Icon(
                  logic.logicMain.state.isLightMode.isFalse
                      ? Icons.light_mode
                      : Icons.dark_mode,
                  size: 24,
                ),
              );
            }),
          ),
          Expanded(
            child: ResponsiveRowColumn(
              columnSpacing: 32,
              columnVerticalDirection: VerticalDirection.down,
              rowMainAxisAlignment: MainAxisAlignment.spaceAround,
              columnMainAxisAlignment: MainAxisAlignment.center,
              rowPadding: const EdgeInsets.all(30),
              columnPadding: const EdgeInsets.all(24),
              layout: isSmallerThanDesktop
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              children: [
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  columnFlex: 1,
                  rowColumn: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, I'am ${stateMain.mainData.value.hiIam}",
                        style: Get.textTheme.displaySmall?.copyWith(
                          // height: 13.pxToDouble,
                            letterSpacing: 3),
                      ),
                      Obx(() {
                        return Text(
                          stateMain.mainData.value.iam,
                          style: Get.textTheme.displayMedium?.copyWith(
                            // height: 18.pxToDouble,
                              letterSpacing: 2.4),
                        );
                      }),
                      12.zh,
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: (isSmallerThanDesktop
                              ? Get.width * 1
                              : 550),
                        ),
                        child: Obx(() {
                          return Text(
                            stateMain.mainData.value.descriptionIam,
                            textAlign: TextAlign.start,
                            style: Get.textTheme.titleMedium?.copyWith(
                                height: 21.pxToDouble,
                                // fontWeight: FontWeight.w400,
                                letterSpacing: .8),
                          );
                        }),
                      ),
                      24.zh,
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: logic.downloadCv,
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 24, horizontal: 24),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                                textStyle: Get.textTheme.labelLarge
                            ),
                            child: const Text('Download CV'),
                          ),
                          // const SizedBox(width: 18),
                          // ButtonInkWell(child: Icon(
                          //   state.contact.value.icon,
                          //   size: 24,), onPress: logic.gotoAddress)
                        ],
                      ),
                    ],
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  columnOrder: 2,
                  columnFlex: 1,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: isSmallerThanDesktop ? 320 : 500,
                    ),
                    child: Image.asset(
                      logic.logicMain.state.mainData.value.imageIam.url,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error);
                      },
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
}
