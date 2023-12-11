import 'dart:io';
import 'dart:typed_data';

import 'package:crud_flutter_api/app/data/hewan_model.dart';
import 'package:crud_flutter_api/app/data/kandang_model.dart';
import 'package:crud_flutter_api/app/data/peternak_model.dart';
import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/modules/menu/hewan/controllers/hewan_controller.dart';
import 'package:crud_flutter_api/app/services/hewan_api.dart';
import 'package:crud_flutter_api/app/services/kandang_api.dart';
import 'package:crud_flutter_api/app/services/peternak_api.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:crud_flutter_api/app/utils/api.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_alert_dialog.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/successMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class DetailHewanController extends GetxController {
  final HewanController hewanController = Get.put(HewanController());
  //TODO: Implement DetailPostController
  final Map<String, dynamic> argsData = Get.arguments;
  HewanModel? hewanModel;
  RxBool isLoading = false.obs;
  RxBool isEditing = false.obs;
  final formattedDate = ''.obs;
  final formattedDate1 = ''.obs;
  RxString alamat = ''.obs;
  RxBool isLoadingCreateTodo = false.obs;
  RxString selectedGender = ''.obs;
  RxString selectedSpesies = ''.obs;
  RxString selectedPeternakId = ''.obs;
  RxList<PeternakModel> peternakList = <PeternakModel>[].obs;
  RxString selectedPetugasId = ''.obs;
  RxList<PetugasModel> petugasList = <PetugasModel>[].obs;
  RxString selectedKandangId = ''.obs;
  RxList<KandangModel> kandangList = <KandangModel>[].obs;
  SharedApi sharedApi = SharedApi();
  RxString selectedPeternakIdInEditMode = ''.obs;

  List<String> genders = ["Jantan", "Betina"];
  List<String> spesies = [
    "Banteng",
    "Domba",
    "Kambing",
    "Sapi",
    "Sapi Brahman",
    "Sapi Brangus",
    "Sapi Limosin",
    "Sapi fh",
    "Sapi Perah",
    "Sapi PO",
    "Sapi Simental"
  ];

  RxString strLatLong =
      'belum mendapatkan lat dan long, silakan tekan tombol'.obs;
  RxString strAlamat = 'mencari lokasi..'.obs;
  RxBool loading = false.obs;
  RxString latitude = ''.obs;
  RxString longitude = ''.obs;
  Rx<File?> fotoHewan = Rx<File?>(null);

  TextEditingController kodeEartagNasionalC = TextEditingController();
  TextEditingController noKartuTernakC = TextEditingController();
  TextEditingController provinsiC = TextEditingController();
  TextEditingController kabupatenC = TextEditingController();
  TextEditingController kecamatanC = TextEditingController();
  TextEditingController desaC = TextEditingController();
  TextEditingController namaPeternakC = TextEditingController();
  TextEditingController idPeternakC = TextEditingController();
  TextEditingController idKandagC = TextEditingController();
  TextEditingController nikPeternakC = TextEditingController();
  TextEditingController spesiesC = TextEditingController();
  TextEditingController sexC = TextEditingController();
  TextEditingController umurC = TextEditingController();
  TextEditingController identifikasiHewanC = TextEditingController();
  TextEditingController petugasPendaftarC = TextEditingController();
  TextEditingController tanggalTerdaftarC = TextEditingController();

  String originalEartag = "";
  String originalKartuTernak = "";
  String originalProvinsi = "";
  String originalKabupaten = "";
  String originalKecamatan = "";
  String originalDesa = "";
  String originalAlamat = "";
  String originalNamaPeternak = "";
  String originalIdPeternak = "";
  String originalIdKandang = "";
  String originalNikPeternak = "";
  String originalSpesies = "";
  String originalSex = "";
  String originalUmur = "";
  String originalIdentifikasi = "";
  String originalPetugas = "";
  String originalTanggal = "";
  String originalfotoHewan = "";
  String originalLatitude = "";
  String originalLongitude = "";

  @override
  onClose() {
    kodeEartagNasionalC.dispose();
    noKartuTernakC.dispose();
    provinsiC.dispose();
    kabupatenC.dispose();
    kecamatanC.dispose();
    desaC.dispose();
    namaPeternakC.dispose();
    idPeternakC.dispose();
    idKandagC.dispose();
    nikPeternakC.dispose();
    spesiesC.dispose();
    sexC.dispose();
    umurC.dispose();
    identifikasiHewanC.dispose();
    petugasPendaftarC.dispose();
    tanggalTerdaftarC.dispose();
    ever<File?>(fotoHewan, (_) {
      update();
    });
    //fotoHewanC.dispose();
    //fotoHewanC;
  }

  @override
  void onInit() {
    super.onInit();
    fetchPeternaks();
    fetchPetugas();
    fetchKandangs();

    selectedSpesies(argsData["spesies_hewan_detail"]);
    selectedGender(argsData["kelamin_hewan_detail"]);
    isEditing.value = false;
    //print(fotoHewanC);
    kodeEartagNasionalC.text = argsData["eartag_hewan_detail"];
    noKartuTernakC.text = argsData["kartu_hewan_detail"];
    provinsiC.text = argsData["provinsi_hewan_detail"];
    kabupatenC.text = argsData["kabupaten_hewan_detail"];
    kecamatanC.text = argsData["kecamatan_hewan_detail"];
    desaC.text = argsData["desa_hewan_detail"];
    alamat.value = argsData["alamat_hewan_detail"];
    //namaPeternakC.text = argsData["nama_peternak_hewan_detail"];
    idPeternakC.text = argsData["id_peternak_hewan_detail"];
    idKandagC.text = argsData["id_kandang_hewan_detail"];
    //selectedKandangId.value = argsData["id_kandang_hewan_detail"];
    //nikPeternakC.text = argsData["nik_hewan_detail"];
    spesiesC.text = argsData["spesies_hewan_detail"];
    sexC.text = argsData["kelamin_hewan_detail"];
    umurC.text = argsData["umur_hewan_detail"];
    identifikasiHewanC.text = argsData["identifikasi_hewan_detail"];
    petugasPendaftarC.text = argsData["petugas_terdaftar_hewan_detail"];
    tanggalTerdaftarC.text = argsData["tanggal_terdaftar_hewan_detail"];
    latitude.value = argsData["latitude_hewan_detail"];
    longitude.value = argsData["longitude_hewan_detail"];
    //fotoHewanC.text = argsData["foto_hewan_detail"];
    //fotoHewan.value = File(argsData["foto_hewan_detail"]);
    // Tambahkan listener untuk selectedPeternakId
    ever(selectedPeternakId, (String? selectedId) {
      // Perbarui nilai nikPeternakC dan namaPeternakC berdasarkan selectedId
      PeternakModel? selectedPeternak = peternakList.firstWhere(
          (peternak) => peternak.idPeternak == selectedId,
          orElse: () => PeternakModel());
      nikPeternakC.text =
          selectedPeternak.nikPeternak ?? argsData["nik_hewan_detail"];
      namaPeternakC.text = selectedPeternak.namaPeternak ??
          argsData["nama_peternak_hewan_detail"];
      update();
    });

    ever(selectedPetugasId, (String? selectedName) {
      // Perbarui nilai nikPeternakC dan namaPeternakC berdasarkan selectedId
      PetugasModel? selectedPetugassss = petugasList.firstWhere(
          (petugas) => petugas.namaPetugas == selectedName,
          orElse: () => PetugasModel());
      selectedPetugasId.value = selectedPetugassss.namaPetugas ??
          argsData["petugas_terdaftar_hewan_detail"];
      // namaPeternakC.text = selectedPetugassss.namaPetugas ??
      //     argsData["nama_peternak_hewan_detail"];
      print(selectedPetugasId.value);
      update();
    });

    ever(selectedKandangId, (String? selectedids) {
      // Perbarui nilai nikPeternakC dan namaPeternakC berdasarkan selectedId
      KandangModel? selectedKandangsss = kandangList.firstWhere(
          (kandang) => kandang.idKandang == selectedids,
          orElse: () => KandangModel());
      selectedKandangId.value =
          selectedKandangsss.idKandang ?? argsData["id_kandang_hewan_detail"];
      // namaPeternakC.text = selectedPetugassss.namaPetugas ??
      //     argsData["nama_peternak_hewan_detail"];
      print(selectedKandangId.value);
      update();
    });

    print(argsData["foto_hewan_detail"]);
    print(argsData["spesies_hewan_detail"]);

    originalEartag = argsData["eartag_hewan_detail"];
    originalKartuTernak = argsData["kartu_hewan_detail"];
    originalProvinsi = argsData["provinsi_hewan_detail"];
    originalKabupaten = argsData["kabupaten_hewan_detail"];
    originalKecamatan = argsData["kecamatan_hewan_detail"];
    originalDesa = argsData["desa_hewan_detail"];
    originalAlamat = argsData["alamat_hewan_detail"];
    originalNamaPeternak = argsData["nama_peternak_hewan_detail"];
    originalIdPeternak = argsData["id_peternak_hewan_detail"];
    originalIdKandang = argsData["id_kandang_hewan_detail"];
    originalNikPeternak = argsData["nik_hewan_detail"];
    originalSpesies = argsData["spesies_hewan_detail"];
    originalSex = argsData["kelamin_hewan_detail"];
    originalUmur = argsData["umur_hewan_detail"];
    originalIdentifikasi = argsData["identifikasi_hewan_detail"];
    originalPetugas = argsData["petugas_terdaftar_hewan_detail"];
    originalTanggal = argsData["tanggal_terdaftar_hewan_detail"];
    originalfotoHewan = argsData["foto_hewan_detail"];
    originalLatitude = argsData["latitude_hewan_detail"];
    originalLongitude = argsData["longitude_hewan_detail"];
  }

  Future<List<PeternakModel>> fetchPeternaks() async {
    try {
      final PeternakListModel peternakListModel =
          await PeternakApi().loadPeternakApi();
      final List<PeternakModel> peternaks = peternakListModel.content ?? [];
      if (peternaks.isNotEmpty) {
        selectedPeternakId.value = peternaks.first.idPeternak ?? '';
      }
      peternakList.assignAll(peternaks);
      print(selectedPeternakId.value);
      return peternaks;
    } catch (e) {
      // print('Error fetching peternaks: $e');
      // showErrorMessage("Error fetching peternaks: $e");
      return [];
    }
  }

  Future<List<KandangModel>> fetchKandangs() async {
    try {
      final KandangListModel kandangListModel =
          await KandangApi().loadKandangApi();
      final List<KandangModel> kandangs = kandangListModel.content ?? [];
      if (kandangs.isNotEmpty) {
        selectedKandangId.value = kandangs.first.idKandang ?? '';
      }
      kandangList.assignAll(kandangs);
      return kandangs;
    } catch (e) {
      print('Error fetching peternaks: $e');
      showErrorMessage("Error fetching peternaks: $e");
      return [];
    }
  }

  //GET DATA PETUGAS
  Future<List<PetugasModel>> fetchPetugas() async {
    try {
      final PetugasListModel petugasListModel =
          await PetugasApi().loadPetugasApi();
      final List<PetugasModel> petugass = petugasListModel.content ?? [];
      if (petugass.isNotEmpty) {
        selectedPetugasId.value = petugass.first.namaPetugas ?? '';
      }
      petugasList.assignAll(petugass);
      return petugass;
    } catch (e) {
      print('Error fetching Petugas: $e');
      showErrorMessage("Error fetching Petugas: $e");
      return [];
    }
  }

  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    //location service not enabled, don't continue
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location service Not Enabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied');
      }
    }

    //permission denied forever
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permission denied forever, we cannot access',
      );
    }
    //continue accessing the position of device
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  //getAddress
  Future<void> getAddressFromLongLat(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);

    Placemark place = placemarks[0];

    latitude.value = position.latitude.toString();
    longitude.value = position.longitude.toString();

    // String subLocality = place.subLocality ?? '';
    // String locality = place.locality ?? '';
    // String administrativeArea = place.administrativeArea ?? '';

    // String desiredAddress = '$subLocality $locality $administrativeArea';

    // strAlamat.value = desiredAddress.trim();

    strAlamat.value =
        '${place.subAdministrativeArea}, ${place.subLocality}, ${place.locality}, '
        '${place.postalCode}, ${place.country}, ${place.administrativeArea}';
  }

  // Fungsi untuk mendapatkan alamat dari geolocation dan mengupdate nilai provinsi, kabupaten, kecamatan, dan desa
  Future<void> updateAlamatInfo() async {
    try {
      isLoading.value = true;

      // Mendapatkan posisi geolokasi
      Position position = await getGeoLocationPosition();

      // Mendapatkan alamat dari geolokasi
      await getAddressFromLongLat(position);

      // Mengupdate nilai provinsi, kabupaten, kecamatan, dan desa berdasarkan alamat
      provinsiC.text = getAlamatInfo(5); //benar 5
      kabupatenC.text = getAlamatInfo(0); //benar 0
      kecamatanC.text = getAlamatInfo(2); //benar 2
      desaC.text = getAlamatInfo(1); //benar 1
    } catch (e) {
      print('Error updating alamat info: $e');
      showErrorMessage("Error updating alamat info: $e");
    } finally {
      isLoading.value = false;
    }
  }

