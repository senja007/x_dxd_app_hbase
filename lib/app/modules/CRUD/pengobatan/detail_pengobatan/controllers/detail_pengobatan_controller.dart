import 'package:crud_flutter_api/app/data/pengobatan_model.dart';
import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/pengobatan_api..dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_alert_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailPengobatanController extends GetxController {
  //TODO: Implement DetailPostController
  final Map<String, dynamic> argsData = Get.arguments;
  PengobatanModel? pengobatanModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  RxBool isEditing = false.obs;

  TextEditingController idKasusC = TextEditingController();
  TextEditingController tanggalPengobatanC = TextEditingController();
  TextEditingController tanggalKasusC = TextEditingController();
  TextEditingController namaPetugasC = TextEditingController();
  TextEditingController namaInfrastrukturC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  TextEditingController dosisC = TextEditingController();
  TextEditingController sindromC = TextEditingController();
  TextEditingController diagnosaBandingC = TextEditingController();
  @override
  onClose() {
    idKasusC.dispose();
    tanggalPengobatanC.dispose();
    tanggalKasusC.dispose();
    namaPetugasC.dispose();
    namaInfrastrukturC.dispose();
    lokasiC.dispose();
    dosisC.dispose();
    sindromC.dispose();
    diagnosaBandingC.dispose();
  }

  @override
  void onInit() {
    super.onInit();

    idKasusC.text = argsData["idKasus"];
    tanggalPengobatanC.text = argsData["tanggalPengobatan"];
    tanggalKasusC.text = argsData["tanggalKasus"];
    namaPetugasC.text = argsData["namaPetugas"];
    namaInfrastrukturC.text = argsData["namaInfrastruktur"];
    lokasiC.text = argsData["lokasi"];
    dosisC.text = argsData["dosis"];
    sindromC.text = argsData["sindrom"];
    diagnosaBandingC.text = argsData["diagnosaBanding"];
  }

  
  Future<void> tombolEdit() async {
    isEditing.value = true;
    update();
  }

  Future<void> tutupEdit() async {
    isEditing.value = false;
  }


  Future<void> deletePengobatan() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Hapus data Pengobatan",
      message: "Apakah anda ingin menghapus data ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back(); // close modal
        update();
        pengobatanModel =
            await PengobatanApi().deletePengobatanAPI(argsData["idKasus"]);
        if (pengobatanModel!.status == 200) {
          update();
          Get.offAndToNamed(Routes.HOME);
        }
      },
    );
  }

  Future<void> editPengobatan() async {
    CustomAlertDialog.showPresenceAlert(
      title: "edit data Pengobatan",
      message: "Apakah anda ingin mengedit data Pengobatan ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back(); // close modal
        update();
        pengobatanModel = await PengobatanApi().editPengobatanApi(
          idKasusC.text,
          tanggalPengobatanC.text,
          tanggalKasusC.text,
          namaPetugasC.text,
          namaInfrastrukturC.text,
          lokasiC.text,
          dosisC.text,
          sindromC.text,
          diagnosaBandingC.text,
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
