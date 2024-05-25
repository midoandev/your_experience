import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';

import 'home_page_logic.dart';

class HomePageUi extends GetView<HomePageLogic> {
  const HomePageUi({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = controller;
    final state = controller.state;
    final stateMain = controller.logicMain.state;
    final isSmallerThanDesktop =
    ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
    return SizedBox(
      height: Get.height,
      child: ResponsiveRowColumn(
        rowSpacing: 80,
        columnSpacing: 32,
        columnVerticalDirection: VerticalDirection.down,
        rowMainAxisAlignment: MainAxisAlignment.center,
        columnMainAxisAlignment: MainAxisAlignment.center,
        rowPadding: const EdgeInsets.all(30),
        columnPadding: const EdgeInsets.all(30),
        layout: isSmallerThanDesktop
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 2,
            rowOrder: 1,
            columnOrder: 2,
            rowColumn: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hi, I am ',
                      style: Get.textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          height: 13.pxToDouble,
                          // color: Colors.black,
                          letterSpacing: 3),
                    ),
                    Obx(() {
                      return Text(
                        stateMain.mainData.value.hiIam,
                        style: Get.textTheme.displayMedium?.copyWith(
                            height: 13.pxToDouble,
                            // color: Colors.black,
                            letterSpacing: 8),
                      );
                    }),
                  ],
                ),
                Obx(() {
                  return Text(
                    stateMain.mainData.value.iam,
                    style: Get.textTheme.headlineMedium?.copyWith(
                        height: 18.pxToDouble,
                        // color: Colors.black.withOpacity(.6),
                        letterSpacing: 2.4),
                  );
                }),
                12.zh,
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: isSmallerThanDesktop ? Get.width : 550,
                  ),
                  child: Obx(() {
                    return Text(
                      stateMain.mainData.value.descriptionIam,
                      textAlign: TextAlign.justify,
                      style: Get.textTheme.labelMedium?.copyWith(
                          height: 21.pxToDouble,
                          fontWeight: FontWeight.w400,
                          letterSpacing: .8),
                    );
                  }),
                ),
                24.zh,
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(16))),
                        // backgroundColor: Colors.black,
                      ),
                      child: const Text('Download CV'),
                    ),
                    Obx(() {
                      return ElevatedButton(
                        onPressed: () =>
                            logic.logicMain.changeTheme(
                                !logic.logicMain.state.isLightMode.value),

                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          shape:
                          MaterialStateProperty.all(const CircleBorder()),
                          padding:
                          MaterialStateProperty.all(const EdgeInsets.all(16)),
                        ),
                        child: Icon(
                          logic.logicMain.state.isLightMode.isFalse
                              ? Icons.light_mode
                              : Icons.dark_mode,
                          size: 16,
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 2,
            columnOrder: 1,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: isSmallerThanDesktop ? 320 : 500,
              ),
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/your-experience-e1a8d.appspot.com/o/home_image.png?alt=media&token=ce3317b7-c121-4a08-bcc1-8d48b8d6a6c1',
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
