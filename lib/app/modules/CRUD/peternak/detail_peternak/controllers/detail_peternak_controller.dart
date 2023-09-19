import 'package:crud_flutter_api/app/data/peternak_model.dart';
import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/peternak_api.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_alert_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailPeternakController extends GetxController {
  //TODO: Implement DetailPostController
  final Map<String, dynamic> argsData = Get.arguments;
  PeternakModel? peternakModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  RxBool isEditing = false.obs;

  TextEditingController idPeternakC = TextEditingController();
  TextEditingController nikPeternakC = TextEditingController();
  TextEditingController namaPeternakC = TextEditingController();
  TextEditingController idISIKHNASC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  TextEditingController petugasPendaftarC = TextEditingController();
  TextEditingController tanggalPendaftaranC = TextEditingController();

  @override
  onClose() {
    idPeternakC.dispose();
    nikPeternakC.dispose();
    namaPeternakC.dispose();
    idISIKHNASC.dispose();
    lokasiC.dispose();
    petugasPendaftarC.dispose();
    tanggalPendaftaranC.dispose();
  }

  @override
  void onInit() {
    super.onInit();

    idPeternakC.text = argsData["idPeternak"];
    nikPeternakC.text = argsData["nikPeternak"];
    namaPeternakC.text = argsData["namaPeternak"];
    idISIKHNASC.text = argsData["idISIKHNAS"];
    lokasiC.text = argsData["lokasi"];
    petugasPendaftarC.text = argsData["petugasPendaftar"];
    tanggalPendaftaranC.text = argsData["tanggalPendaftaran"];
  }


  
  Future<void> tombolEdit() async {
    isEditing.value = true;
    update();
  }

  Future<void> tutupEdit() async {
    isEditing.value = false;
  }


  Future<void> deletePeternak() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Hapus data Peternak",
      message: "Apakah anda ingin menghapus data Peternak ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        // Get.back(); // close modal
        // update();
        // peternakModel = await PeternakApi().deletePeternakApi(argsData["id"]);
        if (peternakModel!.status == 200) {
          update();
          Get.offAndToNamed(Routes.HOME);
        }
      },
    );
  }

  Future<void> editPeternak() async {
    CustomAlertDialog.showPresenceAlert(
      title: "edit data Peternak",
      message: "Apakah anda ingin mengedit data Peternak ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back(); // close modal
        update();
        peternakModel = await PeternakApi().editPeternakApi(
          idPeternakC.text,
          nikPeternakC.text,
          namaPeternakC.text,
          idISIKHNASC.text,
          lokasiC.text,
          petugasPendaftarC.text,
          tanggalPendaftaranC.text,
        );
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
