import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EditPetugasController extends GetxController {
  //TODO: Implement EditPostController
  PetugasModel? petugasModel;
  final Map<String, dynamic> argsData = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreatePost = false.obs;

  TextEditingController contentC = TextEditingController();
  @override
  onClose() {
    contentC.dispose();
  }

  @override
  void onInit() {
    super.onInit();

    contentC.text = argsData["content"];
  }

  Future<void> editPost() async {
    update();
    petugasModel =
        await PetugasApi().editPetugasApi(contentC.text, argsData["id"]);
    if (petugasModel!.status == 200) {
      update();
      Get.offAndToNamed(Routes.HOME);
    } else if (petugasModel!.status == 404) {
      update();
    }
  }
}
