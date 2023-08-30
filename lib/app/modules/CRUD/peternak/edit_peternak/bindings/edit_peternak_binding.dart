import 'package:get/get.dart';

import '../controllers/edit_peternak_controller.dart';

class EditPeternakBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditPeternakController>(
      () => EditPeternakController(),
    );
  }
}
