import 'package:firebase_cached_image/firebase_cached_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';

import 'home_page_logic.dart';

class HomePageUi extends StatelessWidget {
  const HomePageUi({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(HomePageLogic());
    final state = Get
        .find<HomePageLogic>()
        .state;

    return Obx(() {
      return Visibility(
        visible: state.mainData.value.iam.isNotEmpty,
        replacement: SizedBox(
            height: Get.height,
            child: const Center(child: CircularProgressIndicator())),
        child: Container(
          height: Get.height,
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                              color: Colors.black,
                              letterSpacing: 3),
                        ),
                        Obx(() {
                          return Text(
                            state.mainData.value.hiIam,
                            style: Get.textTheme.displayMedium?.copyWith(
                                height: 13.pxToDouble,
                                color: Colors.black,
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
                            color: Colors.black.withOpacity(.6),
                            letterSpacing: 2.4),
                      );
                    }),
                    const SizedBox(height: 12),
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
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(8), // Radius tombol
                        ),
                        backgroundColor: Colors.black,
                      ),
                      child: Text('Download CV',
                          style: Get.textTheme.labelSmall!
                              .copyWith(color: Colors.white)),
                    )
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
