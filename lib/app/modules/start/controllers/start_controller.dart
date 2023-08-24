import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:crud_flutter_api/app/data/user_model.dart';
import 'package:crud_flutter_api/app/services/auth_api.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

class StartController extends GetxController with GetTickerProviderStateMixin {
  UserModel? userModel;
  final box = GetStorage();
  bool startScreen = false;
  AnimationController? animationController;

  @override
  void onInit() {
    // TODO: implement onInit
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 8));
    animationController?.animateTo(0.0);
    super.onInit();
  }

  @override
  void onClose() {
    animationController?.dispose();
    super.onClose();
  }
}
