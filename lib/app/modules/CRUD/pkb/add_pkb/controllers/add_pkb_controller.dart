import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/data/pkb_model.dart';
import 'package:crud_flutter_api/app/modules/menu/PKB/controllers/pkb_controller.dart';
import 'package:crud_flutter_api/app/modules/menu/kelahiran/controllers/kelahiran_controller.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:crud_flutter_api/app/services/pkb_api.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/successMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddPkbController extends GetxController {
  PKBModel? pkbModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  final formattedDate = ''.obs; // Gunakan .obs untuk membuat Rx variabel
  TextEditingController idKejadianC = TextEditingController();
  TextEditingController idHewanC = TextEditingController();
  TextEditingController idPeternakC = TextEditingController();
  TextEditingController nikPeternakC = TextEditingController();
  TextEditingController namaPeternakC = TextEditingController();
  TextEditingController jumlahC = TextEditingController();
  TextEditingController kategoriC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  TextEditingController spesiesC = TextEditingController();
  TextEditingController umurKebuntinganC = TextEditingController();
  TextEditingController pemeriksaKebuntinganC = TextEditingController();
  TextEditingController tanggalPkbC = TextEditingController();
  @override
  onClose() {
    idKejadianC.dispose();
    idHewanC.dispose();
    idPeternakC.dispose();
    nikPeternakC.dispose();
    namaPeternakC.dispose();
    jumlahC.dispose();
    kategoriC.dispose();
    lokasiC.dispose();
    spesiesC.dispose();
    umurKebuntinganC.dispose();
    pemeriksaKebuntinganC.dispose();
    tanggalPkbC.dispose();
  }

  Future addPKB(BuildContext context) async {
    try {
      isLoading.value = true;
      pkbModel = await PKBApi().addPKBAPI(
          idKejadianC.text,
          idHewanC.text,
          idPeternakC.text,
          nikPeternakC.text,
          namaPeternakC.text,
          jumlahC.text,
          kategoriC.text,
          lokasiC.text,
          spesiesC.text,
          umurKebuntinganC.text,
          pemeriksaKebuntinganC.text,
          tanggalPkbC.text);

      if (pkbModel != null) {
        if (pkbModel?.status == 201) {
          final PKBController pkbController =
              Get.put(PKBController());
          pkbController.reInitialize();
          Get.back();
          showSuccessMessage("Kelahiran Baru Berhasil ditambahkan");
        } else {
          showErrorMessage(
              "Gagal menambahkan Kelahiran dengan status ${pkbModel?.status}");
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

  Future<void> tanggalPkb (BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );

  if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      tanggalPkbC.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }
}
