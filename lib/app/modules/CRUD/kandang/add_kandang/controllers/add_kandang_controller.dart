import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:crud_flutter_api/app/data/hewan_model.dart';
import 'package:crud_flutter_api/app/data/kandang_model.dart';
import 'package:crud_flutter_api/app/data/peternak_model.dart';
import 'package:crud_flutter_api/app/modules/menu/kandang/controllers/kandang_controller.dart';
import 'package:crud_flutter_api/app/services/kandang_api.dart';
import 'package:crud_flutter_api/app/services/peternak_api.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/successMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AddKandangController extends GetxController {
  KandangModel? kandangModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  final formattedDate = ''.obs; // Gunakan .obs untuk membuat Rx variabel
  final KandangController kandangController = Get.put(KandangController());
  Rx<File?> fotoKandang = Rx<File?>(null);
  RxString selectedPeternakId = ''.obs;
  RxList<PeternakModel> peternakList = <PeternakModel>[].obs;
  RxString strLatLong =
      'belum mendapatkan lat dan long, silakan tekan tombol'.obs;
  RxString strAlamat = 'mencari lokasi..'.obs;
  RxBool loading = false.obs;
  RxString selcetedProvinsi = ''.obs;
  RxString selcetedKabupaten = ''.obs;
  RxString selcetedKecamatan = ''.obs;
  RxString selcetedDesa = ''.obs;
  RxString latitude = ''.obs;
  RxString longitude = ''.obs;

  TextEditingController idKandangC = TextEditingController();
  TextEditingController idPeternakC = TextEditingController();
  TextEditingController namaPeternakC = TextEditingController();
  TextEditingController luasC = TextEditingController();
  TextEditingController kapasitasC = TextEditingController();
  TextEditingController nilaiBangunanC = TextEditingController();
  TextEditingController alamatC = TextEditingController();
  TextEditingController desaC = TextEditingController();
  TextEditingController kecamatanC = TextEditingController();
  TextEditingController kabupatenC = TextEditingController();
  TextEditingController provinsiC = TextEditingController();

  @override
  onClose() {
    idKandangC.dispose();
    idPeternakC.dispose();
    namaPeternakC.dispose();
    luasC.dispose();
    kapasitasC.dispose();
    nilaiBangunanC.dispose();
    alamatC.dispose();
    desaC.dispose();
    kecamatanC.dispose();
    kabupatenC.dispose();
    provinsiC.dispose();
    ever<File?>(fotoKandang, (_) {
      update();
    });
  }

  @override
  void onInit() {
    super.onInit();
    // fetchProvinsiData();
    // fetchKabupatenData(selcetedProvinsi.value);
    fetchPeternaks();
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

  // Fungsi untuk memilih gambar dari galeri
  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      fotoKandang.value = File(pickedFile.path);
      update(); // Perbarui UI setelah memilih gambar
    }
  }

  // Fungsi untuk menghapus gambar yang sudah dipilih
  void removeImage() {
    fotoKandang.value = null;
    update(); // Perbarui UI setelah menghapus gambar
  }

  Future addKandang(BuildContext context) async {
    try {
      isLoading.value = true;

      if (idKandangC.text.isEmpty) {
        throw "ID Kandang tidak boleh kosong.";
      }

      if (selectedPeternakId.value.isEmpty) {
        throw "Pilih Peternak terlebih dahulu.";
      }

      File? fotoKandangFile = fotoKandang.value;

      if (fotoKandangFile == null) {
        throw "Pilih gambar Kandang terlebih dahulu.";
      }


      kandangModel = await KandangApi().addKandangAPI(
        idKandangC.text,
        selectedPeternakId.value,
        namaPeternakC.text,
        luasC.text,
        kapasitasC.text,
        nilaiBangunanC.text,
        alamatC.text,
        provinsiC.text,
        kabupatenC.text,
        kecamatanC.text,
        desaC.text,
        // selcetedProvinsi.value,
        // selcetedKabupaten.value,
        // selcetedKecamatan.value,
        // selcetedDesa.value,
        fotoKandangFile,
        latitude: latitude.value,
        longitude: longitude.value,
      );
     //await updateAlamatInfo();

      if (kandangModel != null) {
        if (kandangModel?.status == 201) {
          final KandangController hewanController = Get.put(KandangController());
          hewanController.reInitialize();
          Get.back();
          showSuccessMessage("Data Hewan Baru Berhasil ditambahkan");
        } else {
          showErrorMessage(
              "Gagal menambahkan Hewan dengan status ${kandangModel?.status}");
        }
      }
    } catch (e) {
      showCupertinoDialog(
        context: context,
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
}

//   Future addKandang(BuildContext context) async {
//     try {
//       isLoading.value = true;
//       kandangModel = await KandangApi().addKandangAPI(
//         idKandangC.text,
//         idPeternakC.text,
//         namaPeternakC.text,
//         luasC.text,
//         kapasitasC.text,
//         nilaiBangunanC.text,
//         alamatC.text,
//         desaC.text,
//         kecamatanC.text,
//         //kabupatenC.text,
//         selcetedProvinsi.value,
//         selcetedKabupaten.value,
//         latitude: 
//       );

//       if (kandangModel != null) {
//         if (kandangModel!.status == 201) {
//           kandangController.reInitialize();
//           Get.back();
//           showSuccessMessage("Kandang Baru berhasil ditambahkan");
//         } else {
//           showErrorMessage(
//               "Gagal menambahkan Kandang dengan status ${kandangModel?.status}");
//         }
//       }
//     } catch (e) {
//       showCupertinoDialog(
//         context: context, // Gunakan context yang diberikan sebagai parameter.
//         builder: (context) {
//           return CupertinoAlertDialog(
//             title: Text("Kesalahan"),
//             content: Text(e.toString()),
//             actions: [
//               CupertinoDialogAction(
//                 child: Text("OK"),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }


  // void fetchProvinsiData() async { 
  //   final response = await http.get(Uri.parse(
  //       'https://www.emsifa.com/api-wilayah-indonesia/api/provinces.json'));

  //   if (response.statusCode == 200) {
  //     final List<dynamic> data = json.decode(response.body);
  //     provinsi.clear();
  //     data.forEach((province) {
  //       provinsi.add(province['id']);
  //       provinsi.add(province['name']);
      
  //     });
  //   } else {
  //     // Handle the error if the request fails
  //     print('Failed to fetch provinsi data');
  //   }
  // }


// void fetchKabupatenData(String idProvinsi) async {
//   final response = await http.get(Uri.parse(
//       'https://www.emsifa.com/api-wilayah-indonesia/api/regencies/.json'));

//   if (response.statusCode == 200) {
//     final List<dynamic> data = json.decode(response.body);
//     kabupaten.clear();
//     data.forEach((regency) {
//       kabupaten.add(regency['name']);
//     });
//   } else {
//     // Handle the error if the request fails
//     print('Failed to fetch kabupaten data');
//   }
// }

// // Update onSelected for provinsi dropdown to load related kabupaten
// onSelectedProvinsi(String? selectedProvinsi) {
//   if (selectedProvinsi != null) {
//     final List<dynamic> provinsiData = json.decode(selectedProvinsi);
//     final selectedProvinsiData = provinsiData.firstWhere(
//         (provinsi) => provinsi['name'] == selectedProvinsi, orElse: () => {});

//     if (selectedProvinsiData.isNotEmpty) {
//       final idProvinsi = selectedProvinsiData['id'];
//       selcetedProvinsi.value = selectedProvinsi;
//       fetchKabupatenData(idProvinsi);
//     }
//   }
// }



  
// void fetchKabupatenData(String selectedProvinsi) async {
//   final response = await http.get(Uri.parse(
//       'https://www.emsifa.com/api-wilayah-indonesia/api/regencies/${provinsi.[index]}.json'));

//   if (response.statusCode == 200) {
//     final List<dynamic> data = json.decode(response.body);
//     kabupaten.clear();
//     data.forEach((regency) {
//       kabupaten.add(regency['name']);
//     });
//   } else {
//     // Handle the error if the request fails
//     print('Failed to fetch kabupaten data');
//   }
// }

// // Update onSelected for provinsi dropdown to load related kabupaten
// onSelectedProvinsi(String? selectedProvinsi) {
//   if (selectedProvinsi != null) {
//     selcetedProvinsi.value = selectedProvinsi;
//     fetchKabupatenData(selectedProvinsi);
//   }
// }

  
  // void fetchKabupatenData() async { 
  //   final response = await http.get(Uri.parse( 
  //       'https://www.emsifa.com/api-wilayah-indonesia/api/regencies/35.json'));

  //   if (response.statusCode == 200) {
  //     final List<dynamic> data = json.decode(response.body);
  //     kabupaten.clear();
  //     data.forEach((kabupatenes) {
  //       kabupaten.add(kabupatenes['name']);
  //     });
  //   } else {
  //     // Handle the error if the request fails
  //     print('Failed to fetch Kabupaten data');
  //   }
  // }
