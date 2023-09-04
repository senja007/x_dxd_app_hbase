import 'package:crud_flutter_api/app/data/inseminasi_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../../services/inseminasi_api.dart';

class AddInseminasiController extends GetxController {
  InseminasiModel? inseminasiModel;
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

  Future addInseminasi() async {
    try {
      isLoading.value = true;
      inseminasiModel = await InseminasiApi().addInseminasiAPI(
        idInseminasiC.text, 
        eartagC.text, 
        idHewanC.text, 
        idPembuatanC.text,
        idPejantanC.text,
        bangsaPejantanC.text,
        ib1C.text,
        ib2C.text,
        ib3C.text,
        ibLainC.text,
        produsenC.text,
        idPeternakC.text,
        namaPeternakC.text,
        lokasiC.text,
        inseminatorC.text,
        tanggalIbC.text);

      if (inseminasiModel != null) {
        if (inseminasiModel!.status == 200) {
          Get.offNamed(Routes.HOME); // Menggunakan Get.offNamed
        } else if (inseminasiModel!.status == 404) {
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
