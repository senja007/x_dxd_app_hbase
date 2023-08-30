import 'package:get/get.dart';

import '../controllers/edit_kelahiran_controller.dart';

class EditKelahiranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditKelahiranController>(
      () => EditKelahiranController(),
    );
  }
}
