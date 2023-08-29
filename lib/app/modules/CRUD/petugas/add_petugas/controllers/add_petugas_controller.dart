import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddPetugasController extends GetxController {
  PetugasModel? petugasModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  TextEditingController nikC = TextEditingController();
  TextEditingController namaC = TextEditingController();
  TextEditingController notlpC = TextEditingController();
  TextEditingController emailC = TextEditingController();

  RxBool isNikValid = false.obs; // Tambahkan ini

  @override
  onClose() {
    nikC.dispose();
    namaC.dispose();
    notlpC.dispose();
    emailC.dispose();
  }

  Future addPost() async {
    update();
    petugasModel = await PetugasApi().addPetugasApi(nikC.text, namaC.text);
    if (petugasModel!.status == 200) {
      update();
      Get.offAndToNamed(Routes.HOME); //ganti route sesuai data menu
    } else if (petugasModel!.status == 404) {
      update();
    }
  }

  // Tambahkan fungsi untuk memperbarui nilai isNikValid
  void updateIsNikValid() {
    isNikValid.value = nikC.text.isNotEmpty;
  }
}