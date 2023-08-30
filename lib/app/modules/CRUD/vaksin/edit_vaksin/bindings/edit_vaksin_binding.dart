import 'package:get/get.dart';

import '../controllers/edit_vaksin_controller.dart';

class EditVaksinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditVaksinController>(
      () => EditVaksinController(),
    );
  }
}
