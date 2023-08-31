import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddPengobatanController extends GetxController {
  PetugasModel? petugasModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  TextEditingController idKasusC = TextEditingController();
  TextEditingController namaInfratukturC = TextEditingController();
  TextEditingController dosisC = TextEditingController();
  TextEditingController sindromC = TextEditingController();
  TextEditingController diagnosaBandingC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  TextEditingController petugasPendaftarC = TextEditingController();
  TextEditingController tanggalKasusC = TextEditingController();
  TextEditingController tanggalPengobatanC = TextEditingController();
  @override
  onClose() {
    petugasPendaftarC.dispose();
    tanggalPengobatanC.dispose();
    tanggalKasusC.dispose();
    diagnosaBandingC.dispose();
    lokasiC.dispose();
    dosisC.dispose();
    sindromC.dispose();
    idKasusC.dispose();
    namaInfratukturC.dispose();
  }

  Future addPengobatan() async {
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
