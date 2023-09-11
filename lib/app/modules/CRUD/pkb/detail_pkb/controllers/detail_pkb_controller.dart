import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/data/pkb_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:crud_flutter_api/app/services/pkb_api.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_alert_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailPkbController extends GetxController {
  final Map<String, dynamic> argsData = Get.arguments;
  PKBModel? pkbModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;

  TextEditingController idKejadianC = TextEditingController();
  TextEditingController idHewanC = TextEditingController();
  TextEditingController idPeternakC = TextEditingController();
  TextEditingController nikC = TextEditingController();
  TextEditingController namaPeternakC = TextEditingController();
  TextEditingController jumlahC = TextEditingController();
  TextEditingController kategoriC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  TextEditingController spesiesC = TextEditingController();
  TextEditingController umurKebuntinganC = TextEditingController();
  TextEditingController pemeriksaKebuntingaC = TextEditingController();
  TextEditingController tanggalPkbC = TextEditingController();

  @override
  onClose() {
    pemeriksaKebuntingaC.dispose();
    tanggalPkbC.dispose();
    spesiesC.dispose();
    umurKebuntinganC.dispose();
    kategoriC.dispose();
    lokasiC.dispose();
    namaPeternakC.dispose();
    jumlahC.dispose();
    idPeternakC.dispose();
    nikC.dispose();
    idKejadianC.dispose();
    idHewanC.dispose();
  }

  @override
  void onInit() {
    super.onInit();

    idKejadianC.text = argsData["detail_id_kejadian"];
    idHewanC.text = argsData["detail_id_hewan"];
    idPeternakC.text = argsData["detail_id_peternak"];
    nikC.text = argsData["detail_nik"];
    namaPeternakC.text = argsData["detail_nama"];
    jumlahC.text = argsData["detail_jumlah"];
    kategoriC.text = argsData["detail_kategori"];
    lokasiC.text = argsData["detail_lokasi"];
    spesiesC.text = argsData["detail_spesies"];
    umurKebuntinganC.text = argsData["detail_umur"];
    pemeriksaKebuntingaC.text = argsData["detail_pemeriksa"];
    tanggalPkbC.text = argsData["detail_tanggal"];
  }

  Future<void> deletePost() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Hapus data Petugas",
      message: "Apakah anda ingin menghapus data Petugas ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back(); // close modal
        update();
        pkbModel = await PKBApi().deletePKBAPI(argsData["id_kejadian"]);
      },
    );
  }
}



// import 'package:crud_flutter_api/app/data/petugas_model.dart';
// import 'package:crud_flutter_api/app/routes/app_pages.dart';
// import 'package:crud_flutter_api/app/services/petugas_api.dart';
// import 'package:crud_flutter_api/app/widgets/message/custom_alert_dialog.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

// class DetailPkbController extends GetxController {
//   //TODO: Implement DetailPostController
//   final Map<String, dynamic> argsData = Get.arguments;
//   PetugasModel? petugasModel;
//   RxBool isLoading = false.obs;
//   RxBool isLoadingCreateTodo = false.obs;

//   TextEditingController contentC = TextEditingController();
//   @override
//   onClose() {
//     contentC.dispose();
//   }

//   @override
//   void onInit() {
//     super.onInit();

//     contentC.text = argsData["content"];
//   }

//   Future<void> deletePost() async {
//     CustomAlertDialog.showPresenceAlert(
//       title: "Hapus data todo",
//       message: "Apakah anda ingin menghapus data todo ini ?",
//       onCancel: () => Get.back(),
//       onConfirm: () async {
//         Get.back(); // close modal
//         update();
//         petugasModel = await PetugasApi().deletePetugasApi(argsData["id"]);
//         if (petugasModel!.status == 200) {
//           update();
//           Get.offAndToNamed(Routes.HOME);
//         }
//       },
//     );
//   }
// }
