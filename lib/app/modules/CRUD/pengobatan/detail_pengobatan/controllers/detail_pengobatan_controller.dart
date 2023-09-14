import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_alert_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailPengobatanController extends GetxController {
  //TODO: Implement DetailPostController
  final Map<String, dynamic> argsData = Get.arguments;
  PetugasModel? petugasModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  TextEditingController idKasusC = TextEditingController();
  TextEditingController namaInfrastrukturC = TextEditingController();
  TextEditingController dosisC = TextEditingController();
  TextEditingController sindromC = TextEditingController();
  TextEditingController dignosaBandingC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  TextEditingController namaPetugasC = TextEditingController();
  TextEditingController tanggalKasusC = TextEditingController();
  TextEditingController tanggalPengobatanC = TextEditingController();
  @override
  onClose() {
    idKasusC.dispose();
    namaInfrastrukturC.dispose();
    dosisC.dispose();
    sindromC.dispose();
    dignosaBandingC.dispose();
    lokasiC.dispose();
    namaPetugasC.dispose();
    tanggalKasusC.dispose();
    tanggalPengobatanC.dispose();
  }

  @override
  void onInit() {
    super.onInit();

    idKasusC.text = argsData["detail_id_kasus"];
    namaInfrastrukturC.text = argsData["detail_infrastruktur"];
    dosisC.text = argsData["detail_dosis"];
    sindromC.text = argsData["detail_sindrom"];
    dignosaBandingC.text = argsData["detail_diagnosa"];
    lokasiC.text = argsData["detail_lokasi"];
    namaPetugasC.text = argsData["detail_petugas_pendaftar"];
    tanggalKasusC.text = argsData["detail_tanggal_kasus"];
    tanggalPengobatanC.text = argsData["detail_tanggal_pengobatan"];
  }

  Future<void> deletePost() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Hapus data todo",
      message: "Apakah anda ingin menghapus data todo ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back(); // close modal
        update();
        petugasModel = await PetugasApi().deletePetugasApi(argsData["id"]);
        if (petugasModel!.status == 200) {
          update();
          Get.offAndToNamed(Routes.HOME);
        }
      },
    );
  }
}
