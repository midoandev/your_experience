import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';

import '../../../../utility/shared/constants/common.dart';
import 'contact_logic.dart';

class ContactUi extends GetView<ContactLogic> {
  const ContactUi({super.key});
  @override
  Widget build(BuildContext context) {
    final logic = controller;
    final state = controller.state;
    final isSmallerThanDesktop =
        ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
    final double height =
        isSmallerThanDesktop ? Get.height * .2 : (-Common.heightToolbar);
    return SizedBox(
      height: height + Get.height,
      child: ResponsiveRowColumn(
        rowSpacing: 32,
        columnSpacing: 16,
        columnVerticalDirection: VerticalDirection.down,
        rowMainAxisAlignment: MainAxisAlignment.center,
        columnMainAxisAlignment: MainAxisAlignment.center,
        rowPadding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        columnPadding: const EdgeInsets.all(32),
        layout: isSmallerThanDesktop
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Information',
                    textAlign: TextAlign.center,
                    style: Get.textTheme.headlineMedium!.copyWith(
                      // color: Colors.black,
                      height: 21.pxToDouble,
                      letterSpacing: 3,
                    ),
                  ),
                  12.zh,
                  Text(
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At',
                    textAlign: TextAlign.justify,
                    style: Get.textTheme.labelLarge!.copyWith(
                      // color: Colors.black45,
                      height: 21.pxToDouble,
                    ),
                  ),
                  16.zh,
                  itemSocialMedia(name: 'andev.mido@gmail.com', icon: Icons.mail_outlined),
                  itemSocialMedia(name: 'midoandev', icon: FontAwesomeIcons.github),
                  itemSocialMedia(name: 'Yogyakarta, DIY, Indonesia', icon: Icons.location_on_outlined),
                ],
              ),
            ),
          ),
          ResponsiveRowColumnItem(
              rowFlex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  inputBorder(title: 'Name', hint: 'Full Name'),
                  inputBorder(
                      title: 'Email Address',
                      textInputType: TextInputType.emailAddress,
                      hint: 'contact@you.com'),
                  inputBorder(title: 'Subject', hint: 'Ex. New Project'),
                  inputBorder(
                      title: 'Message',
                      hint: 'Please write your Message',
                      textInputType: TextInputType.multiline,
                      minLine: 2,
                      maxLine: null),
                  24.zh,
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      // backgroundColor: Colors.black,
                    ),
                    child: const Text('Send Message'),
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget itemSocialMedia({required String name, required IconData icon, double size = 24}){
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, size: size),
          12.zw,
          Text(
            name,
            textAlign: TextAlign.justify,
            style: Get.textTheme.labelMedium!.copyWith(
              // color: Colors.black45,
              height: 21.pxToDouble,
            ),
          ),
        ],
      ),
    );
  }
  Widget inputBorder(
      {required String title,
      required String hint,
      TextInputType? textInputType,
      int? minLine,
      int? maxLine}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Get.textTheme.bodyMedium!.copyWith(
            height: 21.pxToDouble,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: Get.textTheme.bodyMedium,
            border: const OutlineInputBorder(
                borderSide: BorderSide(
                  // color: Colors.grey,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.all(Radius.circular(16))),
          ),
          style: Get.textTheme.bodyMedium,
          minLines: minLine,
          maxLines: maxLine,
          keyboardType: textInputType,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your email address';
            }
            return null;
          },
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
