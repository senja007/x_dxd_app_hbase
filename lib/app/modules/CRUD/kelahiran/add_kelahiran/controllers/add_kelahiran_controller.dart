import 'package:crud_flutter_api/app/data/kelahiran_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/kelahiran_api.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddkelahiranController extends GetxController {
  KelahiranModel? kelahiranModel;
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

  Future addKelahiran() async {
    try{
      isLoading.value = true;
      kelahiranModel = await KelahiranApi().addKelahiranAPI(
        idKejadianC.text, 
        eartagIndukC.text, 
        eartagAnakC.text, 
        idHewanIndukC.text,
        idHewanAnakC.text,
        idBatchC.text,
        idPejantanC.text,
        kelaminAnakC.text,
        jumlahC.text,
        kartuTernakAnakC.text,
        kartuTernakIndukC.text,
        kategoriC.text,
        lokasiC.text,
        idPeternakC.text,
        namaPeternakC.text,
        petugasPelaporC.text,
        produsenC.text,
        spesiesIndukC.text,
        spesiesPejantanC.text,
        tanggalLahirC.text,
        tanggalLaporanC.text,
        urutanIbC.text,
      );

      if (kelahiranModel != null) {
        if (kelahiranModel!.status == 200) {
          Get.offNamed(Routes.HOME); // Menggunakan Get.offNamed
        } else if (kelahiranModel!.status == 404) {
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

