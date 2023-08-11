import 'package:get/get.dart';

class UserController extends GetxController {
  //TODO: Implement UserController
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

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
  // void increment() => count.value++;
}
