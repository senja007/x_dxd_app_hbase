import 'dart:convert';
import 'dart:io';

import 'package:crud_flutter_api/app/data/hewan_model.dart';
import 'package:crud_flutter_api/app/data/peternak_model.dart';
import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/modules/menu/hewan/controllers/hewan_controller.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/hewan_api.dart';
import 'package:crud_flutter_api/app/services/peternak_api.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/successMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class AddHewanController extends GetxController {
  HewanModel? hewanModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  final formattedDate = ''.obs;
  RxString selectedGender = 'Jantan'.obs;
  List<String> genders = ["Jantan", "Betina"];
  Rx<File?> fotoHewan = Rx<File?>(null);
  //Rx<File?> fotoHewan = Rx<File?>(File(''));
  RxList<PeternakModel> peternakList = <PeternakModel>[].obs;
  RxString selectedPeternakId = ''.obs;
  //RxString selectedProvince = ''.obs; // Kode Provinsi Jawa Timur
  //RxList regencies = [].obs;
  RxString strLatLong =
      'belum mendapatkan lat dan long, silakan tekan tombol'.obs;
  RxString strAlamat = 'mencari lokasi..'.obs;
  bool loading = false;

  TextEditingController kodeEartagNasionalC = TextEditingController();
  TextEditingController noKartuTernakC = TextEditingController();
  TextEditingController provinsiC = TextEditingController();
  TextEditingController kabupatenC = TextEditingController();
  TextEditingController kecamatanC = TextEditingController();
  TextEditingController desaC = TextEditingController();
  TextEditingController namaPeternakC = TextEditingController();
  TextEditingController idPeternakC = TextEditingController();
  TextEditingController nikPeternakC = TextEditingController();
  TextEditingController spesiesC = TextEditingController();

  TextEditingController umurC = TextEditingController();
  TextEditingController identifikasiHewanC = TextEditingController();
  TextEditingController petugasPendaftarC = TextEditingController();
  TextEditingController tanggalTerdaftarC = TextEditingController();

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
    nikPeternakC.dispose();
    spesiesC.dispose();

    umurC.dispose();
    identifikasiHewanC.dispose();
    petugasPendaftarC.dispose();
    tanggalTerdaftarC.dispose();
    ever<File?>(fotoHewan, (_) {
      update();
    });
  }

  @override
  void onInit() {
    super.onInit();
    fetchPeternaks();
    
    //_getGeoLocationPosition();
    //selectedProvince.value = '35';
    //getRegencies();
    //print(getRegencies());
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
      return peternaks;
    } catch (e) {
      print('Error fetching peternaks: $e');
      showErrorMessage("Error fetching peternaks: $e");
      return [];
    }
  }

  // Future<void> getRegencies() async {
  //   final response = await http.get(Uri.parse(
  //       'https://www.emsifa.com/api-wilayah-indonesia/api/regencies/$selectedProvince.json'));

  //   if (response.statusCode == 200) {
  //     List<dynamic> data = jsonDecode(response.body);

  //     regencies.value = List<Map<String, dynamic>>.from(data);
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  //   print(regencies);
  // }

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

  // //getAddress
  Future<void> getAddressFromLongLat(Position position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);

    Placemark place = placemarks[0];
  
      strAlamat.value = '${place.street}, ${place.subLocality}, ${place.locality}, '
          '${place.postalCode}, ${place.country}' ;

  }

//   //getLATLONG
//   Future<Position> _getGeoLocationPosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();

//     if (serviceEnabled) {
//       await Geolocator.openLocationSettings();
//       return Future.error('Location service is not enabled');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('location permission is denied');
//       }
//     }

//     //permision denied forever
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'location permission denied forever, please try again');
//     }

// //contiue accessing the position of device
//     return await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//   }

//   //getAdress
//   Future<void> getAdressFromLatLong(Position position) async {
//     List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
//     print(placemarks);

//     Placemark place = placemarks[0];

// strAlamat = '${place.street}, ${place.subLocality}, ${place.locality}, ' 
//   '${place.postalCode}, ${place.country}' as RxString;
//   }

  

  // Fungsi untuk memilih gambar dari galeri
  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      fotoHewan.value = File(pickedFile.path);
      update(); // Perbarui UI setelah memilih gambar
    }
  }

  // Fungsi untuk menghapus gambar yang sudah dipilih
  void removeImage() {
    fotoHewan.value = null;
    update(); // Perbarui UI setelah menghapus gambar
  }

  Future addHewan(BuildContext context) async {
    try {
      isLoading.value = true;

      if (kodeEartagNasionalC.text.isEmpty) {
        throw "Kode Eartag tidak boleh kosong.";
      }

      if (selectedPeternakId.value.isEmpty) {
        throw "Pilih Peternak terlebih dahulu.";
      }

      hewanModel = await HewanApi().addHewanAPI(
        kodeEartagNasionalC.text,
        noKartuTernakC.text,
        provinsiC.text,
        kabupatenC.text,
        kecamatanC.text,
        desaC.text,
        namaPeternakC.text,
        selectedPeternakId.value,
        nikPeternakC.text,
        spesiesC.text,
        selectedGender.value,
        umurC.text,
        identifikasiHewanC.text,
        petugasPendaftarC.text,
        tanggalTerdaftarC.text,
        fotoHewan.value!,
      );
      if (hewanModel != null) {
        if (hewanModel?.status == 201) {
          final HewanController hewanController = Get.put(HewanController());
          hewanController.reInitialize();
          Get.back();
          showSuccessMessage("Data Hewan Baru Berhasil ditambahkan");
        } else {
          showErrorMessage(
              "Gagal menambahkan Hewan dengan status ${hewanModel?.status}");
        }
      }
    } catch (e) {
      showCupertinoDialog(
        context: context, // Gunakan context yang diberikan sebagai parameter.
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("Kesalahan"),
            content: Text(e.toString()),
            actions: [
              CupertinoDialogAction(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    } finally {
      isLoading.value = false;
    }
  }

  void updateFormattedDate(String newDate) {
    formattedDate.value = newDate;
  }

  late DateTime selectedDate = DateTime.now();

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




  
}
