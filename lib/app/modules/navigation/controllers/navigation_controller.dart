import 'package:get/get.dart';

class NavigationController extends GetxController {
  //TODO: Implement NavigationController

  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
    Get.reloadAll();
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {}
  // void increment() => count.value++;
}
