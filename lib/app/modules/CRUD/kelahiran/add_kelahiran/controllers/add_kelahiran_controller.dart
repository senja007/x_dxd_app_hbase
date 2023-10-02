import 'package:crud_flutter_api/app/data/kelahiran_model.dart';
import 'package:crud_flutter_api/app/modules/menu/kelahiran/controllers/kelahiran_controller.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/kelahiran_api.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/successMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddkelahiranController extends GetxController {
  KelahiranModel? kelahiranModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  TextEditingController idKejadianC = TextEditingController();
  TextEditingController tanggalLaporanC = TextEditingController();
  TextEditingController tanggalLahirC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  TextEditingController namaPeternakC = TextEditingController();
  TextEditingController idPeternakC = TextEditingController();
  TextEditingController kartuTernakIndukC = TextEditingController();
  TextEditingController eartagIndukC = TextEditingController();
  TextEditingController idHewanIndukC = TextEditingController();
  TextEditingController spesiesIndukC = TextEditingController();
  TextEditingController idPejantanStrawC = TextEditingController();
  TextEditingController idBatchStrawC = TextEditingController();
  TextEditingController produsenStrawC = TextEditingController();
  TextEditingController spesiesPejantanC = TextEditingController();
  TextEditingController jumlahC = TextEditingController();
  TextEditingController kartuTernakAnakC = TextEditingController();
  TextEditingController eartagAnakC = TextEditingController();
  TextEditingController idHewanAnakC = TextEditingController();
  TextEditingController jenisKelaminAnakC = TextEditingController();
  TextEditingController kategoriC = TextEditingController();
  TextEditingController petugasPelaporC = TextEditingController();
  TextEditingController urutanIbC = TextEditingController();

  @override
  onClose() {
    idKejadianC.dispose();
    tanggalLaporanC.dispose();
    tanggalLahirC.dispose();
    lokasiC.dispose();
    namaPeternakC.dispose();
    idPeternakC.dispose();
    kartuTernakIndukC.dispose();
    eartagIndukC.dispose();
    idHewanIndukC.dispose();
    spesiesIndukC.dispose();
    idPejantanStrawC.dispose();
    idBatchStrawC.dispose();
    produsenStrawC.dispose();
    spesiesPejantanC.dispose();
    jumlahC.dispose();
    kartuTernakAnakC.dispose();
    eartagAnakC.dispose();
    idHewanAnakC.dispose();
    jenisKelaminAnakC.dispose();
    kategoriC.dispose();
    petugasPelaporC.dispose();
    urutanIbC.dispose();
  }

  Future addKelahiran(BuildContext context) async {
    try {
      isLoading.value = true;
      if (idKejadianC.text.isEmpty) {
        throw "ID Kejadian tidak boleh kosong.";
      }

      if (idPeternakC.text.isEmpty) {
        throw "ID Peternak tidak boleh kosong.";
      }

      kelahiranModel = await KelahiranApi().addKelahiranAPI(
        idKejadianC.text,
        tanggalLaporanC.text,
        tanggalLahirC.text,
        lokasiC.text,
        namaPeternakC.text,
        idPeternakC.text,
        kartuTernakIndukC.text,
        eartagIndukC.text,
        idHewanIndukC.text,
        spesiesIndukC.text,
        idPejantanStrawC.text,
        idBatchStrawC.text,
        produsenStrawC.text,
        spesiesPejantanC.text,
        jumlahC.text,
        kartuTernakAnakC.text,
        eartagAnakC.text,
        idHewanAnakC.text,
        jenisKelaminAnakC.text,
        kategoriC.text,
        petugasPelaporC.text,
        urutanIbC.text,
      );

      if (kelahiranModel != null) {
        if (kelahiranModel?.status == 201) {
          final KelahiranController petugasController =
              Get.put(KelahiranController());
          petugasController.reInitialize();
          Get.back();
          showSuccessMessage("Kelahiran Baru Berhasil ditambahkan");
        } else {
          showErrorMessage(
              "Gagal menambahkan Kelahiran dengan status ${kelahiranModel?.status}");
        }
      }
    } catch (e) {
      showCupertinoDialog(
        context: context, // Gunakan context yang diberikan sebagai parameter.
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("Kesalahan"),
            content: Text(e.toString()),
            actions: [
              CupertinoDialogAction(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    } finally {
      isLoading.value = false;
    }
  }

  late DateTime selectedDate = DateTime.now();
  late DateTime selectedDate1 = DateTime.now();

  Future<void> tanggalLaporan(BuildContext context) async {
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

  Future<void> tanggalLahir(BuildContext context) async {
    final DateTime? picked1 = await showDatePicker(
      context: context,
      initialDate: selectedDate1,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked1 != null && picked1 != selectedDate1) {
      selectedDate1 = picked1;
      tanggalLahirC.text = DateFormat('dd/MM/yyyy').format(picked1);
    }
  }
}
