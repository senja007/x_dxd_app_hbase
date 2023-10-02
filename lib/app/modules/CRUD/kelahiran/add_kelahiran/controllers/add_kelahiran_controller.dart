import 'package:crud_flutter_api/app/data/kelahiran_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/kelahiran_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddkelahiranController extends GetxController {
  KelahiranModel? kelahiranModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  final formattedDate = ''.obs; // Gunakan .obs untuk membuat Rx variabel
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

  Future addKelahiran() async {
    try{
      isLoading.value = true;
      kelahiranModel = await KelahiranApi().addKelahiranAPI(
        idKejadianC.text, 
        eartagIndukC.text, 
        eartagAnakC.text, 
        idHewanIndukC.text,
        idHewanAnakC.text,
        idBatchStrawC.text,
        idPejantanStrawC.text,
        jenisKelaminAnakC.text,
        jumlahC.text,
        urutanIbC.text,
        kartuTernakAnakC.text,
        kartuTernakIndukC.text,
        kategoriC.text,
        lokasiC.text,
        idPeternakC.text,
        namaPeternakC.text,
        petugasPelaporC.text,
        produsenStrawC.text,
        spesiesIndukC.text,
        spesiesPejantanC.text,
        tanggalLahirC.text,
        tanggalLaporanC.text,
      );

      if (kelahiranModel != null) {
        if (kelahiranModel!.status == 200) {
          Get.offNamed(Routes.HOME); // Menggunakan Get.offNamed
        } else if (kelahiranModel!.status == 404) {
          // Handle status 404
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

  Future<void> tanggalLahir (BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );

  if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      tanggalLahirC.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  Future<void> tanggalLaporan (BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );

  if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      tanggalLaporanC.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }
}

