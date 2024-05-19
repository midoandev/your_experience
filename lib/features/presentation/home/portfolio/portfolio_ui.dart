import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';
import 'package:your_experience/utility/shared/constants/string_helper.dart';

import '../../../../utility/shared/constants/common.dart';
import 'portfolio_logic.dart';

class PortfolioUi extends StatelessWidget {
  PortfolioUi({super.key});

  final logic = Get.put(PortfolioLogic());
  final state = Get.find<PortfolioLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height - CommonConstants.heightToolbar,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    'Take a look at my portfolio',
                    textAlign: TextAlign.start,
                    style: Get.textTheme.headlineMedium!.copyWith(
                      color: Colors.black,
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
                        shape: MaterialStateProperty.all(const CircleBorder()),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(20)),
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        // <-- Button color
                        overlayColor:
                            MaterialStateProperty.resolveWith<Color?>((states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.black12; // <-- Splash color
                        }),
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => logic.animateToIndex(),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(const CircleBorder()),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(20)),
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        // <-- Button color
                        overlayColor:
                            MaterialStateProperty.resolveWith<Color?>((states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.black12; // <-- Splash color
                        }),
                      ),
                      child: const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                controller: logic.controller,
                scrollDirection: Axis.horizontal,
                itemCount: state.projects.value.length,
                itemBuilder: (context, index) {
                  var item = state.projects.value[index];
                  return Container(
                    height: Get.height * .7,
                    width: Get.width * .45,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset(
                            item.imageDashboard,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            item.title,
                            style: Get.textTheme.bodyMedium!.copyWith(),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            item.overview,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                            style: Get.textTheme.bodySmall!.copyWith(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          )
        ],
      ),
    );
  }
}
