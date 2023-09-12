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

 TextEditingController idPeternakC = TextEditingController();
  TextEditingController idIsikhnasC = TextEditingController();
  TextEditingController nikPeternakC = TextEditingController();
  TextEditingController namaPeternakC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  TextEditingController petugasPendaftarC = TextEditingController();
  TextEditingController tanggalPendaftaranC = TextEditingController();

  @override
  onClose() {
    idPeternakC.dispose();
    idIsikhnasC.dispose();
    nikPeternakC.dispose();
    namaPeternakC.dispose();
    lokasiC.dispose();
    tanggalPendaftaranC.dispose();
    petugasPendaftarC.dispose();
  } 

  @override
  void onInit() {
    super.onInit();

    idPeternakC.text = argsData["detail_id_peternak"];
    idIsikhnasC.text = argsData["detail_id_isikhnas"];
    nikPeternakC.text = argsData["detail_nik"];
    namaPeternakC.text = argsData["detail_nama"];
    lokasiC.text = argsData["detail_lokasi"];
    tanggalPendaftaranC.text = argsData["detail_tanggal_pendaftaran"];
    petugasPendaftarC.text = argsData["detail_petugas_pendaftar"];
  }

  Future<void> deletePost() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Hapus data todo",
      message: "Apakah anda ingin menghapus data todo ini ?",
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
}
