import 'package:crud_flutter_api/app/data/kandang_model.dart';
import 'package:crud_flutter_api/app/modules/menu/kandang/controllers/kandang_controller.dart';
import 'package:crud_flutter_api/app/services/kandang_api.dart';
import 'package:crud_flutter_api/app/utils/api.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_alert_dialog.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/successMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailKandangController extends GetxController {
  //TODO: Implement DetailPostController
  final Map<String, dynamic> argsData = Get.arguments;
  KandangModel? kandangModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  RxBool isEditing = false.obs;
  final formattedDate = ''.obs;
  final KandangController kandangController = Get.put(KandangController());
  SharedApi sharedApi = SharedApi();

  TextEditingController idKandangC = TextEditingController();
  TextEditingController idPeternakC = TextEditingController();
  TextEditingController namaPeternakC = TextEditingController();
  TextEditingController luasC = TextEditingController();
  TextEditingController kapasitasC = TextEditingController();
  TextEditingController nilaiBangunanC = TextEditingController();
  TextEditingController alamatC = TextEditingController();
  TextEditingController desaC = TextEditingController();
  TextEditingController kecamatanC = TextEditingController();
  TextEditingController kabupatenC = TextEditingController();
  TextEditingController provinsiC = TextEditingController();

  String originalIdKandang = "";
  String originalIdPeternak = "";
  String originalNamaPeternak = "";
  String originalLuas = "";
  String originalKapasitas = "";
  String originalNilaiBangunan = "";
  String originalAlamat = "";
  String originalDesa = "";
  String originalKecamatan = "";
  String originalKabupaten = "";
  String originalProvinsi = "";

  @override
  onClose() {
    idKandangC.dispose();
    idPeternakC.dispose();
    namaPeternakC.dispose();
    luasC.dispose();
    kapasitasC.dispose();
    nilaiBangunanC.dispose();
    alamatC.dispose();
    desaC.dispose();
    kecamatanC.dispose();
    kabupatenC.dispose();
    provinsiC.dispose();
  }

  @override
  void onInit() {
    super.onInit();

    idKandangC.text = argsData["idKandang"];
    idPeternakC.text = argsData["idPeternak"];
    namaPeternakC.text = argsData["namaPeternak"];
    luasC.text = argsData["luas"];
    kapasitasC.text = argsData["kapasitas"];
    nilaiBangunanC.text = argsData["nilaiBangunan"];
    alamatC.text = argsData["alamat"];
    desaC.text = argsData["desa"];
    kecamatanC.text = argsData["kecamatan"];
    kabupatenC.text = argsData["kabupaten"];
    provinsiC.text = argsData["provinsi"];

    print(argsData["fotoKandang"]);

    originalIdKandang = argsData["idKandang"];
    originalIdPeternak = argsData["idPeternak"];
    originalNamaPeternak = argsData["namaPeternak"];
    originalLuas = argsData["luas"];
    originalKapasitas = argsData["kapasitas"];
    originalNilaiBangunan = argsData["nilaiBangunan"];
    originalAlamat = argsData["alamat"];
    originalDesa = argsData["desa"];
    originalKecamatan = argsData["kecamatan"];
    originalKabupaten = argsData["kabupaten"];
    originalProvinsi = argsData["provinsi"];
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
        idKandangC.text = originalIdKandang;
        idPeternakC.text = originalIdPeternak;
        namaPeternakC.text = originalNamaPeternak;
        luasC.text = originalLuas;
        kapasitasC.text = originalKapasitas;
        nilaiBangunanC.text = originalNilaiBangunan;
        alamatC.text = originalAlamat;
        desaC.text = originalDesa;
        kecamatanC.text = originalKecamatan;
        kabupatenC.text = originalKabupaten;
        provinsiC.text = originalProvinsi;

        isEditing.value = false;
      },
    );
  }

  Future<void> deleteKandang() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Hapus data Kandang",
      message: "Apakah anda ingin menghapus data Kandang ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        kandangModel =
            await KandangApi().deleteKandangAPI(argsData["idKandang"]);
        if (kandangModel != null) {
          if (kandangModel!.status == 200) {
            showSuccessMessage(
                "Berhasil Hapus Kandang dengan ID: ${idKandangC.text}");
          } else {
            showErrorMessage("Gagal Hapus Data Kandang ");
          }
        }
        kandangController.reInitialize();
        Get.back();
        Get.back();
        update();
      },
    );
  }

  Future<void> editKandang() async {
    CustomAlertDialog.showPresenceAlert(
      title: "edit data Kandang",
      message: "Apakah anda ingin mengedit data Kandang ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        kandangModel = await KandangApi().editKandangApi(
          idKandangC.text,
          idPeternakC.text,
          namaPeternakC.text,
          luasC.text,
          kapasitasC.text,
          nilaiBangunanC.text,
          alamatC.text,
          desaC.text,
          kecamatanC.text,
          kabupatenC.text,
          provinsiC.text,
        );
        isEditing.value = false;

        // await PetugasApi().editPetugasApi(argsData["nikPetugas"], argsData["namaPetugas"], argsData["noTelp"],argsData["email"]);
        if (kandangModel != null) {
          if (kandangModel!.status == 201) {
            showSuccessMessage(
                "Berhasil mengedit Kandang dengan ID: ${idKandangC.text}");
          } else {
            showErrorMessage("Gagal mengedit Data Kandang ");
          }
        }

        kandangController.reInitialize();
        Get.back();
        Get.back(); // close modal
        update();
      },
    );
  }

  // void updateFormattedDate(String newDate) {
  //   formattedDate.value = newDate;
  // }

  // late DateTime selectedDate = DateTime.now();

  // Future<void> tanggalPendaftaran(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2101),
  //   );

  //   if (picked != null && picked != selectedDate) {
  //     selectedDate = picked;
  //     tanggalPendaftaranC.text = DateFormat('dd/MM/yyyy').format(picked);
  //   }
  // }
}
