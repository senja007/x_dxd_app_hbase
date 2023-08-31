import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddPeternakController extends GetxController {
  PetugasModel? petugasModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  TextEditingController titleC = TextEditingController();
  TextEditingController contentC = TextEditingController();
  @override
  onClose() {
    titleC.dispose();
    contentC.dispose();
  }

  Future addPost() async {
    update();
  //  petugasModel = await PetugasApi().addPetugasApi(titleC.text, contentC.text);
    if (petugasModel!.status == 200) {
      update();
      Get.offAndToNamed(Routes.HOME); //ganti route sesuai data menu
    } else if (petugasModel!.status == 404) {
      update();
    }
  }
}
