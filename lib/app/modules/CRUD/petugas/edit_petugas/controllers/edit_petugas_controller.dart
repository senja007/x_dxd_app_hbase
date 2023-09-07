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

  TextEditingController nikC = TextEditingController();
  TextEditingController namaC = TextEditingController();
  TextEditingController tlpC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  @override
  onClose() {
    nikC.dispose();
    namaC.dispose();
    tlpC.dispose();
    emailC.dispose();
  }

  @override
  void onInit() {
    super.onInit();

    nikC.text = argsData["nik_petugas_edit"];
    namaC.text = argsData["nama_petugas_edit"];
    tlpC.text = argsData["telepon_petugas_edit"];
    emailC.text = argsData["email_petugas_edit"];
  }

  Future<void> editPetugas() async {
    update();
    petugasModel =
        await PetugasApi().editPetugasApi(nikC.text, namaC.text, tlpC.text, emailC.text);
    if (petugasModel!.status == 201) {
      update();
      Get.offAndToNamed(Routes.HOME);
    } else if (petugasModel!.status == 404) {
      update();
    }
  }
}
