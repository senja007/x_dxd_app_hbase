import 'dart:math';

import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
 
class DetailPetugasController extends GetxController {
  final Map<String, dynamic> argsData = Get.arguments;
  PetugasModel? petugasModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  RxBool isEditing = false.obs;

  String originalNik = "";
  String originalNama = "";
  String originalTlp = "";
  String originalEmail = "";

  TextEditingController nikC = TextEditingController();
  TextEditingController namaC = TextEditingController();
  TextEditingController tlpC = TextEditingController();
  TextEditingController emailC = TextEditingController();

  @override
  void onClose() {
    nikC.dispose();
    namaC.dispose();
    tlpC.dispose();
    emailC.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    nikC.text = argsData["nikPetugas"];
    namaC.text = argsData["namaPetugas"];
    tlpC.text = argsData["noTlp"];
    emailC.text = argsData["email"];

    originalNik = argsData["nikPetugas"];
    originalNama = argsData["namaPetugas"];
    originalTlp = argsData["noTlp"];
   originalEmail = argsData["email"];

    super.onInit();
  }

  Future<void> tombolEdit()async{
    isEditing.value = true;
    update();
  }

  Future<void> tutupEdit() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Batal Edit", 
      message: "Apakah anda ingin keluar dari edit?", 
      onConfirm: () async {
        Get.back();
        update();
        nikC.text = originalNik;
        namaC.text = originalNama;
        tlpC.text = originalTlp;
        emailC.text = originalEmail;
        isEditing.value= true;
      }, 
      onCancel: () => Get.back(),
    );
  }

  Future<void> deletePost() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Delete Data", 
      message: "Apakah anda ingin menghapus data petugas ini?", 
      onConfirm: () async {
        Get.back();
        update();
       petugasModel = await PetugasApi().deletePetugasApi(argsData["nikPetugas"]);
      }, 
      onCancel: () => Get.back(),
    );
  }

  Future<void> editPetugas() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Edit Data Peetugas", 
      message: "Apakah anda ingin mengedit data petugas ini?", 
      onConfirm: () async {
        Get.back();
        update();
        petugasModel = await PetugasApi().editPetugasApi(nikC.text,
         namaC.text, tlpC.text, emailC.text);
      }, 
      onCancel: () => Get.back(),
    );
  } 
}