import 'package:crud_flutter_api/app/data/hewan_model.dart';
import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/hewan_api.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddHewanController extends GetxController {
  HewanModel? hewanModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  TextEditingController eartagC = TextEditingController();
  TextEditingController kartuC = TextEditingController();
  TextEditingController nikC = TextEditingController();
  TextEditingController idPeternakC = TextEditingController();
  TextEditingController namaPeternakC = TextEditingController();
  TextEditingController provinsiC = TextEditingController();
  TextEditingController kabupatenC = TextEditingController();
  TextEditingController kecamatanC = TextEditingController();
  TextEditingController desaC = TextEditingController();
  TextEditingController identifikasiC = TextEditingController();
  TextEditingController kelaminC = TextEditingController();
  TextEditingController spesiesC = TextEditingController();
  TextEditingController umurC = TextEditingController();
  TextEditingController petugasPendaftarC = TextEditingController();
  TextEditingController tanggalTerdaftarC = TextEditingController();

  @override
  onClose() {
    eartagC.dispose();
    kartuC.dispose();
    nikC.dispose();
    idPeternakC.dispose();
    namaPeternakC.dispose();
    provinsiC.dispose();
    kabupatenC.dispose();
    kecamatanC.dispose();
    desaC.dispose();
    identifikasiC.dispose();
    kelaminC.dispose();
    spesiesC.dispose();
    umurC.dispose();
    petugasPendaftarC.dispose();
    tanggalTerdaftarC.dispose();
  }

  Future addHewan(BuildContext context) async {
    try {
      isLoading.value = true;

      if (eartagC.text.isEmpty) {
        throw "NIK tidak boleh kosong.";
      }

      if (nikC.text.isEmpty) {
        throw "Nama tidak boleh kosong.";
      }

      hewanModel = await HewanApi().addHewanAPI(
          eartagC.text,
          kartuC.text,
          nikC.text,
          idPeternakC.text,
          namaPeternakC.text,
          provinsiC.text,
          kabupatenC.text,
          kecamatanC.text,
          desaC.text,
          identifikasiC.text,
          kelaminC.text,
          spesiesC.text,
          umurC.text,
          petugasPendaftarC.text,
          tanggalTerdaftarC.text);
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
}
