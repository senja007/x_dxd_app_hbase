import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddPeternakController extends GetxController {
  PetugasModel? petugasModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  TextEditingController idPeternakC = TextEditingController();
  TextEditingController idIshiknasC = TextEditingController();
  TextEditingController nikC = TextEditingController();
  TextEditingController namaC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  TextEditingController petugasPendaftarC = TextEditingController();
  TextEditingController tanggalPendaftaranC = TextEditingController();

  @override
  onClose() {
    lokasiC.dispose();
    tanggalPendaftaranC.dispose();
    petugasPendaftarC.dispose();
    nikC.dispose();
    namaC.dispose();
    idPeternakC.dispose();
    idIshiknasC.dispose();
  }

  Future addPeternak() async {
    try{
      isLoading.value = true;
      // peternakModel = await PeternakModel().addPeternakAPI(
      //   idPeternakC.text,
      //   idIshiknasC.text,
      //   nikC.text,
      //   namaC.text,
      //   lokasiC.text,
      //   petugasPendaftarC.text,
      //   tanggalPendaftaranC.text
      // );

      // if (peternakModel != null) {
      //   if (peternakModel!.status == 200) {
      //     Get.offNamed(Routes.HOME); // Menggunakan Get.offNamed
      //   } else if (peternakModel!.status == 404) {
      //     // Handle status 404
      //   }
      // }
    } catch (e) {
      // Handle exceptions here
    } finally {
      isLoading.value = false;
    }}}