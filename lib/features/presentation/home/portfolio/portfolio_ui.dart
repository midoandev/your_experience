import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';

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
          columnSpacing: 20,
          columnMainAxisAlignment: MainAxisAlignment.center,
          layout: ResponsiveRowColumnType.COLUMN,
          children: [
            ResponsiveRowColumnItem(
              columnFlex: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        'Take a look at my portfolio',
                        textAlign: TextAlign.start,
                        style: Get.textTheme.headlineMedium!.copyWith(
                          // color: Colors.black,
                          letterSpacing: 3,
                          height: 21.pxToDouble,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () => logic.animateToIndex(isPlus: false),
                          style: ButtonStyle(
                            shape:
                                MaterialStateProperty.all(const CircleBorder()),
                            padding:
                            MaterialStateProperty.all(const EdgeInsets.all(20)),
                          ),
                          child: const Icon(
                            Icons.chevron_left,
                            // color: Colors.white,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => logic.animateToIndex(),
                          style: ButtonStyle(
                            shape:
                                MaterialStateProperty.all(const CircleBorder()),
                            padding:
                            MaterialStateProperty.all(const EdgeInsets.all(20)),
                          ),
                          child: const Icon(
                            Icons.chevron_right,
                            // color: Colors.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            ResponsiveRowColumnItem(
                columnFlex: 1,
                child: Obx(() {
                  return ListView.builder(
                    controller: logic.controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.projects.value.length,
                    itemBuilder: (context, index) {
                      return _itemPortfolio(index);
                    },
                  );
                }))
          ]),
    );
  }

  Widget _itemPortfolio(int index) {
    final state = controller.state;
    var item = state.projects.value[index];
    var lastIndex = state.projects.value.last.id == item.id;
    return Container(
      height: 500,
      width: 600,
      // color: index.isOdd ? Colors.grey : Colors.red,
      padding: EdgeInsets.only(left: 16, right: lastIndex ? 32 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              item.title,
              style: Get.textTheme.bodyLarge!.copyWith(),
            ),
          ),
          6.zh,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              item.overview,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
              style: Get.textTheme.bodyMedium!.copyWith(),
            ),
          ),
          24.zh,
        ],
      ),
    );
  }
}
