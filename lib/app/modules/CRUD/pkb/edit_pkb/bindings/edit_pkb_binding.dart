import 'package:get/get.dart';

import '../controllers/edit_pkb_controller.dart';

class EditPkbBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditPkbController>(
      () => EditPkbController(),
    );
  }
}
