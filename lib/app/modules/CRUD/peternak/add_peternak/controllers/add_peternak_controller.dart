import 'package:crud_flutter_api/app/data/peternak_model.dart';
import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/modules/menu/peternak/controllers/peternak_controller.dart';
import 'package:crud_flutter_api/app/services/peternak_api.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/successMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddPeternakController extends GetxController {
  PeternakModel? peternakModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  final formattedDate = ''.obs; // Gunakan .obs untuk membuat Rx variabel
  RxString selectedPetugas = ''.obs;
  RxList<PetugasModel> petugasList = <PetugasModel>[].obs;

  TextEditingController idPeternakC = TextEditingController();
  TextEditingController nikPeternakC = TextEditingController();
  TextEditingController namaPeternakC = TextEditingController();
  TextEditingController idISIKHNASC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  TextEditingController petugasPendaftarC = TextEditingController();
  TextEditingController tanggalPendaftaranC = TextEditingController();

  @override
  onClose() {
    idPeternakC.dispose();
    nikPeternakC.dispose();
    namaPeternakC.dispose();
    idISIKHNASC.dispose();
    lokasiC.dispose();
    petugasPendaftarC.dispose();
    tanggalPendaftaranC.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    fetchPetugas();
  }

  Future<List<PetugasModel>> fetchPetugas() async {
    try {
      final PetugasListModel petugasListModel =
          await PetugasApi().loadPetugasApi();
      final List<PetugasModel> petugas = petugasListModel.content ?? [];
      if (petugas.isNotEmpty) {
        selectedPetugas.value = petugas.first.namaPetugas ?? '';
      }
      petugasList.assignAll(petugas);
      return petugas;
    } catch (e) {
      print('Error fetching petugas: $e');
      showErrorMessage("Error fetching petugas: $e");
      return [];
    }
  }

  Future addPeternak(BuildContext context) async {
    try {
      isLoading.value = true;
      peternakModel = await PeternakApi().addPeternakAPI(
          idPeternakC.text,
          nikPeternakC.text,
          namaPeternakC.text,
          idISIKHNASC.text,
          lokasiC.text,
          selectedPetugas.value,
          tanggalPendaftaranC.text);

      if (peternakModel != null) {
        if (peternakModel!.status == 201) {
          final PeternakController peternakController =
              Get.put(PeternakController());
          peternakController.reInitialize();
          Get.back();
          showSuccessMessage("Peternak Baru berhasil ditambahkan");
        } else {
          showErrorMessage(
              "Gagal menambahkan Peternak dengan status ${peternakModel?.status}");
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

  void updateFormattedDate(String newDate) {
    formattedDate.value = newDate;
  }

  late DateTime selectedDate = DateTime.now();

  Future<void> tanggalPendaftaran(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      tanggalPendaftaranC.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }
}
