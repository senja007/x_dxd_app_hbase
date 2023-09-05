import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/data/pkb_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:crud_flutter_api/app/services/pkb_api.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddPkbController extends GetxController {
  PKBModel? pkbModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  TextEditingController idKejadianC = TextEditingController();
  TextEditingController idHewanC = TextEditingController();
  TextEditingController idPeternakC = TextEditingController();
  TextEditingController nikC = TextEditingController();
  TextEditingController namaPeternakC = TextEditingController();
  TextEditingController jumlahC = TextEditingController();
  TextEditingController kategoriC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  TextEditingController spesiesC = TextEditingController();
  TextEditingController umurKebuntinganC = TextEditingController();
  TextEditingController pemeriksaKebuntingaC = TextEditingController();
  TextEditingController tanggalPkbC = TextEditingController();
  @override
  onClose() {
    pemeriksaKebuntingaC.dispose();
    tanggalPkbC.dispose();
    spesiesC.dispose();
    umurKebuntinganC.dispose();
    kategoriC.dispose();
    lokasiC.dispose();
    namaPeternakC.dispose();
    jumlahC.dispose();
    idPeternakC.dispose();
    nikC.dispose();
    idKejadianC.dispose();
    idHewanC.dispose();
  }

  Future addPKB() async {
    try{
      isLoading.value = true;
      pkbModel = await PKBApi().addPKBAPI(
        idKejadianC.text,
        idHewanC.text,
        idPeternakC.text,
        nikC.text,
        namaPeternakC.text,
        jumlahC.text,
        kategoriC.text,
        lokasiC.text,
        spesiesC.text,
        umurKebuntinganC.text,
        pemeriksaKebuntingaC.text,
        tanggalPkbC.text
      );

      if (pkbModel != null) {
        if (pkbModel!.status == 200) {
          Get.offNamed(Routes.HOME); // Menggunakan Get.offNamed
        } else if (pkbModel!.status == 404) {
          // Handle status 404
        }
      }
    } catch (e) {
      // Handle exceptions here
    } finally {
      isLoading.value = false;
    }
    }
}
