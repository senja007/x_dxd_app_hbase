import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_alert_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailPetugasController extends GetxController {
  final Map<String, dynamic> argsData = Get.arguments;
  PetugasModel? petugasModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  RxBool isEditing = false.obs;

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
    isEditing.value = false;

    nikC.text = argsData["nik_petugas_detail"];
    namaC.text = argsData["nama_petugas_detail"];
    tlpC.text = argsData["telepon_petugas_detail"];
    emailC.text = argsData["email_petugas_detail"];
  }

  Future<void> deletePost() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Hapus data Petugas",
      message: "Apakah anda ingin menghapus data Petugas ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back(); // close modal
        update();
        petugasModel =
            await PetugasApi().deletePetugasApi(argsData["nik_petugas_detail"]);
        // if (petugasModel!.status == 200) {
        //   update();
        //   Get.offAndToNamed(Routes.HOME);
        // }
      },
    );
  }
}
