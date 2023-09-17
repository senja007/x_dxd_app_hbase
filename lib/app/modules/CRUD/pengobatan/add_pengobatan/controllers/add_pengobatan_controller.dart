import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/pengobatan_api..dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../../data/pengobatan_model.dart';

class AddPengobatanController extends GetxController {
  PengobatanModel? pengobatanModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  TextEditingController idKasusC = TextEditingController();
  TextEditingController tanggalPengobatanC = TextEditingController();
  TextEditingController tanggalKasusC = TextEditingController();
  TextEditingController namaPetugasC = TextEditingController();
  TextEditingController namaInfrastrukturC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  TextEditingController dosisC = TextEditingController();
  TextEditingController sindromC = TextEditingController();
  TextEditingController dignosaBandingC = TextEditingController();
  @override
  onClose() {
    idKasusC.dispose();
    tanggalPengobatanC.dispose();
    tanggalKasusC.dispose();
    namaPetugasC.dispose();
    namaInfrastrukturC.dispose();
    lokasiC.dispose();
    dosisC.dispose();
    sindromC.dispose();
    dignosaBandingC.dispose();
  }

  Future addPengobatan() async {
    try {
      isLoading.value = true;
      pengobatanModel = await PengobatanApi().addPengobatanAPI(
        idKasusC.text,
        tanggalPengobatanC.text,
        tanggalKasusC.text,
        namaPetugasC.text,
        namaInfrastrukturC.text,
        lokasiC.text,
        dosisC.text,
        sindromC.text,
        dignosaBandingC.text,
      );

      if (pengobatanModel != null) {
        if (pengobatanModel!.status == 200) {
          Get.offNamed(Routes.HOME); // Menggunakan Get.offNamed
        } else if (pengobatanModel!.status == 404) {
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
