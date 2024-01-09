import 'package:crud_flutter_api/app/data/kelahiran_model.dart';
import 'package:crud_flutter_api/app/data/peternak_model.dart';
import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/modules/menu/kelahiran/controllers/kelahiran_controller.dart';
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
  KelahiranModel? kelahiranModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  RxString selectedGender = 'Jantan'.obs;
  RxString selectedPeternakId = ''.obs;
  RxList<PeternakModel> peternakList = <PeternakModel>[].obs;
  RxString selectedPetugasId = ''.obs;
  RxList<PetugasModel> petugasList = <PetugasModel>[].obs;
  List<String> genders = ["Jantan", "Betina"];
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
    kategoriC.dispose();
    petugasPelaporC.dispose();
    urutanIbC.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    fetchPeternaks();
    fetchPetugas();
  }
//GET DATA PETERNAK
  Future<List<PeternakModel>> fetchPeternaks() async {
    try {
      final PeternakListModel peternakListModel =
          await PeternakApi().loadPeternakApi();
      final List<PeternakModel> peternaks = peternakListModel.content ?? [];
      if (peternaks.isNotEmpty) {
        selectedPeternakId.value = peternaks.first.idPeternak ?? '';
      }
      peternakList.assignAll(peternaks);
      return peternaks;
    } catch (e) {
      print('Error fetching peternaks: $e');
      showErrorMessage("Error fetching peternaks: $e");
      return [];
    }
  }

//GET DATA PETUGAS
  Future<List<PetugasModel>> fetchPetugas() async {
    try {
      final PetugasListModel petugasListModel =
          await PetugasApi().loadPetugasApi();
      final List<PetugasModel> petugass = petugasListModel.content ?? [];
      if (petugass.isNotEmpty) {
        selectedPetugasId.value = petugass.first.namaPetugas ?? '';
      }
      petugasList.assignAll(petugass);
      return petugass;
    } catch (e) {
      print('Error fetching Petugas: $e');
      showErrorMessage("Error fetching Petugas: $e");
      return [];
    }
  }

  Future addKelahiran(BuildContext context) async {
    try {
      isLoading.value = true;
      if (idKejadianC.text.isEmpty) {
        throw "ID Kejadian tidak boleh kosong.";
      }

      if (selectedPeternakId.value.isEmpty) {
        throw "Pilih Peternak terlebih dahulu.";
      }

      if (selectedPetugasId.value.isEmpty) {
        throw "Pilih Peternak terlebih dahulu.";
      }


      kelahiranModel = await KelahiranApi().addKelahiranAPI(
        idKejadianC.text,
        tanggalLaporanC.text,
        tanggalLahirC.text,
        lokasiC.text,
        namaPeternakC.text,
        selectedPeternakId.value,
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
        selectedGender.value,
        kategoriC.text,
        selectedPetugasId.value,
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
