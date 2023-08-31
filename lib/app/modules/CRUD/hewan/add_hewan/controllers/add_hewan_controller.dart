import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddHewanController extends GetxController {
  PetugasModel? petugasModel;
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
