import 'package:get/get.dart';

import '../controllers/edit_pengobatan_controller.dart';

class EditPengobatanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditPengobatanController>(
      () => EditPengobatanController(),
    );
  }
}
