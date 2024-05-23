import 'package:crud_flutter_api/app/data/hewan_model.dart';
import 'package:crud_flutter_api/app/data/kelahiran_model.dart';
import 'package:crud_flutter_api/app/data/peternak_model.dart';
import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/modules/menu/kelahiran/controllers/kelahiran_controller.dart';
import 'package:crud_flutter_api/app/services/fetch_data.dart';
import 'package:crud_flutter_api/app/services/hewan_api.dart';
import 'package:crud_flutter_api/app/services/kelahiran_api.dart';
import 'package:crud_flutter_api/app/services/peternak_api.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_alert_dialog.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/successMessage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';

class DetailKelahiranController extends GetxController {
  final FetchData fetchData = Get.put(FetchData());
  final KelahiranController kelahiranController =
      Get.put(KelahiranController());

  final Map<String, dynamic> argsData = Get.arguments;
  KelahiranModel? kelahiranModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  RxBool isEditing = false.obs;
  RxString selectedPeternakIdInEditMode = ''.obs;
  RxString selectedGender = ''.obs;
  List<String> genders = ["Jantan", "Betina"];

  TextEditingController idKejadianC = TextEditingController();
  TextEditingController tanggalLaporanC = TextEditingController();
  TextEditingController tanggalLahirC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  //TextEditingController namaPeternakC = TextEditingController();
  TextEditingController idPeternakC = TextEditingController();
  TextEditingController kartuTernakIndukC = TextEditingController();
  TextEditingController eartagIndukC = TextEditingController();
  TextEditingController kodeEartagNasionalC = TextEditingController();
  TextEditingController idHewanIndukC = TextEditingController();
  TextEditingController spesiesIndukC = TextEditingController();
  TextEditingController idPejantanStrawC = TextEditingController();
  TextEditingController idBatchStrawC = TextEditingController();
  TextEditingController produsenStrawC = TextEditingController();
  TextEditingController spesiesPejantanC = TextEditingController();
  TextEditingController jumlahC = TextEditingController();
  TextEditingController kartuTernakAnakC = TextEditingController();
  TextEditingController eartagAnakC = TextEditingController();
  TextEditingController idHewanAnakC = TextEditingController();
  TextEditingController jenisKelaminAnakC = TextEditingController();
  TextEditingController kategoriC = TextEditingController();
  TextEditingController petugasPelaporC = TextEditingController();
  TextEditingController urutanIbC = TextEditingController();

  String originalidKejadian = "";
  String originaltanggalLaporan = "";
  String originaltanggalLahir = "";
  String originallokasi = "";
  String originalnamaPeternak = "";
  String originalidPeternak = "";
  String originalkartuTernakInduk = "";
  String originaleartagInduk = "";
  String originalkodeEartagNasional = "";
  String originalidHewanInduk = "";
  String originalspesiesInduk = "";
  String originalidPejantanStraw = "";
  String originalidBatchStraw = "";
  String originalprodusenStraw = "";
  String originalspesiesPejantan = "";
  String originaljumlah = "";
  String originalkartuTernakAnak = "";
  String originaleartagAnak = "";
  String originalidHewanAnak = "";
  String originaljenisKelaminAnak = "";
  String originalkategori = "";
  String originalpetugasPelapor = "";
  String originalurutanIb = "";

