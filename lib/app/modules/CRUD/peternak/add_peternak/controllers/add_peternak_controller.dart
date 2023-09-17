import 'package:crud_flutter_api/app/data/peternak_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/peternak_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddPeternakController extends GetxController {
  PeternakModel? peternakModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  TextEditingController idPeternakC = TextEditingController();
  TextEditingController nikPeternakC = TextEditingController();
  TextEditingController namaPeternakC = TextEditingController();
  TextEditingController idISIKHNASC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  TextEditingController petugasPendaftarC = TextEditingController();
  TextEditingController tanggalPendaftaranC = TextEditingController();

  @override
  onClose() {
    idPeternakC.dispose();
    nikPeternakC.dispose();
    namaPeternakC.dispose();
    idISIKHNASC.dispose();
    lokasiC.dispose();
    petugasPendaftarC.dispose();
    tanggalPendaftaranC.dispose();
  }

  Future addPeternak() async {
    try {
      isLoading.value = true;
      peternakModel = await PeternakApi().addPeternakAPI(
          idPeternakC.text,
          nikPeternakC.text,
          namaPeternakC.text,
          idISIKHNASC.text,
          lokasiC.text,
          petugasPendaftarC.text,
          tanggalPendaftaranC.text);

      if (peternakModel != null) {
        if (peternakModel!.status == 200) {
          Get.offNamed(Routes.HOME); // Menggunakan Get.offNamed
        } else if (peternakModel!.status == 404) {
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
