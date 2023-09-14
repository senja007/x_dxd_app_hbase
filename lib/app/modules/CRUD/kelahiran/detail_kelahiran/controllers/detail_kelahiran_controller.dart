import 'package:crud_flutter_api/app/data/kelahiran_model.dart';
import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/kelahiran_api.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_alert_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailKelahiranController extends GetxController {
  final Map<String, dynamic> argsData = Get.arguments;
  KelahiranModel? kelahiranModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  RxBool isEditing = false.obs;
  TextEditingController idKejadianC = TextEditingController();
  TextEditingController eartagIndukC = TextEditingController();
  TextEditingController eartagAnakC = TextEditingController();
  TextEditingController idHewanIndukC = TextEditingController();
  TextEditingController idHewanAnakC = TextEditingController();
  TextEditingController idBatchStrawC = TextEditingController();
  TextEditingController idPejantanStrawC = TextEditingController();
  TextEditingController jenisKelaminAnakC = TextEditingController();
  TextEditingController jumlahC = TextEditingController();
  TextEditingController urutanIbC = TextEditingController();
  TextEditingController kartuTernakAnakC = TextEditingController();
  TextEditingController kartuTernakIndukC = TextEditingController();
  TextEditingController kategoriC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  TextEditingController idPeternakC = TextEditingController();
  TextEditingController namaPeternakC = TextEditingController();
  TextEditingController petugasPelaporC = TextEditingController();
  TextEditingController produsenStrawC = TextEditingController();
  TextEditingController spesiesIndukC = TextEditingController();
  TextEditingController spesiesPejantanC = TextEditingController();
  TextEditingController tanggalLahirC = TextEditingController();
  TextEditingController tanggalLaporanC = TextEditingController();
  @override
  onClose() {
    idKejadianC.dispose();
    eartagIndukC.dispose();
    eartagAnakC.dispose();
    idHewanIndukC.dispose();
    idHewanAnakC.dispose();
    idBatchStrawC.dispose();
    idPejantanStrawC.dispose();
    jenisKelaminAnakC.dispose();
    jumlahC.dispose();
    urutanIbC.dispose();
    kartuTernakAnakC.dispose();
    kartuTernakIndukC.dispose();
    kategoriC.dispose();
    lokasiC.dispose();
    idPeternakC.dispose();
    namaPeternakC.dispose();
    petugasPelaporC.dispose();
    produsenStrawC.dispose();
    spesiesIndukC.dispose();
    spesiesPejantanC.dispose();
    tanggalLahirC.dispose();
    tanggalLaporanC.dispose();
  }

  @override
  void onInit() {
    super.onInit();

    idKejadianC.text = argsData["id_kejadian_detail"];
    eartagIndukC.text = argsData["eartag_induk_detail"];
    eartagAnakC.text = argsData["eartag_anak_detail"];
    idHewanIndukC.text = argsData["id_hewan_induk_detail"];
    idHewanAnakC.text = argsData["id_hewan_anak_detail"];
    idBatchStrawC.text = argsData["id_batch_detail"];
    idPejantanStrawC.text = argsData["id_pejantan_detail"];
    jenisKelaminAnakC.text = argsData["kelamin_anak_detail"];
    jumlahC.text = argsData["jumlah_detail"];
    urutanIbC.text = argsData["urutan_ib_detail"];
    kartuTernakAnakC.text = argsData["kartu_ternak_anak_detail"];
    kartuTernakIndukC.text = argsData["kartu_ternak_induk_detail"];
    kategoriC.text = argsData["kategori_detail"];
    lokasiC.text = argsData["lokasi_detail"];
    idPeternakC.text = argsData["id_peternak_detail"];
    namaPeternakC.text = argsData["nama_peternak_detail"];
    petugasPelaporC.text = argsData["petugas_pelapor_detail"];
    produsenStrawC.text = argsData["produsen_detail"];
    spesiesIndukC.text = argsData["spesies_induk_detail"];
    spesiesPejantanC.text = argsData["spesies_pejantan_detail"];
    tanggalLahirC.text = argsData["tanggal_lahir_detail"];
    tanggalLaporanC.text = argsData["tanggal_laporan_detail"];
  }

  Future<void> deletePost() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Hapus data todo",
      message: "Apakah anda ingin menghapus data todo ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back(); // close modal
        // update();
        // kelahiranModel = await KelahiranApi().deleteKelahiranAPI(argsData["id_kejadian_detail"]);
        // if (petugasModel!.status == 200) {
        //   update();
        //   Get.offAndToNamed(Routes.HOME);
        // }
      },
    );
  }
}