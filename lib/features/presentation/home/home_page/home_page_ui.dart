import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';

import '../../../../utility/shared/constants/common.dart';
import 'home_page_logic.dart';

class HomePageUi extends StatelessWidget {
  const HomePageUi({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(HomePageLogic());
    final state = Get.find<HomePageLogic>().state;

    return Obx(() {
      return Visibility(
        visible: state.mainData.value.iam.isNotEmpty,
        replacement: SizedBox(
            height: Get.height,
            child: const Center(child: CircularProgressIndicator())),
        child: Container(
          height: Get.height,
          padding: const EdgeInsets.symmetric(horizontal: Common.paddingHorizontal),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Hi I am ',
                          style: Get.textTheme.displayMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              height: 13.pxToDouble,
                              // color: Colors.black,
                              letterSpacing: 3),
                        ),
                        Obx(() {
                          return Text(
                            state.mainData.value.hiIam,
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
                        state.mainData.value.iam,
                        style: Get.textTheme.headlineMedium?.copyWith(
                            height: 18.pxToDouble,
                            // color: Colors.black.withOpacity(.6),
                            letterSpacing: 2.4),
                      );
                    }),
                    12.zh,
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: Obx(() {
                        return Text(
                          state.mainData.value.descriptionIam,
                          textAlign: TextAlign.justify,
                          style: Get.textTheme.labelMedium?.copyWith(
                              height: 21.pxToDouble,
                              fontWeight: FontWeight.w400,
                              letterSpacing: .8),
                        );
                      }),
                    ),
                    24.zh,
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16))),
                        // backgroundColor: Colors.black,
                      ),
                      child: const Text('Download CV'),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/your-experience-e1a8d.appspot.com/o/home_image.png?alt=media&token=ce3317b7-c121-4a08-bcc1-8d48b8d6a6c1',
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
              )),
            ],
          ),
        ),
      );
    });
  }
}