  @override
  onClose() {
    idKejadianC.dispose();
    tanggalLaporanC.dispose();
    tanggalLahirC.dispose();
    lokasiC.dispose();
    //namaPeternakC.dispose();
    idPeternakC.dispose();
    kartuTernakIndukC.dispose();
    eartagIndukC.dispose();
    idHewanIndukC.dispose();
    spesiesIndukC.dispose();
    idPejantanStrawC.dispose();
    idBatchStrawC.dispose();
    produsenStrawC.dispose();
    spesiesPejantanC.dispose();
    jumlahC.dispose();
    kartuTernakAnakC.dispose();
    eartagAnakC.dispose();
    idHewanAnakC.dispose();
    jenisKelaminAnakC.dispose();
    kategoriC.dispose();
    petugasPelaporC.dispose();
    urutanIbC.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    fetchData.fetchPeternaks();
    fetchData.fetchHewan();
    fetchData.fetchPetugas();

    selectedGender(argsData["kelamin_anak_detail"]);

    idKejadianC.text = argsData["id_kejadian_detail"];
    tanggalLaporanC.text = argsData["tanggal_laporan_detail"];
    tanggalLahirC.text = argsData["tanggal_lahir_detail"];
    lokasiC.text = argsData["lokasi_detail"];
    //namaPeternakC.text = argsData["nama_peternak_detail"];
    idPeternakC.text = argsData["id_peternak_detail"];
    kartuTernakIndukC.text = argsData["kartu_ternak_induk_detail"];
    eartagIndukC.text = argsData["eartag_induk_detail"];
    kodeEartagNasionalC.text = argsData["kodeEartagNasional"];
    idHewanIndukC.text = argsData["id_hewan_induk_detail"];
    spesiesIndukC.text = argsData["spesies_induk_detail"];
    idPejantanStrawC.text = argsData["id_pejantan_detail"];
    idBatchStrawC.text = argsData["id_batch_detail"];
    produsenStrawC.text = argsData["produsen_detail"];
    spesiesPejantanC.text = argsData["spesies_pejantan_detail"];
    jumlahC.text = argsData["jumlah_detail"];
    kartuTernakAnakC.text = argsData["kartu_ternak_anak_detail"];
    eartagAnakC.text = argsData["eartag_anak_detail"];
    idHewanAnakC.text = argsData["id_hewan_anak_detail"];
    jenisKelaminAnakC.text = argsData["kelamin_anak_detail"];
    kategoriC.text = argsData["kategori_detail"];
    petugasPelaporC.text = argsData["petugas_pelapor_detail"];
    urutanIbC.text = argsData["urutan_ib_detail"];

    ever(fetchData.selectedPeternakId, (String? selectedId) {
      // Perbarui nilai nikPeternakC dan namaPeternakC berdasarkan selectedId
      PeternakModel? selectedPeternak = fetchData.peternakList.firstWhere(
          (peternak) => peternak.idPeternak == selectedId,
          orElse: () => PeternakModel());
      idPeternakC.text =
          selectedPeternak.namaPeternak ?? argsData["id_peternak_detail"];
      update();
    });

    ever(fetchData.selectedHewanEartag, (String? selectedId) {
      // Perbarui nilai nikPeternakC dan namaPeternakC berdasarkan selectedId
      HewanModel? selectedHewan = fetchData.hewanList.firstWhere(
          (peternak) => peternak.kodeEartagNasional == selectedId,
          orElse: () => HewanModel());
      kodeEartagNasionalC.text =
          selectedHewan.kodeEartagNasional ?? argsData["kodeEartagNasional"];
      update();
    });

    ever(fetchData.selectedPetugasId, (String? selectedName) {
      // Perbarui nilai nikPeternakC dan namaPeternakC berdasarkan selectedId
      PetugasModel? selectedPetugassss = fetchData.petugasList.firstWhere(
          (petugas) => petugas.nikPetugas == selectedName,
          orElse: () => PetugasModel());
      fetchData.selectedPetugasId.value =
          selectedPetugassss.nikPetugas ?? argsData["petugas_pelapor_detail"];
      // namaPeternakC.text = selectedPetugassss.namaPetugas ??
      //     argsData["nama_peternak_hewan_detail"];
      //print(selectedPetugasId.value);
      update();
    });

    originalidKejadian = argsData["id_kejadian_detail"];
    originaltanggalLaporan = argsData["tanggal_laporan_detail"];
    originaltanggalLahir = argsData["tanggal_lahir_detail"];
    originallokasi = argsData["lokasi_detail"];
    // originalnamaPeternak = argsData["nama_peternak_detail"];
    originalidPeternak = argsData["id_peternak_detail"];
    originalkartuTernakInduk = argsData["kartu_ternak_induk_detail"];
    originaleartagInduk = argsData["eartag_induk_detail"];
    originalkodeEartagNasional = argsData["kodeEartagNasional"];
    originalidHewanInduk = argsData["id_hewan_induk_detail"];
    originalspesiesInduk = argsData["spesies_induk_detail"];
    originalidPejantanStraw = argsData["id_pejantan_detail"];
    originalidBatchStraw = argsData["id_batch_detail"];
    originalprodusenStraw = argsData["produsen_detail"];
    originalspesiesPejantan = argsData["spesies_pejantan_detail"];
    originaljumlah = argsData["jumlah_detail"];
    originalkartuTernakAnak = argsData["kartu_ternak_anak_detail"];
    originaleartagAnak = argsData["eartag_anak_detail"];
    originalidHewanAnak = argsData["id_hewan_anak_detail"];
    originaljenisKelaminAnak = argsData["kelamin_anak_detail"];
    originalkategori = argsData["kategori_detail"];
    originalpetugasPelapor = argsData["petugas_pelapor_detail"];
    originalurutanIb = argsData["urutan_ib_detail"];
  }

  Future<void> tombolEdit() async {
    isEditing.value = true;
    selectedPeternakIdInEditMode.value = fetchData.selectedPeternakId.value;
    update();
  }

