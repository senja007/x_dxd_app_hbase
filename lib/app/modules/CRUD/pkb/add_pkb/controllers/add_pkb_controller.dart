import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddPkbController extends GetxController {
  PetugasModel? petugasModel;
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

  Future addPost() async {
    update();
    // petugasModel = await PetugasApi().addPetugasApi(titleC.text, contentC.text);
    if (petugasModel!.status == 200) {
      update();
      Get.offAndToNamed(Routes.HOME); //ganti route sesuai data menu
    } else if (petugasModel!.status == 404) {
      update();
    }
  }
}
