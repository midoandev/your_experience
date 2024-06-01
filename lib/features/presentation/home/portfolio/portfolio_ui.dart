import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';
import 'package:your_experience/utility/shared/constants/string_helper.dart';
import 'package:your_experience/utility/shared/widgets/body_widget/button_inkwell.dart';

import '../../../../utility/shared/constants/common.dart';
import 'portfolio_logic.dart';

class PortfolioUi extends GetView<PortfolioLogic> {
  const PortfolioUi({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = controller;
    final state = controller.state;
    final isSmallerThanDesktop =
        ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
    return SizedBox(
      height: Get.height - Common.heightToolbar,
      child: ResponsiveRowColumn(
          columnPadding: const EdgeInsets.all(16),
          columnSpacing: 16,
          columnMainAxisAlignment: MainAxisAlignment.center,
          layout: ResponsiveRowColumnType.COLUMN,
          children: [
            ResponsiveRowColumnItem(
              columnFlex: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                        horizontal: isSmallerThanDesktop ? 16 : 32)
                    .copyWith(bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(child: Column(
                      children: [
                        Text(
                          'Take a look at my portfolio',
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
                            'Here are a few of my completed projects, showcasing my skills in mobile development. I have several other projects currently in development that will be added soon. Stay tuned for updates as I continue to build and refine my portfolio.',
                            textAlign: TextAlign.center,
                            style: Get.textTheme.titleMedium!.copyWith(
                              // color: Colors.black45,
                              height: 21.pxToDouble,
                            ),
                          ),
                        ),
                      ],
                    ),),
                    Visibility(
                      visible: false,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                                vertical: 24, horizontal: 16),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            textStyle: Get.textTheme.labelLarge),
                        child: const Row(
                          children: [
                            Text('See All'),
                            SizedBox(width: 12),
                            Icon(
                              Icons.arrow_circle_right,
                              size: 24,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            ResponsiveRowColumnItem(
                columnFlex: 1,
                child: Obx(() {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.projects.length,
                    itemBuilder: (context, index) {
                      return _itemPortfolio(index);
                    },
                  );
                }))
          ]),
    );
  }

  Widget _itemPortfolio(int index) {
    final isSmallerThanDesktop =
        ResponsiveBreakpoints.of(Get.context!).smallerThan(DESKTOP);
    final state = controller.state;
    var item = state.projects[index];
    var lastIndex = state.projects.last.id == item.id;
    var firstIndex = state.projects.first.id == item.id;
    return Container(
      height: 500,
      width: 600,
      // color: index.isOdd ? Colors.grey : Colors.red,
      padding: EdgeInsets.only(
        left: isSmallerThanDesktop
            ? 16
            : firstIndex
                ? 32
                : 16,
        right: isSmallerThanDesktop
            ? 16
            : lastIndex
                ? 32
                : 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.zh,
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                item.imageDashboard,
                fit: BoxFit.cover,
              ),
            ),
          ),
          16.zh,
          Text(
            item.title,
            style: Get.textTheme.titleLarge!.copyWith(),
          ),
          6.zh,
          Text(
            parse(item.overview).body!.text,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            style: Get.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w300,
              color: Get.textTheme.bodyMedium!.color!.withOpacity(.7),
            ),
          ),
          16.zh,
          ButtonInkWell(
            onPress: () => controller.toDetails(item),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Read more',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    style: Get.textTheme.bodyMedium!.copyWith(),
                  ),
                  8.zw,
                  const Icon(Icons.arrow_circle_right_outlined)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
