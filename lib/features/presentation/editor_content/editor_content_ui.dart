import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quill_html_editor/quill_html_editor.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'editor_content_logic.dart';

class EditorContentUi extends StatelessWidget {
  EditorContentUi({super.key});

  final logic = Get.find<EditorContentLogic>();
  final state = Get.find<EditorContentLogic>().state;

  @override
  Widget build(BuildContext context) {
    final isSmallerThanDesktop =
        ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: ToolBar(
            toolBarColor: Colors.cyan.shade50,
            activeIconColor: Colors.green,
            padding: const EdgeInsets.all(8),
            iconSize: 20,
            controller: state.controller,
          )),
      body: QuillHtmlEditor(
        text: "<h1>Hello</h1>This is a quill html editor example 😊",
        hintText: 'Hint text goes here',
        controller: state.controller,
        isEnabled: true,
        minHeight: Get.height,
        hintTextAlign: TextAlign.start,
        padding: EdgeInsets.only(left: isSmallerThanDesktop ? 16 : 10, top: 5),
        hintTextPadding: EdgeInsets.zero,
        onFocusChanged: (hasFocus) => debugPrint('has focus $hasFocus'),
        onTextChanged: (text) => debugPrint('widget text change $text'),
        onEditorCreated: () => debugPrint('Editor has been loaded'),
        onEditingComplete: (s) => debugPrint('Editing completed $s'),
        onEditorResized: (height) => debugPrint('Editor resized $height'),
        onSelectionChanged: (sel) => debugPrint('${sel.index},${sel.length}'),
        loadingBuilder: (context) {
          return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 0.4,
          ));
        },
      ),
    );
  }
}
