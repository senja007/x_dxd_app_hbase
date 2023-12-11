import 'package:crud_flutter_api/app/data/vaksin_model.dart';
import 'package:crud_flutter_api/app/modules/menu/vaksin/controllers/vaksin_controller.dart';
import 'package:crud_flutter_api/app/services/vaksin_api.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_alert_dialog.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/successMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailVaksinController extends GetxController {
  final Map<String, dynamic> argsData = Get.arguments;
  VaksinModel? vaksinModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  RxBool isEditing = false.obs;

  TextEditingController idVaksinC = TextEditingController();
  TextEditingController tanggalIBC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  TextEditingController namaPeternakC = TextEditingController();
  TextEditingController idPeternakC = TextEditingController();
  TextEditingController idHewanC = TextEditingController();
  TextEditingController eartagC = TextEditingController();
  TextEditingController ib1C = TextEditingController();
  TextEditingController ib2C = TextEditingController();
  TextEditingController ib3C = TextEditingController();
  TextEditingController ibLainC = TextEditingController();
  TextEditingController idPejantanC = TextEditingController();
  TextEditingController idPembuatanC = TextEditingController();
  TextEditingController bangsaPejantanC = TextEditingController();
  TextEditingController produsenC = TextEditingController();
  TextEditingController inseminatorC = TextEditingController();

  String originalIdVaksin = "";
  String originalTanggalIB = "";
  String originalLokasi = "";
  String originalNamaPeternak = "";
  String originalIdPeternak = "";
  String originalIdHewan = "";
  String originalEartag = "";
  String originalIb1 = "";
  String originalIb2 = "";
  String originalIb3 = "";
  String originalIbLain = "";
  String originalIdPejantan = "";
  String originalIdPembuatan = "";
  String originalBangsaPejantan = "";
  String originalProdusen = "";
  String originalInseminator = "";

  @override
  onClose() {
    idVaksinC.dispose();
    tanggalIBC.dispose();
    lokasiC.dispose();
    namaPeternakC.dispose();
    idPeternakC.dispose();
    idHewanC.dispose();
    eartagC.dispose();
    ib1C.dispose();
    ib2C.dispose();
    ib3C.dispose();
    ibLainC.dispose();
    idPejantanC.dispose();
    idPembuatanC.dispose();
    bangsaPejantanC.dispose();
    produsenC.dispose();
    inseminatorC.dispose();
  }

  @override
  void onInit() {
    super.onInit();

    idVaksinC.text = argsData["idVaksin"];
    tanggalIBC.text = argsData["tanggalIB"];
    lokasiC.text = argsData["lokasi"];
    namaPeternakC.text = argsData["namaPeternak"];
    idPeternakC.text = argsData["idPeternak"];
    idHewanC.text = argsData["idHewan"];
    eartagC.text = argsData["kodeEartagNasional"];
    ib1C.text = argsData["ib1"];
    ib2C.text = argsData["ib2"];
    ib3C.text = argsData["ib3"];
    ibLainC.text = argsData["ibLain"];
    idPejantanC.text = argsData["idPejantan"];
    idPembuatanC.text = argsData["idPembuatan"];
    bangsaPejantanC.text = argsData["bangsaPejantan"];
    produsenC.text = argsData["produsen"];
    inseminatorC.text = argsData["inseminator"];

    originalIdVaksin = argsData["idVaksin"];
    originalTanggalIB = argsData["tanggalIB"];
    originalLokasi = argsData["lokasi"];
    originalNamaPeternak = argsData["namaPeternak"];
    originalIdPeternak = argsData["idPeternak"];
    originalIdHewan = argsData["idHewan"];
    originalEartag = argsData["kodeEartagNasional"];
    originalIb1 = argsData["ib1"];
    originalIb2 = argsData["ib2"];
    originalIb3 = argsData["ib3"];
    originalIbLain = argsData["ibLain"];
    originalIdPejantan = argsData["idPejantan"];
    originalIdPembuatan = argsData["idPembuatan"];
    originalBangsaPejantan = argsData["bangsaPejantan"];
    originalProdusen = argsData["produsen"];
    originalInseminator = argsData["inseminator"];
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
        idVaksinC.text = originalIdVaksin;
        tanggalIBC.text = originalTanggalIB;
        lokasiC.text = originalLokasi;
        namaPeternakC.text = originalNamaPeternak;
        idPeternakC.text = originalIdPeternak;
        idHewanC.text = originalIdHewan;
        eartagC.text = originalEartag;
        ib1C.text = originalIb1;
        ib2C.text = originalIb2;
        ib3C.text = originalIb3;
        ibLainC.text = originalIbLain;
        idPejantanC.text = originalIdPejantan;
        idPembuatanC.text = originalIdPembuatan;
        bangsaPejantanC.text = originalBangsaPejantan;
        produsenC.text = originalProdusen;
        inseminatorC.text = originalInseminator;

        isEditing.value = false;
      },
    );
  }

  Future<void> deleteVaksin() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Hapus data todo",
      message: "Apakah anda ingin menghapus data todo ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        vaksinModel = await VaksinApi().deleteVaksinApi(argsData["idVaksin"]);
        if (vaksinModel != null) {
          if (vaksinModel!.status == 200) {
            showSuccessMessage(
                "Berhasil Hapus Data Vaksin dengan ID: ${idVaksinC.text}");
          } else {
            showErrorMessage("Gagal Hapus Data Vaksin ");
          }
        }
        final VaksinController vaksinController = Get.put(VaksinController());
        vaksinController.reInitialize();
        Get.back();
        Get.back();
        update();
      },
    );
  }

  Future<void> editVaksin() async {
    CustomAlertDialog.showPresenceAlert(
      title: "edit data Vaksin",
      message: "Apakah anda ingin mengedit data Vaksin ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        vaksinModel = await VaksinApi().editVaksinApi(
          idVaksinC.text,
          eartagC.text,
          idHewanC.text,
          idPembuatanC.text,
          idPejantanC.text,
          bangsaPejantanC.text,
          ib1C.text,
          ib2C.text,
          ib3C.text,
          ibLainC.text,
          produsenC.text,
          idPeternakC.text,
          namaPeternakC.text,
          lokasiC.text,
          inseminatorC.text,
          tanggalIBC.text,
        );
        isEditing.value = false;
        if (vaksinModel != null) {
          if (vaksinModel!.status == 201) {
            showSuccessMessage(
                "Berhasil mengedit Data Vaksin dengan ID: ${idVaksinC.text}");
          } else {
            showErrorMessage("Gagal mengedit Data Vaksin ");
          }
        }
        final VaksinController vaksinController = Get.put(VaksinController());
        vaksinController.reInitialize();
        Get.back(); // close modal
        Get.back();
        update();
      },
    );
  }

  late DateTime selectedDate = DateTime.now();

  Future<void> tanggalIB(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      tanggalIBC.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }
}