// Fungsi untuk mendapatkan informasi alamat berdasarkan index
  String getAlamatInfo(int index) {
    List<String> alamatInfo = strAlamat.value.split(', ');
    if (index < alamatInfo.length) {
      return alamatInfo[index];
    } else {
      return '';
    }
  }

  /// Fungsi untuk memilih gambar dari galeri
  Future<void> pickImage(bool fromCamera) async {
    final ImageSource source =
        fromCamera ? ImageSource.camera : ImageSource.gallery;
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);

      // Kompresi gambar sebelum menyimpannya
      File compressedImage = await compressImage(imageFile);

      fotoHewan.value = compressedImage;
      update(); // Perbarui UI setelah memilih gambar
    }
  }

  Future<File> compressImage(File imageFile) async {
    // Kompresi gambar dengan ukuran tertentu (misalnya, kualitas 85)
    Uint8List? imageBytes = await FlutterImageCompress.compressWithFile(
      imageFile.absolute.path,
      quality: 20, // Sesuaikan dengan kebutuhan kamu
    );

    // Simpan gambar yang telah dikompresi
    File compressedImageFile = File('${imageFile.path}_compressed.jpg');
    await compressedImageFile.writeAsBytes(imageBytes!);

    return compressedImageFile;
  }

  // Fungsi untuk menghapus gambar yang sudah dipilih
  void removeImage() {
    fotoHewan.value = null;
    update(); // Perbarui UI setelah menghapus gambar
  }

  void updateFormattedDate(String newDate) {
    formattedDate.value = newDate;
  }

  void updateFormattedDate1(String newDate) {
    formattedDate1.value = newDate;
  }

  late DateTime selectedDate = DateTime.now();
  late DateTime selectedDate1 = DateTime.now();

  Future<void> tanggalTerdaftar(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      tanggalTerdaftarC.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  Future<void> tanggalLahir(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate1,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate1) {
      selectedDate1 = picked;
      umurC.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  Future<void> tombolEdit() async {
    isEditing.value = true;
    selectedPeternakIdInEditMode.value = selectedPeternakId.value;
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
        kodeEartagNasionalC.text = originalEartag;
        noKartuTernakC.text = originalKartuTernak;
        provinsiC.text = originalProvinsi;
        kabupatenC.text = originalKabupaten;
        kecamatanC.text = originalKecamatan;
        desaC.text = originalDesa;
        alamat.value = originalAlamat;
        namaPeternakC.text = originalNamaPeternak;
        selectedPeternakId.value = originalIdPeternak;
        idKandagC.text = originalIdKandang;
        idPeternakC.text = originalIdPeternak;
        nikPeternakC.text = originalNikPeternak;
        spesiesC.text = originalSpesies;
        sexC.text = originalSex;
        umurC.text = originalUmur;
        identifikasiHewanC.text = originalIdentifikasi;
        petugasPendaftarC.text = originalPetugas;
        tanggalTerdaftarC.text = originalTanggal;
        fotoHewan.value = null;
        latitude.value = originalLatitude;
        longitude.value = originalLongitude;
        isEditing.value = false;
      },
    );
  }

  Future<void> deleteHewan() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Hapus data Hewan",
      message: "Apakah anda ingin menghapus data Hewan ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        hewanModel =
            await HewanApi().deleteHewanApi(argsData["eartag_hewan_detail"]);
        if (hewanModel?.status == 200) {
          showSuccessMessage(
              "Berhasil Hapus Data Hewan dengan ID: ${kodeEartagNasionalC.text}");
        } else {
          showErrorMessage("Gagal Hapus Data Hewan");
        }
        final HewanController hewanController = Get.put(HewanController());
        hewanController.reInitialize();
        Get.back();
        Get.back();
        update();
      },
    );
  }

  Future<void> editHewan() async {
    CustomAlertDialog.showPresenceAlert(
      title: "edit data Hewan",
      message: "Apakah anda ingin mengedit data ini data Petugas ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        print(kodeEartagNasionalC);
        print(noKartuTernakC);
        print(provinsiC);
        print(kabupatenC);
        print(kecamatanC);
        print(desaC);
        print(alamat);
        print(selectedPeternakId);
        print(selectedKandangId);
        print(selectedSpesies);
        print(selectedPetugasId);

        hewanModel = await HewanApi().editHewanApi(
          kodeEartagNasionalC.text,
          noKartuTernakC.text,
          provinsiC.text,
          kabupatenC.text,
          kecamatanC.text,
          desaC.text,
          alamat.value = strAlamat.value,
          // namaPeternakC.text
          selectedPeternakId.value,
          selectedKandangId.value,
          // nikPeternakC.text,
          selectedSpesies.value,
          selectedGender.value,

          umurC.text,
          identifikasiHewanC.text,
          selectedPetugasId.value,
          tanggalTerdaftarC.text,
          fotoHewan.value,
          latitude: latitude.value,
          longitude: longitude.value,
        );

        if (hewanModel != null && hewanModel!.status == 201) {
          // Jika tagging berhasil, update data dan reset isEditing
          await updateAlamatInfo();
          isEditing.value = false;
          showSuccessMessage(
              "Berhasil mengedit Hewan dengan ID: ${kodeEartagNasionalC.text}");
        } else {
          // Jika tagging gagal, tidak perlu merubah data dan status isEditing
          showErrorMessage("Gagal mengedit Data Hewan ");
        }

        // Tetap reinitialize jika berhasil atau tidak
        hewanController.reInitialize();

        Get.back();
        Get.back();
        update();
      },
    );
  }
}
