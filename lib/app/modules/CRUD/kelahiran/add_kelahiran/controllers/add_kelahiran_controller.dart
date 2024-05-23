import 'package:crud_flutter_api/app/data/hewan_model.dart';
import 'package:crud_flutter_api/app/data/kelahiran_model.dart';
import 'package:crud_flutter_api/app/data/peternak_model.dart';
import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/modules/menu/kelahiran/controllers/kelahiran_controller.dart';
import 'package:crud_flutter_api/app/services/fetch_data.dart';
import 'package:crud_flutter_api/app/services/hewan_api.dart';
import 'package:crud_flutter_api/app/services/kelahiran_api.dart';
import 'package:crud_flutter_api/app/services/peternak_api.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/successMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddkelahiranController extends GetxController {
  final FetchData fetchdata = FetchData();

  KelahiranModel? kelahiranModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  RxString selectedGender = 'Jantan'.obs;
  List<String> genders = ["Jantan", "Betina"];

  TextEditingController idKejadianC = TextEditingController();
  TextEditingController tanggalLaporanC = TextEditingController();
  TextEditingController tanggalLahirC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
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
  TextEditingController kategoriC = TextEditingController();
  TextEditingController urutanIbC = TextEditingController();

  @override
  onClose() {
    idKejadianC.dispose();
    tanggalLaporanC.dispose();
    tanggalLahirC.dispose();
    lokasiC.dispose();
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
    kategoriC.dispose();
    urutanIbC.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    fetchdata.fetchPeternaks();
    fetchdata.fetchPetugas();
    fetchdata.fetchHewan();
  }

  Future addKelahiran(BuildContext context) async {
    try {
      isLoading.value = true;
      if (idKejadianC.text.isEmpty) {
        throw "ID Kejadian tidak boleh kosong.";
      }

      if (fetchdata.selectedPeternakId.value.isEmpty) {
        throw "Pilih Peternak terlebih dahulu.";
      }

      if (fetchdata.selectedPetugasId.value.isEmpty) {
        throw "Pilih Petugas terlebih dahulu.";
      }

      kelahiranModel = await KelahiranApi().addKelahiranAPI(
        idKejadianC.text,
        tanggalLaporanC.text,
        tanggalLahirC.text,
        lokasiC.text,
        fetchdata.selectedPeternakId.value,
        kartuTernakIndukC.text,
        eartagIndukC.text,
        fetchdata.selectedHewanEartag.value,
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
        selectedGender.value,
        kategoriC.text,
        fetchdata.selectedPetugasId.value,
        urutanIbC.text,
      );

      if (kelahiranModel != null) {
        if (kelahiranModel?.status == 201) {
          final KelahiranController kelahiranController =
              Get.put(KelahiranController());
          kelahiranController.reInitialize();
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
            title: const Text("Kesalahan"),
            content: Text(e.toString()),
            actions: [
              CupertinoDialogAction(
                child: const Text("OK"),
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
