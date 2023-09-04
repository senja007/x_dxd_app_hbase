import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../../data/pengobatan_model.dart';

class AddPengobatanController extends GetxController {
  PengobatanModel? pengobatanModel;
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
    try{
      isLoading.value = true;
      pengobatanModel = await PengobatanModel().addPengobatanAPI(
        idKasusC.text,
        namaInfratukturC.text,
        dosisC.text,
        sindromC.text,
        diagnosaBandingC.text,
        lokasiC.text,
        petugasPendaftarC.text,
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
