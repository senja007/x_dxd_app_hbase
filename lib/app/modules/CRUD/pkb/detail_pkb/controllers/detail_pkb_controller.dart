import 'package:crud_flutter_api/app/data/pkb_model.dart';
import 'package:crud_flutter_api/app/modules/menu/PKB/controllers/pkb_controller.dart';
import 'package:crud_flutter_api/app/services/pkb_api.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_alert_dialog.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/successMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailPkbController extends GetxController {
  final Map<String, dynamic> argsData = Get.arguments;
  PKBModel? pkbModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  RxBool isEditing = false.obs;

  TextEditingController idKejadianC = TextEditingController();
  TextEditingController idHewanC = TextEditingController();
  TextEditingController idPeternakC = TextEditingController();
  TextEditingController nikPeternakC = TextEditingController();
  TextEditingController namaPeternakC = TextEditingController();
  TextEditingController jumlahC = TextEditingController();
  TextEditingController kategoriC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  TextEditingController spesiesC = TextEditingController();
  TextEditingController umurKebuntinganC = TextEditingController();
  TextEditingController pemeriksaKebuntinganC = TextEditingController();
  TextEditingController tanggalPkbC = TextEditingController();

  String originalIdKejadian = "";
  String originalIdHewan = "";
  String originalIdPeternak = "";
  String originalNikPeternak = "";
  String originalNamapeternak = "";
  String originalJumlah = "";
  String originalKategori = "";
  String originalLokasi = "";
  String originalSpesies = "";
  String originalUmurKebuntingan = "";
  String originalPemeriksaKebuntingan = "";
  String originalTanggalPkb = "";

  @override
  onClose() {
    idKejadianC.dispose();
    idHewanC.dispose();
    idPeternakC.dispose();
    nikPeternakC.dispose();
    namaPeternakC.dispose();
    jumlahC.dispose();
    kategoriC.dispose();
    lokasiC.dispose();
    spesiesC.dispose();
    umurKebuntinganC.dispose();
    pemeriksaKebuntinganC.dispose();
    tanggalPkbC.dispose();
  }

  @override
  void onInit() {
    super.onInit();

    idKejadianC.text = argsData["id_kejadian"];
    idHewanC.text = argsData["id_hewan"];
    idPeternakC.text = argsData["id_peternak"];
    nikPeternakC.text = argsData["nik"];
    namaPeternakC.text = argsData["nama"];
    jumlahC.text = argsData["jumlah"];
    kategoriC.text = argsData["kategori"];
    lokasiC.text = argsData["lokasi"];
    spesiesC.text = argsData["spesies"];
    umurKebuntinganC.text = argsData["umur"];
    pemeriksaKebuntinganC.text = argsData["pemeriksa"];
    tanggalPkbC.text = argsData["tanggal"];

    originalIdKejadian = argsData["id_kejadian"];
    originalIdHewan = argsData["id_hewan"];
    originalIdPeternak = argsData["id_peternak"];
    originalNikPeternak = argsData["nik"];
    originalNamapeternak = argsData["nama"];
    originalJumlah = argsData["jumlah"];
    originalKategori = argsData["kategori"];
    originalLokasi = argsData["lokasi"];
    originalLokasi = argsData["spesies"];
    originalUmurKebuntingan = argsData["umur"];
    originalPemeriksaKebuntingan = argsData["pemeriksa"];
    originalTanggalPkb = argsData["tanggal"];
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
        idKejadianC.text = originalIdKejadian;
        idHewanC.text = originalIdHewan;
        idPeternakC.text = originalIdPeternak;
        nikPeternakC.text = originalNikPeternak;
        namaPeternakC.text = originalNamapeternak;
        jumlahC.text = originalJumlah;
        kategoriC.text = originalKategori;
        lokasiC.text = originalLokasi;
        spesiesC.text = originalSpesies;
        umurKebuntinganC.text = originalUmurKebuntingan;
        pemeriksaKebuntinganC.text = originalPemeriksaKebuntingan;
        tanggalPkbC.text = originalTanggalPkb;

        isEditing.value = false;
      },
    );
  }

  Future<void> deletePkb() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Hapus data PKB",
      message: "Apakah anda ingin menghapus data PKB ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        pkbModel = await PKBApi().deletePKBAPI(argsData["id_kejadian"]);
        if (pkbModel != null) {
          if (pkbModel!.status == 200) {
            showSuccessMessage(
                "Berhasil Hapus Data PKB dengan ID: ${idKejadianC.text}");
          } else {
            showErrorMessage("Gagal Hapus Data PKB ");
          }
        }
        final PKBController pkbController = Get.put(PKBController());
        pkbController.reInitialize();
        Get.back();
        Get.back();
        update();
      },
    );
  }

  Future<void> EditPkb() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Edit data PKB",
      message: "Apakah anda ingin mengedit data PKB ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        pkbModel = await PKBApi().editPKBApi(
            idKejadianC.text,
            idHewanC.text,
            idPeternakC.text,
            nikPeternakC.text,
            namaPeternakC.text,
            jumlahC.text,
            kategoriC.text,
            lokasiC.text,
            spesiesC.text,
            umurKebuntinganC.text,
            pemeriksaKebuntinganC.text,
            tanggalPkbC.text);
        isEditing.value = false;
        if (pkbModel != null) {
          if (pkbModel!.status == 201) {
            showSuccessMessage(
                "Berhasil Edit Data PKB dengan ID: ${idKejadianC.text}");
          } else {
            showErrorMessage("Gagal Edit Data PKB ");
          }
        }
        final PKBController pkbController = Get.put(PKBController());
        pkbController.reInitialize();
        Get.back();
        Get.back();
        update();
      },
    );
  }

  late DateTime selectedDate = DateTime.now();

  Future<void> tanggalPkb(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      tanggalPkbC.text = DateFormat('dd/MM/yyyy').format(picked);
    }
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
