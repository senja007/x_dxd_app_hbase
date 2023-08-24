import 'package:get/get.dart';

import '../controllers/buku_lahir_controller.dart';

class BukuLahirBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BukuLahirController>(
      () => BukuLahirController(),
    );
  }
}
