import 'package:get/get.dart';

import '../controllers/detail_peternak_controller.dart';

class DetailKandangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailKandangController>(
      () => DetailKandangController(),
    );
  }
}
