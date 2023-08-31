import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddkelahiranController extends GetxController {
  PetugasModel? petugasModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  TextEditingController idKejadianC = TextEditingController();
  TextEditingController eartagIndukC = TextEditingController();
  TextEditingController eartagAnakC = TextEditingController();
  TextEditingController idHewanIndukC = TextEditingController();
  TextEditingController idHewanAnakC = TextEditingController();
  TextEditingController idBatchC = TextEditingController();
  TextEditingController idPejantanC = TextEditingController();
  TextEditingController kelaminAnakC = TextEditingController();
  TextEditingController jumlahC = TextEditingController();
  TextEditingController kartuTernakAnakC = TextEditingController();
  TextEditingController kartuTernakIndukC = TextEditingController();
  TextEditingController kategoriC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  TextEditingController idPeternakC = TextEditingController();
  TextEditingController namaPeternakC = TextEditingController();
  TextEditingController petugasPelaporC = TextEditingController();
  TextEditingController produsenC = TextEditingController();
  TextEditingController spesiesIndukC = TextEditingController();
  TextEditingController spesiesPejantanC = TextEditingController();
  TextEditingController tanggalLahirC = TextEditingController();
  TextEditingController tanggalLaporanC = TextEditingController();
  TextEditingController urutanIbC = TextEditingController();
  @override
  onClose() {
    tanggalLaporanC.dispose();
    urutanIbC.dispose();
    spesiesPejantanC.dispose();
    tanggalLahirC.dispose();
    produsenC.dispose();
    spesiesIndukC.dispose();
    namaPeternakC.dispose();
    petugasPelaporC.dispose();
    lokasiC.dispose();
    idPeternakC.dispose();
    kartuTernakIndukC.dispose();
    kategoriC.dispose();
    jumlahC.dispose();
    kartuTernakAnakC.dispose();
    idHewanAnakC.dispose();
    idBatchC.dispose();
    eartagAnakC.dispose();
    idHewanIndukC.dispose();
    idKejadianC.dispose();
    eartagIndukC.dispose();
  }

  Future addPost() async {
    update();
    //  petugasModel = await PetugasApi().addPetugasApi(titleC.text, contentC.text);
    if (petugasModel!.status == 200) {
      update();
      Get.offAndToNamed(Routes.HOME); //ganti route sesuai data menu
    } else if (petugasModel!.status == 404) {
      update();
    }
  }
}
