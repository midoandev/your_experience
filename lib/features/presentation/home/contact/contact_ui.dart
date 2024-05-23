import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';

import '../../../../utility/shared/constants/common.dart';
import 'contact_logic.dart';

class ContactUi extends StatelessWidget {
  ContactUi({super.key});

  final logic = Get.put(ContactLogic());
  final state = Get.find<ContactLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height - Common.heightToolbar,
      padding: const EdgeInsets.symmetric(horizontal: Common.paddingHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Contact Me',
            textAlign: TextAlign.center,
            style: Get.textTheme.headlineMedium!.copyWith(
              // color: Colors.black,
              height: 21.pxToDouble,
              letterSpacing: 3,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            width: Get.width * .6,
            child: Text(
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At',
              textAlign: TextAlign.center,
              style: Get.textTheme.labelLarge!.copyWith(
                // color: Colors.black45,
                height: 18.pxToDouble,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              inputBorder(title: 'Name', hint: 'Full Name'),
              const SizedBox(width: 24),
              inputBorder(
                  title: 'Email Address',
                  textInputType: TextInputType.emailAddress,
                  hint: 'contact@you.com'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              inputBorder(
                  title: 'Phone',
                  textInputType: TextInputType.phone,
                  hint: '08xx xxxx xxxx'),
              const SizedBox(width: 24),
              inputBorder(title: 'Subject', hint: 'Ex. New Project'),
            ],
          ),
          SizedBox(
            height: 150,
            child: inputBorder(
                title: 'Message',
                hint: 'Please write your Message',
                textInputType: TextInputType.multiline,
                minLine: 2,
                maxLine: null),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              // backgroundColor: Colors.black,
            ),
            child: const Text('Send Message'),
          ),

          // ExpansionTile(
          //   title: Text("Are you open for freelance / contract work?"),
          //   children: [
          //     Text(
          //         "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,"),
          //   ],
          // )
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
    return SizedBox(
      width: minLine != null ? Get.width : Get.width/2.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 16),
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
        ],
      ),
    );
  }
}
