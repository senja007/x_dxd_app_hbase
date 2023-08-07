import 'package:get/get.dart';

import '../controllers/pakan_controller.dart';

class PakanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PakanController>(
      () => PakanController(),
    );
  }
}
