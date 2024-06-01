import 'package:get/get.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

import 'editor_content_state.dart';

class EditorContentLogic extends GetxController {
  final EditorContentState state = EditorContentState();

  late QuillEditorController controller = QuillEditorController();

  @override
  void onInit() async {
    var arg = Get.arguments;
    Get.log('dkasdmkn $arg');
    controller.setText(arg);
    super.onInit();
  }

  saveEditor() async{
    var plaint = await controller.getText();
    Get.log('smkdnksndk $plaint');
    Get.back(result: plaint);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
