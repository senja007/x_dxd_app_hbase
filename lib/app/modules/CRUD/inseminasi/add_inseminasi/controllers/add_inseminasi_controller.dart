import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddInseminasiController extends GetxController {
  PetugasModel? petugasModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  TextEditingController idInseminasiC = TextEditingController();
  TextEditingController eartagC = TextEditingController();
  TextEditingController idHewanC = TextEditingController();
  TextEditingController idPembuatanC = TextEditingController();
  TextEditingController idPejantanC = TextEditingController();
  TextEditingController bangsaPejantanC = TextEditingController();
  TextEditingController ib1C = TextEditingController();
  TextEditingController ib2C = TextEditingController();
  TextEditingController ib3C = TextEditingController();
  TextEditingController ibLainC = TextEditingController();
  TextEditingController produsenC = TextEditingController();
  TextEditingController idPeternakC = TextEditingController();
  TextEditingController namaPeternakC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  TextEditingController inseminatorC = TextEditingController();
  TextEditingController tanggalIbC = TextEditingController();
  @override
  onClose() {
    inseminatorC.dispose();
    tanggalIbC.dispose();
    namaPeternakC.dispose();
    lokasiC.dispose();
    produsenC.dispose();
    idPeternakC.dispose();
    ib3C.dispose();
    ibLainC.dispose();
    ib1C.dispose();
    ib2C.dispose();
    idPejantanC.dispose();
    bangsaPejantanC.dispose();
    idHewanC.dispose();
    idPembuatanC.dispose();
    idInseminasiC.dispose();
    eartagC.dispose();
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
