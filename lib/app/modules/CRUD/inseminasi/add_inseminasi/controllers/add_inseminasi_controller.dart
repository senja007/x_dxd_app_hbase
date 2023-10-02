import 'package:crud_flutter_api/app/data/inseminasi_model.dart';
import 'package:crud_flutter_api/app/modules/menu/inseminasi/controllers/inseminasi_controller.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/successMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../services/inseminasi_api.dart';

class AddInseminasiController extends GetxController {
  InseminasiModel? inseminasiModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  final formattedDate = ''.obs; // Gunakan .obs untuk membuat Rx variabel
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

  Future addInseminasi() async {
    try {
      isLoading.value = true;
      inseminasiModel = await InseminasiApi().addInseminasiAPI(
          idInseminasiC.text,
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

      if (inseminasiModel != null) {
        if (inseminasiModel!.status == 201) {
          final InseminasiController inseminasiController =
              Get.put(InseminasiController());
          inseminasiController.reInitialize();
          Get.back();
          showSuccessMessage("Data Inseminasi Baru Berhasil ditambahkan");
        } else if (inseminasiModel!.status == 404) {
          showErrorMessage(
              "Gagal menambahkan Data Inseminasi dengan status ${inseminasiModel?.status}");
        }
      }
    } catch (e) {
      // Handle exceptions here
    } finally {
      isLoading.value = false;
    }
  }

  void updateFormattedDate(String newDate) {
    formattedDate.value = newDate;
  }

  
late DateTime selectedDate = DateTime.now();

Future<void> tanggalIB (BuildContext context) async {
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
