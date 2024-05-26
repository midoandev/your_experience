import 'package:get/get.dart';

import 'editor_content_logic.dart';


class EditorContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditorContentLogic());
  }
}
