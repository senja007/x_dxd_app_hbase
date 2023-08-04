import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../../sidebar/controllers/sidebar_controller.dart';
import '../../user/controllers/user_controller.dart';
import '../controllers/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(
      () => NavigationController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<SidebarController>(
      () => SidebarController(),
    );
    Get.lazyPut<UserController>(
      () => UserController(),
    );
  }
}
