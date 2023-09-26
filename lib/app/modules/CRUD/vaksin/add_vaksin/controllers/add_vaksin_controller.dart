import 'package:crud_flutter_api/app/data/vaksin_model.dart';
import 'package:crud_flutter_api/app/modules/menu/vaksin/controllers/vaksin_controller.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/vaksin_api.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/successMessage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddVaksinController extends GetxController {
  VaksinModel? vaksinModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  TextEditingController idVaksinC = TextEditingController();
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
    inseminatorC.dispose();
    tanggalIBC.dispose();
    namaPeternakC.dispose();
    lokasiC.dispose();
    produsenC.dispose();
    idPeternakC.dispose();
    ib3C.dispose();
    ibLainC.dispose();
    ib1C.dispose();
    ib2C.dispose();
    idPejantanC.dispose();
    bangsaPejantanC.dispose();
    idHewanC.dispose();
    idPembuatanC.dispose();
    idVaksinC.dispose();
    eartagC.dispose();
  }

  Future addPost() async {
    try {
      isLoading.value = true;
      vaksinModel = await VaksinApi().addVaksinAPI(
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
          tanggalIBC.text);

      if (vaksinModel != null) {
        if (vaksinModel!.status == 201) {
          final VaksinController vaksinController = Get.put(VaksinController());
          vaksinController.reInitialize();
          Get.back();
          showSuccessMessage("Data Vaksin Baru Berhasil ditambahkan");
        } else {
          showErrorMessage(
              "Gagal menambahkan Data Vaksin dengan status ${vaksinModel?.status}");
        }
      }
    } catch (e) {
      // Handle exceptions here
    } finally {
      isLoading.value = false;
    }
  }
}
