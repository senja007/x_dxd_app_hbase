import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  navigateToPage(int index) {
    if (index == 0) {
      Get.toNamed(Routes.PETUGAS);
    } else if (index == 1) {
      Get.toNamed(Routes.KANDANG);
    } else if (index == 2) {
      Get.toNamed(Routes.PAKAN);
    } else if (index == 3) {
      Get.toNamed(Routes.BUKU_LAHIR);
    } else if (index == 4) {
      Get.toNamed(Routes.PEMILIK);
    } else if (index == 5) {
      Get.toNamed(Routes.KARTU_TERNAK);
    } else if (index == 6) {
      Get.toNamed(Routes.MUTASI);
    }
    if (index == 7) {
      Get.toNamed(Routes.PRODUKSI);
    }
  }
}
