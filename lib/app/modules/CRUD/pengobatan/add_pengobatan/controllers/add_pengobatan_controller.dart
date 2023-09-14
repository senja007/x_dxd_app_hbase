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
  TextEditingController namaInfrastrukturC = TextEditingController();
  TextEditingController dosisC = TextEditingController();
  TextEditingController sindromC = TextEditingController();
  TextEditingController dignosaBandingC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  TextEditingController namaPetugasC = TextEditingController();
  TextEditingController tanggalKasusC = TextEditingController();
  TextEditingController tanggalPengobatanC = TextEditingController();
  @override
  onClose() {
    idKasusC.dispose();
    namaInfrastrukturC.dispose();
    dosisC.dispose();
    sindromC.dispose();
    dignosaBandingC.dispose();
    lokasiC.dispose();
    namaPetugasC.dispose();
    tanggalKasusC.dispose();
    tanggalPengobatanC.dispose();
  }

  Future addPengobatan() async {
    try{
      isLoading.value = true;
      pengobatanModel = await PengobatanApi().addPengobatanAPI(
        idKasusC.text,
        namaInfrastrukturC.text,
        dosisC.text,
        sindromC.text,
        dignosaBandingC.text,
        lokasiC.text,
        namaPetugasC.text,
        tanggalKasusC.text,
        tanggalPengobatanC.text
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
