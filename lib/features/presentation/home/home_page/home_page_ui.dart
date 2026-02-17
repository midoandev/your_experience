import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';

import '../../../../utility/shared/widgets/body_widget/button_inkwell.dart';
import 'home_page_logic.dart';

class HomePageUi extends GetView<HomePageLogic> {
  const HomePageUi({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = controller;
    final stateMain = logic.logicMain.state;

    // PERBAIKAN 1: Ambil breakpoint secara lokal dari context
    final bool isSmall = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    return SizedBox(
      // PERBAIKAN 2: Gunakan BoxConstraints atau MediaQuery agar lebih fleksibel di Web
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Obx(() {
              return ButtonInkWell(
                onPress: () => logic.logicMain
                    .changeTheme(!logic.logicMain.state.isLightMode.value),
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
              columnSpacing: 24,
              columnVerticalDirection: VerticalDirection.down,
              rowMainAxisAlignment: MainAxisAlignment.spaceAround,
              columnMainAxisAlignment: MainAxisAlignment.center,
              rowPadding: const EdgeInsets.all(30),
              columnPadding: const EdgeInsets.all(24),
              // Gunakan variabel lokal 'isSmall'
              layout: isSmall
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              children: [
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  columnFlex: 1,
                  child: Obx(() { // Bungkus satu Obx di level Column agar lebih stabil
                    final data = stateMain.mainData.value;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, I'am ${data.hiIam}",
                          style: Get.textTheme.displaySmall?.copyWith(
                              fontSize: (Get.textTheme.displaySmall!.fontSize! -
                                  (isSmall ? 12 : 0)),
                              letterSpacing: 3),
                        ),
                        Text(
                          data.iam,
                          style: Get.textTheme.displayMedium?.copyWith(
                              fontSize:
                              (Get.textTheme.displayMedium!.fontSize! -
                                  (isSmall ? 12 : 0)),
                              letterSpacing: 2.4),
                        ),
                        12.zh,
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            // PERBAIKAN 3: Hindari Get.width * 1, gunakan double.infinity
                            maxWidth: (isSmall ? double.infinity : 550),
                          ),
                          child: Text(
                            data.descriptionIam,
                            textAlign: TextAlign.start,
                            style: Get.textTheme.titleMedium?.copyWith(
                                height: 1.5, // Gunakan multiplier (1.5) lebih aman daripada pxToDouble
                                fontSize:
                                (Get.textTheme.titleMedium!.fontSize! -
                                    (isSmall ? 4 : 0)),
                                letterSpacing: .8),
                          ),
                        ),
                        24.zh,
                      ],
                    );
                  }),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  columnOrder: isSmall ? 1 : 2, // Atur urutan gambar di mobile
                  child: Obx(() {
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: isSmall ? 320 : 500,
                      ),
                      child: Image.asset(
                        stateMain.mainData.value.imageIam.url,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.broken_image, size: 50);
                        },
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}