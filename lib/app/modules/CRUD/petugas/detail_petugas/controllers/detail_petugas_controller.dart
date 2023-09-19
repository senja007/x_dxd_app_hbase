import 'package:crud_flutter_api/app/data/petugas_model.dart';
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
  late FocusNode namaFocusNode;

  String originalNik = "";
  String originalNama = "";
  String originalTlp = "";
  String originalEmail = "";

  TextEditingController nikC = TextEditingController();
  TextEditingController namaC = TextEditingController();
  TextEditingController tlpC = TextEditingController();
  TextEditingController emailC = TextEditingController();

  @override
  onClose() {
    namaFocusNode.dispose();
    nikC.dispose();
    namaC.dispose();
    tlpC.dispose();
    emailC.dispose();
  }

  @override
  void onInit() {
    namaFocusNode = FocusNode();
    super.onInit();

    // Buat Detail Data
    nikC.text = argsData["nikPetugas"];
    namaC.text = argsData["namaPetugas"];
    tlpC.text = argsData["noTelp"];
    emailC.text = argsData["email"];

    // Buat batal edit
    originalNik = argsData["nikPetugas"];
    originalNama = argsData["namaPetugas"];
    originalTlp = argsData["noTelp"];
    originalEmail = argsData["email"];
  }

  Future<void> tombolEdit() async {
    isEditing.value = true;
    update();
  }

  Future<void> tutupEdit() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Batal Edit",
      message: "Apakah anda ingin keluar dari edit ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back();
        update();
        // Reset data ke yang sebelumnya
        nikC.text = originalNik;
        namaC.text = originalNama;
        tlpC.text = originalTlp;
        emailC.text = originalEmail;
        isEditing.value = false;
      },
    );
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
            await PetugasApi().deletePetugasApi(argsData["nikPetugas"]);
        // if (petugasModel!.status == 200) {
        //   update();
        //   Get.offAndToNamed(Routes.HOME);
        // }
      },
    );
  }

  Future<void> editPetugas() async {
    CustomAlertDialog.showPresenceAlert(
      title: "edit data Petugas",
      message: "Apakah anda ingin mengedit data ini data Petugas ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back(); // close modal
        update();
        petugasModel = await PetugasApi()
            .editPetugasApi(nikC.text, namaC.text, tlpC.text, emailC.text);
        isEditing.value = false;
        // await PetugasApi().editPetugasApi(argsData["nikPetugas"], argsData["namaPetugas"], argsData["noTelp"],argsData["email"]);
        // if (petugasModel!.status == 200) {
        //   update();
        //   Get.offAndToNamed(Routes.HOME);
        // }
      },
    );
  }
}