  Future<void> tutupEdit() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Batal Edit",
      message: "Apakah anda ingin keluar dari edit ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back();
        update();
        // Reset data ke yang sebelumnya
        idKejadianC.text = originalidKejadian;
        tanggalLaporanC.text = originaltanggalLaporan;
        tanggalLahirC.text = originaltanggalLahir;
        lokasiC.text = originallokasi;
        //namaPeternakC.text = originalnamaPeternak;
        idPeternakC.text = originalidPeternak;
        fetchData.selectedPeternakId.value = originalidPeternak;
        kartuTernakIndukC.text = originalkartuTernakInduk;
        eartagIndukC.text = originaleartagInduk;
        kodeEartagNasionalC.text = originalkodeEartagNasional;
        fetchData.selectedHewanEartag.value = originalkodeEartagNasional;
        idHewanIndukC.text = originalidHewanInduk;
        spesiesIndukC.text = originalspesiesInduk;
        idPejantanStrawC.text = originalidPejantanStraw;
        idBatchStrawC.text = originalidBatchStraw;
        produsenStrawC.text = originalprodusenStraw;
        spesiesPejantanC.text = originalspesiesPejantan;
        jumlahC.text = originaljumlah;
        kartuTernakAnakC.text = originalkartuTernakAnak;
        eartagAnakC.text = originaleartagAnak;
        idHewanAnakC.text = originalidHewanAnak;
        jenisKelaminAnakC.text = originaljenisKelaminAnak;
        selectedGender.value = originaljenisKelaminAnak;
        kategoriC.text = originalkategori;
        fetchData.selectedPetugasId.value = originalpetugasPelapor;
        petugasPelaporC.text = originalpetugasPelapor;
        urutanIbC.text = originalurutanIb;

        isEditing.value = false;
      },
    );
  }

  Future<void> deleteKelahiran() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Hapus data todo",
      message: "Apakah anda ingin menghapus data todo ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        kelahiranModel = await KelahiranApi()
            .deleteKelahiranAPI(argsData["id_kejadian_detail"]);
        if (kelahiranModel != null) {
          if (kelahiranModel!.status == 200) {
            showSuccessMessage(
                "Berhasil Hapus Data Kelahiran dengan ID: ${idKejadianC.text}");
          } else {
            showErrorMessage("Gagal Hapus Data Kelahiran ");
          }
        }
        final KelahiranController kelahiranController =
            Get.put(KelahiranController());
        kelahiranController.reInitialize();
        Get.back();
        Get.back();
        update();
      },
    );
  }

  Future<void> editKelahiran() async {
    CustomAlertDialog.showPresenceAlert(
      title: "edit data Kelahiran",
      message: "Apakah anda ingin mengedit data Kelahiran ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        kelahiranModel = await KelahiranApi().editKelahiranApi(
          idKejadianC.text,
          tanggalLaporanC.text,
          tanggalLahirC.text,
          lokasiC.text,
          //namaPeternakC.text,
          //idPeternakC.text,
          fetchData.selectedPeternakId.value,
          kartuTernakIndukC.text,
          eartagIndukC.text,
          fetchData.selectedHewanEartag.value,
          idHewanIndukC.text,
          spesiesIndukC.text,
          idPejantanStrawC.text,
          idBatchStrawC.text,
          produsenStrawC.text,
          spesiesPejantanC.text,
          jumlahC.text,
          kartuTernakAnakC.text,
          eartagAnakC.text,
          idHewanAnakC.text,
          selectedGender.value,
          kategoriC.text,
          fetchData.selectedPetugasId.value,
          //petugasPelaporC.text,
          urutanIbC.text,
        );
        isEditing.value = false;
        if (kelahiranModel != null) {
          if (kelahiranModel!.status == 200) {
            showSuccessMessage(
                "Berhasil Edit Data Kelahiran dengan ID: ${idKejadianC.text}");
          } else {
            showErrorMessage("Gagal Edit Data Kelahiran ");
          }
        }
        final KelahiranController kelahiranController =
            Get.put(KelahiranController());
        kelahiranController.reInitialize();
        Get.back();
        Get.back();
        update();
      },
    );
  }

  late DateTime selectedDate = DateTime.now();
  late DateTime selectedDate1 = DateTime.now();

  Future<void> tanggalLaporan(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      tanggalLaporanC.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  Future<void> tanggalLahir(BuildContext context) async {
    final DateTime? picked1 = await showDatePicker(
      context: context,
      initialDate: selectedDate1,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked1 != null && picked1 != selectedDate1) {
      selectedDate1 = picked1;
      tanggalLahirC.text = DateFormat('dd/MM/yyyy').format(picked1);
    }
  }
}
