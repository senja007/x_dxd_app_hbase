import 'package:get/get.dart';

import '../controllers/kartu_ternak_controller.dart';

class KartuTernakBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KartuTernakController>(
      () => KartuTernakController(),
    );
  }
}
