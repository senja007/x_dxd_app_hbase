import 'package:get/get.dart';

import '../controllers/edit_hewan_controller.dart';

class EditHewanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditHewanController>(
      () => EditHewanController(),
    );
  }
}
