import 'package:crud_flutter_api/app/data/post_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/post_api.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EditPostController extends GetxController {
  //TODO: Implement EditPostController
  PostModel? postModel;
  final Map<String, dynamic> argsData = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreatePost = false.obs;
  TextEditingController titleC = TextEditingController();
  TextEditingController contentC = TextEditingController();
  @override
  onClose() {
    titleC.dispose();
    contentC.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    titleC.text = argsData["title"];
    contentC.text = argsData["content"];
  }

  Future<void> editPost() async {
    update();
    postModel =
        await PostApi().editPostAPI(titleC.text, contentC.text, argsData["id"]);
    if (postModel!.status == 200) {
      update();
      Get.offAndToNamed(Routes.HOME);
    } else if (postModel!.status == 404) {
      update();
    }
  }
}
