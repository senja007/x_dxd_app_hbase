import 'package:get/get.dart';

class SidebarController extends GetxController {
  //TODO: Implement SidebarController
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
  // void increment() => tabIndex.value++;
}
