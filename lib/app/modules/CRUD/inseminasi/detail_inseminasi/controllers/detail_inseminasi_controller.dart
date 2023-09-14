import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_alert_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailInseminasiController extends GetxController {
  //TODO: Implement DetailPostController
  final Map<String, dynamic> argsData = Get.arguments;
  PetugasModel? petugasModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;

  TextEditingController idInseminasiC = TextEditingController();
  TextEditingController eartagC = TextEditingController();
  TextEditingController idHewanC = TextEditingController();
  TextEditingController idPembuatanC = TextEditingController();
  TextEditingController idPejantanC = TextEditingController();
  TextEditingController bangsaPejantanC = TextEditingController();
  TextEditingController ib1C = TextEditingController();
  TextEditingController ib2C = TextEditingController();
  TextEditingController ib3C = TextEditingController();
  TextEditingController ibLainC = TextEditingController();
  TextEditingController produsenC = TextEditingController();
  TextEditingController idPeternakC = TextEditingController();
  TextEditingController namaPeternakC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  TextEditingController inseminatorC = TextEditingController();
  TextEditingController tanggalIBC = TextEditingController();
  @override
  onClose() {
    idInseminasiC.dispose();
    eartagC.dispose();
    idHewanC.dispose();
    idPembuatanC.dispose();
    idPejantanC.dispose();
    bangsaPejantanC.dispose();
    ib1C.dispose();
    ib2C.dispose();
    ib3C.dispose();
    ibLainC.dispose();
    produsenC.dispose();
    idPeternakC.dispose();
    namaPeternakC.dispose();
    lokasiC.dispose();
    inseminatorC.dispose();
    tanggalIBC.dispose();
  }

  @override
  void onInit() {
    super.onInit();

    idInseminasiC.text = argsData["detail_id_inseminasi"];
    eartagC.text = argsData["detail_eartag"];
    idHewanC.text = argsData["detail_id_hewan"];
    idPembuatanC.text = argsData["detail_id_pembuatan"];
    idPejantanC.text = argsData["detail_id_pejantan"];
    bangsaPejantanC.text = argsData["detail_bangsa_pejantan"];
    ib1C.text = argsData["detail_ib1"];
    ib2C.text = argsData["detail_ib2"];
    ib3C.text = argsData["detail_ib3"];
    ibLainC.text = argsData["detail_iblain"];
    produsenC.text = argsData["detail_produsen"];
    idPeternakC.text = argsData["detail_id_peternak"];
    namaPeternakC.text = argsData["detail_nama_peternak"];
    lokasiC.text = argsData["detail_lokasi"];
    inseminatorC.text = argsData["detail_inseminator"];
    tanggalIBC.text = argsData["detail_tanggal_ib"];
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
