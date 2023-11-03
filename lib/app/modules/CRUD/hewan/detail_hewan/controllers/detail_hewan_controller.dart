import 'package:crud_flutter_api/app/data/hewan_model.dart';
import 'package:crud_flutter_api/app/modules/menu/hewan/controllers/hewan_controller.dart';
import 'package:crud_flutter_api/app/services/hewan_api.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_alert_dialog.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/successMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailHewanController extends GetxController {
  //TODO: Implement DetailPostController
  final Map<String, dynamic> argsData = Get.arguments;
  HewanModel? hewanModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  RxBool isEditing = false.obs;

  TextEditingController kodeEartagNasionalC = TextEditingController();
  TextEditingController noKartuTernakC = TextEditingController();
  TextEditingController provinsiC = TextEditingController();
  TextEditingController kabupatenC = TextEditingController();
  TextEditingController kecamatanC = TextEditingController();
  TextEditingController desaC = TextEditingController();
  TextEditingController namaPeternakC = TextEditingController();
  TextEditingController idPeternakC = TextEditingController();
  TextEditingController nikPeternakC = TextEditingController();
  TextEditingController spesiesC = TextEditingController();
  TextEditingController sexC = TextEditingController();
  TextEditingController umurC = TextEditingController();
  TextEditingController identifikasiHewanC = TextEditingController();
  TextEditingController petugasPendaftarC = TextEditingController();
  TextEditingController tanggalTerdaftarC = TextEditingController();
  // String? fotoHewanC;
  //TextEditingController fotoHewanC = TextEditingController();

  String originalEartag = "";
  String originalKartuTernak = "";
  String originalProvinsi = "";
  String originalKabupaten = "";
  String originalKecamatan = "";
  String originalDesa = "";
  String originalNamaPeternak = "";
  String originalIdPeternak = "";
  String originalNikPeternak = "";
  String originalSpesies = "";
  String originalSex = "";
  String originalUmur = "";
  String originalIdentifikasi = "";
  String originalPetugas = "";
  String originalTanggal = "";

  @override
  onClose() {
    kodeEartagNasionalC.dispose();
    noKartuTernakC.dispose();
    provinsiC.dispose();
    kabupatenC.dispose();
    kecamatanC.dispose();
    desaC.dispose();
    namaPeternakC.dispose();
    idPeternakC.dispose();
    nikPeternakC.dispose();
    spesiesC.dispose();
    sexC.dispose();
    umurC.dispose();
    identifikasiHewanC.dispose();
    petugasPendaftarC.dispose();
    tanggalTerdaftarC.dispose();
    //fotoHewanC.dispose();
    //fotoHewanC;
  }

  @override
  void onInit() {
    super.onInit();
    isEditing.value = false;
    //print(fotoHewanC);
    kodeEartagNasionalC.text = argsData["eartag_hewan_detail"];
    noKartuTernakC.text = argsData["kartu_hewan_detail"];
    provinsiC.text = argsData["provinsi_hewan_detail"];
    kabupatenC.text = argsData["kabupaten_hewan_detail"];
    kecamatanC.text = argsData["kecamatan_hewan_detail"];
    desaC.text = argsData["desa_hewan_detail"];
    namaPeternakC.text = argsData["nama_peternak_hewan_detail"];
    idPeternakC.text = argsData["id_peternak_hewan_detail"];
    nikPeternakC.text = argsData["nik_hewan_detail"];
    spesiesC.text = argsData["spesies_hewan_detail"];
    sexC.text = argsData["kelamin_hewan_detail"];
    umurC.text = argsData["umur_hewan_detail"];
    identifikasiHewanC.text = argsData["identifikasi_hewan_detail"];
    petugasPendaftarC.text = argsData["petugas_terdaftar_hewan_detail"];
    tanggalTerdaftarC.text = argsData["tanggal_terdaftar_hewan_detail"];
    //fotoHewanC.text = argsData["foto_hewan_detail"];
    //fotoHewanC = argsData["foto_hewan_detail"];
    print(argsData["foto_hewan_detail"]);

    originalEartag = argsData["eartag_hewan_detail"];
    originalKartuTernak = argsData["kartu_hewan_detail"];
    originalProvinsi = argsData["provinsi_hewan_detail"];
    originalKabupaten = argsData["kabupaten_hewan_detail"];
    originalKecamatan = argsData["kecamatan_hewan_detail"];
    originalDesa = argsData["desa_hewan_detail"];
    originalNamaPeternak = argsData["nama_peternak_hewan_detail"];
    originalIdPeternak = argsData["id_peternak_hewan_detail"];
    originalNikPeternak = argsData["nik_hewan_detail"];
    originalSpesies = argsData["spesies_hewan_detail"];
    originalSex = argsData["kelamin_hewan_detail"];
    originalUmur = argsData["umur_hewan_detail"];
    originalIdentifikasi = argsData["identifikasi_hewan_detail"];
    originalPetugas = argsData["petugas_terdaftar_hewan_detail"];
    originalTanggal = argsData["tanggal_terdaftar_hewan_detail"];
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
        kodeEartagNasionalC.text = originalEartag;
        noKartuTernakC.text = originalKartuTernak;
        provinsiC.text = originalProvinsi;
        kabupatenC.text = originalKabupaten;
        kecamatanC.text = originalKecamatan;
        desaC.text = originalDesa;
        namaPeternakC.text = originalNamaPeternak;
        idPeternakC.text = originalIdPeternak;
        nikPeternakC.text = originalNikPeternak;
        spesiesC.text = originalSpesies;
        sexC.text = originalSex;
        umurC.text = originalUmur;
        identifikasiHewanC.text = originalIdentifikasi;
        petugasPendaftarC.text = originalPetugas;
        tanggalTerdaftarC.text = originalTanggal;

        isEditing.value = false;
      },
    );
  }

  Future<void> deleteHewan() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Hapus data Hewan",
      message: "Apakah anda ingin menghapus data Hewan ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        hewanModel =
            await HewanApi().deleteHewanApi(argsData["eartag_hewan_detail"]);
        if (hewanModel?.status == 200) {
          showSuccessMessage(
              "Berhasil Hapus Data Hewan dengan ID: ${kodeEartagNasionalC.text}");
        } else {
          showErrorMessage("Gagal Hapus Data Hewan");
        }
        final HewanController hewanController = Get.put(HewanController());
        hewanController.reInitialize();
        Get.back();
        Get.back();
        update();
      },
    );
  }

  Future<void> editHewan() async {
    CustomAlertDialog.showPresenceAlert(
      title: "edit data Hewan",
      message: "Apakah anda ingin mengedit data ini data Petugas ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back(); // close modal
        update();
        hewanModel = await HewanApi().editHewanApi(
            kodeEartagNasionalC.text,
            noKartuTernakC.text,
            provinsiC.text,
            kabupatenC.text,
            kecamatanC.text,
            desaC.text,
            namaPeternakC.text,
            idPeternakC.text,
            nikPeternakC.text,
            spesiesC.text,
            sexC.text,
            umurC.text,
            identifikasiHewanC.text,
            petugasPendaftarC.text,
            tanggalTerdaftarC.text);
        isEditing.value = false;
      },
    );
  }
}
