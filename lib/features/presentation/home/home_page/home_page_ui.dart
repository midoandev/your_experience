import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';

import 'home_page_logic.dart';

class HomePageUi extends StatelessWidget {
  const HomePageUi({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(HomePageLogic());
    final state = Get.find<HomePageLogic>().state;

    return Container(
      height: Get.height,
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Hi I am ',
                      style: Get.textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          height: 13.pxToDouble,
                          color: Colors.black.withOpacity(.6),
                          letterSpacing: 3),
                    ),
                    Text(
                      'Mido',
                      style: Get.textTheme.displayMedium?.copyWith(
                          height: .8.pxToDouble,
                          color: Colors.black,
                          letterSpacing: 8),
                    ),
                  ],
                ),
                Text(
                  'I am Mobile Developer',
                  style: Get.textTheme.titleLarge?.copyWith(
                      height: 20.pxToDouble,
                      color: Colors.black.withOpacity(.6),
                      letterSpacing: 2.4),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Text(
                    'Welcome to my official Portfolio website, explore a comprehensive collection of my projects carefully crafted using the versatile platforms Flutter and React Native.',
                    textAlign: TextAlign.justify,
                    style: Get.textTheme.labelMedium?.copyWith(
                        height: 21.pxToDouble,
                        fontWeight: FontWeight.w400,
                        letterSpacing: .8),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Radius tombol
                    ),
                    backgroundColor: Colors.black,
                  ),
                  child: Text('Download CV'.tr,
                      style: Get.textTheme.labelSmall!
                          .copyWith(color: Colors.white)),
                )
              ],
            ),
          ),
          Expanded(
              child: Image.asset(
                'assets/images/home_image.png',
                scale: .9,
              ))
        ],
      ),
    );
  }
}
