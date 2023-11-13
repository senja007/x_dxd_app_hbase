import 'dart:io';

import 'package:crud_flutter_api/app/data/hewan_model.dart';
import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/modules/menu/hewan/controllers/hewan_controller.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/hewan_api.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/successMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddHewanController extends GetxController {
  HewanModel? hewanModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  final formattedDate = ''.obs; // Gunakan .obs untuk membuat Rx variabel
  RxString selectedGender = 'Jantan'.obs;
  List<String> genders = ["Jantan", "Betina"];
  // Rx<File?> fotoHewan = Rx<File?>(null);
  Rx<File?> fotoHewan = Rx<File?>(File('path/to/default/image.jpg'));


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
  //TextEditingController sexC = TextEditingController();
  TextEditingController umurC = TextEditingController();
  TextEditingController identifikasiHewanC = TextEditingController();
  TextEditingController petugasPendaftarC = TextEditingController();
  TextEditingController tanggalTerdaftarC = TextEditingController();

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
    // sexC.dispose();
    umurC.dispose();
    identifikasiHewanC.dispose();
    petugasPendaftarC.dispose();
    tanggalTerdaftarC.dispose();
    ever<File?>(fotoHewan, (_) {
      update(); // Perbarui UI setiap kali ada perubahan pada fotoHewan
    });
  }

   // Fungsi untuk memilih gambar dari galeri
  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      fotoHewan.value = File(pickedFile.path);
      update(); // Perbarui UI setelah memilih gambar
    }
  }

  // Fungsi untuk menghapus gambar yang sudah dipilih
  void removeImage() {
    fotoHewan.value = null;
    update(); // Perbarui UI setelah menghapus gambar
  }

  Future addHewan(BuildContext context) async {
    try {
      isLoading.value = true;

      if (kodeEartagNasionalC.text.isEmpty) {
        throw "Kode Eartag tidak boleh kosong.";
      }

      if (idPeternakC.text.isEmpty) {
        throw "ID Peternak tidak boleh kosong.";
      }

      hewanModel = await HewanApi().addHewanAPI(
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
        selectedGender.value,
        umurC.text,
        identifikasiHewanC.text,
        petugasPendaftarC.text,
        tanggalTerdaftarC.text,
        fotoHewan.value!,
      );
      if (hewanModel != null) {
        if (hewanModel?.status == 201) {
          final HewanController hewanController = Get.put(HewanController());
          hewanController.reInitialize();
          Get.back();
          showSuccessMessage("Petugas Baru Berhasil ditambahkan");
        } else {
          showErrorMessage(
              "Gagal menambahkan petugas dengan status ${hewanModel?.status}");
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

  Future<void> tanggalTerdaftar(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      tanggalTerdaftarC.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }
}
