import 'package:get/get.dart';

import '../controllers/edit_inseminasi_controller.dart';

class EditInseminasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditInseminasiController>(
      () => EditInseminasiController(),
    );
  }
}
