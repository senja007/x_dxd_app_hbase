import 'package:get/get.dart';

import '../controllers/unit_usaha_controller.dart';

class UnitUsahaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UnitUsahaController>(
      () => UnitUsahaController(),
    );
  }
}
