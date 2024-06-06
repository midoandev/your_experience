import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quill_html_editor/quill_html_editor.dart';
import 'package:your_experience/utility/shared/widgets/body_widget/button_inkwell.dart';

import '../../../../utility/shared/constants/common.dart';
import 'editor_content_logic.dart';

class EditorContentUi extends StatelessWidget {
  static const String namePath = '/edit-portfolio';

  EditorContentUi({super.key});

  final logic = Get.find<EditorContentLogic>();
  final state = Get.find<EditorContentLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(isSmallerThanDesktop ? 169 : 98),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonInkWell(
                          child: const Icon(
                            Icons.arrow_circle_left,
                            size: 24,
                          ),
                          onPress: () => Get.back()),
                      ButtonInkWell(
                          onPress: logic.saveEditor,
                          child: const Icon(
                            Icons.save_as,
                            size: 24,
                          )),
                    ],
                  ),
                ),
                ToolBar(
                  padding: const EdgeInsets.all(8),
                  iconSize: 20,
                  controller: logic.controller,
                ),
              ],
            )),
        body: QuillHtmlEditor(
          // text: state.initText.value,
          hintText: 'Type something',
          controller: logic.controller,
          backgroundColor: Get.theme.scaffoldBackgroundColor,
          minHeight: Get.height,
          hintTextAlign: TextAlign.start,
          textStyle: Get.textTheme.bodyMedium,
          padding:
              EdgeInsets.only(left: isSmallerThanDesktop ? 16 : 10, top: 5),
          hintTextPadding: EdgeInsets.zero,
          loadingBuilder: (context) {
            return const Center(
                child: CircularProgressIndicator(
              strokeWidth: 0.4,
            ));
          },
        ));
  }
}
