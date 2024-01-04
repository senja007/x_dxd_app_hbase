import 'dart:convert';
import 'dart:io';
import 'package:excel/excel.dart' as excel;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map_geojson/flutter_map_geojson.dart';
import 'dart:math' show cos, sin, sqrt, atan2, pi;
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';

import 'package:crud_flutter_api/app/data/hewan_model.dart';
import 'package:crud_flutter_api/app/data/kandang_model.dart';
import 'package:crud_flutter_api/app/data/peternak_model.dart';
import 'package:crud_flutter_api/app/services/hewan_api.dart';
import 'package:crud_flutter_api/app/services/peternak_api.dart';
import 'package:crud_flutter_api/app/services/kandang_api.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';


import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_alert_dialog.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';

import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {

  LatLng centerSemeru =
      LatLng(-8.1067727, 112.9209181); // Koordinat pusat Gunung Semeru
  double radiusKRB = 20; // Radius wilayah KRB dalam meter
  List<LatLng>? krbBoundary;
  RxInt countKandangInKRB = 0.obs;
Rx<Directory?> savePath = Rx<Directory?>(null);


  Rx<PetugasListModel> posts = PetugasListModel().obs;
  Rx<HewanListModel> posts1 = HewanListModel().obs;
  Rx<PeternakListModel> posts2 = PeternakListModel().obs;
  Rx<KandangListModel> posts3 = KandangListModel().obs;

  PopupController popupLayerController = PopupController();

  final box = GetStorage();
  bool homeScreen = false;

  @override
  HomeController() {
    krbBoundary = calculateKRBBoundary(centerSemeru, radiusKRB);
    loadPetugasData();
    loadHewanData();
    loadPeternakData();
    loadKandangData();
    super.onInit();
  }

  loadPetugasData() async {
    homeScreen = false;
    update();
    showLoading();
    posts.value = await PetugasApi().loadPetugasApi();
    stopLoading();
    update();
    if (posts.value.status == 200) {
      if (posts.value.content!.isEmpty) {
        homeScreen = true;
        update();
      }
    } else if (posts!.value.status == 204) {
      print("Empty");
    } else if (posts!.value.status == 404) {
      homeScreen = true;
      update();
    } else if (posts!.value.status == 401) {
    } else {
      print("someting wrong 400");
    }
  }

  loadHewanData() async {
    homeScreen = false;
    update();
    showLoading();
    posts1.value = await HewanApi().loadHewanApi();
    update();
    stopLoading();
    if (posts1.value.status == 200) {
      if (posts1.value.content!.isEmpty) {
        homeScreen = true;
        update();
      }
    } else if (posts1.value.status == 204) {
      print("Empty");
    } else if (posts1.value.status == 404) {
      homeScreen = true;
      update();
    } else if (posts1.value.status == 401) {
    } else {
      print("someting wrong 400");
    }
  }

  loadPeternakData() async {
    homeScreen = false;
    update();
    showLoading();
    posts2.value = await PeternakApi().loadPeternakApi();
    update();
    stopLoading();
    if (posts2.value.status == 200) {
      if (posts2.value.content!.isEmpty) {
        homeScreen = true;
        update();
      }
    } else if (posts2!.value.status == 204) {
      print("Empty");
    } else if (posts2!.value.status == 404) {
      homeScreen = true;
      update();
    } else if (posts2!.value.status == 401) {
    } else {
      print("someting wrong 400");
    }
  }

  loadKandangData() async {
  homeScreen = false;
  update();
  showLoading();
  posts3.value = await KandangApi().loadKandangApi();
  update();
  stopLoading();
  if (posts3.value.status == 200) {
    if (posts3.value.content!.isEmpty) {
      homeScreen = true;
      update();
    } else {
      // Mengambil data latitude dan longitude dari setiap kandang
      posts3.value.content!.forEach((kandang) {
        double kandangLat = double.tryParse(kandang.latitude ?? '') ?? 0.0;
        double kandangLon = double.tryParse(kandang.longitude ?? '') ?? 0.0;
        print(kandang.latitude);
        print(kandang.longitude);

        // Check if the kandang is in the KRB
        if (isKandangInKRB(kandangLat, kandangLon, centerSemeru.latitude,
            centerSemeru.longitude, radiusKRB)) {
          // Kandang berada dalam wilayah KRB
          // Lakukan tindakan atau logika yang sesuai di sini
          print('Kandang ${kandang.idKandang} berada dalam wilayah KRB');
        } else {
          // Kandang di luar wilayah KRB
          print('Kandang ${kandang.idKandang} di luar wilayah KRB');
        }
      });

      // Panggil checkKandangInKRB setelah iterasi selesai
      checkKandangInKRB();
    }
  } else if (posts3!.value.status == 204) {
    print("Empty");
  } else if (posts3!.value.status == 404) {
    homeScreen = true;
    update();
  } else if (posts3!.value.status == 401) {
  } else {
    print("someting wrong 400");
  }
}





Future<List<dynamic>> loadGeoJsonFromAsset() async {
    final String jsonString = await rootBundle.loadString('assets/geojson/KRB_Semeru.json');
    final List<dynamic> geoJson = json.decode(jsonString);
    return geoJson;
  }

bool isKandangInKRB(double kandangLat, double kandangLon, double krbLat, double krbLon, double radiusKRB) {
  // Convert latitude and longitude from degrees to radians
  final kandangLatRad = _degreesToRadians(kandangLat);
  final kandangLonRad = _degreesToRadians(kandangLon);
  final krbLatRad = _degreesToRadians(krbLat);
  final krbLonRad = _degreesToRadians(krbLon);

  // Haversine formula
  final dLat = kandangLatRad - krbLatRad;
  final dLon = kandangLonRad - krbLonRad;
  final a = sin(dLat / 2) * sin(dLat / 2) +
      cos(krbLatRad) * cos(kandangLatRad) * sin(dLon / 2) * sin(dLon / 2);
  final c = 2 * atan2(sqrt(a), sqrt(1 - a));

  // Distance in meters (assuming Earth's radius is approximately 6371 km)
  final distance = 5000 * c;

  // Check if the distance is within the KRB radius
  return distance <= radiusKRB;
}


  void checkKandangInKRB() {
    List<LatLng> krbBoundary = calculateKRBBoundary(centerSemeru, radiusKRB);
  print('KRB Boundary: $krbBoundary');
  countKandangInKRB.value = 0;
  // Iterate through the list of kandang
  posts3.value.content!.forEach((kandang) {
    double kandangLat = double.tryParse(kandang.latitude ?? '') ?? 0.0;
    double kandangLon = double.tryParse(kandang.longitude ?? '') ?? 0.0;

    // Check if the kandang is in the KRB
    if (isKandangInKRB(kandangLat, kandangLon, centerSemeru.latitude,
        centerSemeru.longitude, radiusKRB)) {
      // Kandang berada dalam wilayah KRB
      // Lakukan tindakan atau logika yang sesuai di sini
      print('Kandang ${kandang.idKandang} berada dalam wilayah KRB');
      countKandangInKRB++;
    } else {
      // Kandang di luar wilayah KRB
      print('Kandang ${kandang.idKandang} di luar wilayah KRB');
    }
  });

  // Cetak atau gunakan nilai countKandangInKRB di sini
  print('Jumlah kandang dalam wilayah KRB: ${countKandangInKRB.value}');
}




  double _degreesToRadians(double degrees) {
    return degrees * pi / 180.0;
  }

List<LatLng> calculateKRBBoundary(LatLng center, double radius) {
  List<LatLng> boundary = [];
  int numberOfPoints = 100;

  for (double angle in List.generate(numberOfPoints,
      (index) => (360 / numberOfPoints) * index * (pi / 180.0))) {
    double latitude = center.latitude + (radius / 111.0) * cos(angle);
    double longitude =
        center.longitude + (radius / (111.0 * cos(_degreesToRadians(center.latitude)))) * sin(angle);

    // Periksa apakah nilai longitude berada dalam rentang -180 hingga 180
    if (longitude > 180) {
      longitude -= 360;
    } else if (longitude < -180) {
      longitude += 360;
    }

    boundary.add(LatLng(latitude, longitude));
  }

  print('KRB Boundary: $boundary');
  return boundary;
}

List<KandangModel> getKandangInKRB() {
  List<KandangModel> kandangInKRB = [];

  // Iterate through the list of kandang
  posts3.value.content!.forEach((kandang) {
    double kandangLat = double.tryParse(kandang.latitude ?? '') ?? 0.0;
    double kandangLon = double.tryParse(kandang.longitude ?? '') ?? 0.0;

    // Check if the kandang is in the KRB
    if (isKandangInKRB(kandangLat, kandangLon, centerSemeru.latitude,
        centerSemeru.longitude, radiusKRB)) {
      // Kandang berada dalam wilayah KRB
      // Tambahkan kandang ke dalam list kandangInKRB
      kandangInKRB.add(kandang);
    }
  });

  return kandangInKRB;
}
void pickSaveLocation() async {
  Directory? selectedDirectory = await getDirectory();

  if (selectedDirectory != null) {
    // Ganti tipe data dari String ke Directory
    Directory? savePath = Directory(selectedDirectory.path);

    // Tampilkan dialog konfirmasi
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text('Lokasi penyimpanan terpilih'),
          content: Text('File akan disimpan di: ${savePath.path}'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                downloadDataInKRB(savePath); // Panggil fungsi download setelah pemilihan lokasi
              },
              child: Text('Selesai'),
            ),
          ],
        );
      },
    );
  } else {
    print('Batal memilih lokasi penyimpanan');
  }
}
void downloadDataInKRB(Directory? savePath) async {
  // Dapatkan data yang hanya masuk ke dalam wilayah KRB
  List<KandangModel> kandangInKRB = getKandangInKRB();
WidgetsFlutterBinding.ensureInitialized();
  // Cek izin penyimpanan sebelum menyimpan file
  PermissionStatus storagePermission = await Permission.storage.request();
  if (storagePermission.isGranted) {
    await Permission.storage.request();
    // Izin diberikan, lanjutkan dengan operasi penyimpanan
    saveDataToExcel(kandangInKRB, savePath);
  } else {
    // Izin tidak diberikan, minta izin kepada pengguna
    await requestStoragePermission();
  }
}



Future<void> saveDataToExcel(List<KandangModel> kandangList, Directory? savePath) async {
  // Buat objek Excel
  var excelFile = excel.Excel.createExcel();

  // Buat worksheet dan atur kolom-kolom
  var sheet = excelFile[excelFile.tables.keys.first]!;
  sheet.appendRow(['idKandang', 'idPeternak', 'luas','kapasitas','nilaiBangunan', 'kecamatan', 'desa', 'alamat', 'fotoKandang']); // Gantilah dengan header yang sesuai

  // Tambahkan data kandang ke dalam worksheet
  for (var kandang in kandangList) {
    sheet.appendRow([kandang.idKandang, kandang.idPeternak!.idPeternak, kandang.luas, kandang.kapasitas, kandang.nilaiBangunan, kandang.kecamatan, kandang.desa, kandang.alamat, kandang.fotoKandang]); // Gantilah dengan data yang sesuai
  }

  // Pastikan direktori sudah ada atau buat jika belum
if (!savePath!.existsSync()) {
  savePath.createSync(recursive: true);
}

  // Simpan file Excel di direktori yang dipilih oleh pengguna
  var excelFilePath = '${savePath?.path}/data_kandang_krb.xlsx';
  await File(excelFilePath).writeAsBytes(await excelFile.encode()!);
}


Future<Directory?> getDirectory() async {
  Directory? appDocDir = await getApplicationDocumentsDirectory();
  String initialDirectory = appDocDir.path;

  try {
    // Menggunakan FilePicker untuk memilih direktori
    String? directoryPath = await FilePicker.platform.getDirectoryPath(
      initialDirectory: initialDirectory,
    );

    // Periksa apakah direktori telah dipilih
    if (directoryPath != null) {
      Directory selectedDirectory = Directory(directoryPath);
      return selectedDirectory;
    } else {
      print('Batal memilih lokasi penyimpanan');
      return null;
    }
  } catch (e) {
    print('Error saat memilih lokasi penyimpanan: $e');
    return null;
  }
}

Future<void> requestStoragePermission() async {
  PermissionStatus status = await Permission.storage.request();
  if (status.isGranted) {

  } else {
    
  }
}


}


// Future<void> saveDataToExcel(List<KandangModel> kandangList) async {
//   // Dapatkan direktori penyimpanan lokal
//   Directory? appDocDir = await getApplicationDocumentsDirectory();

//   // Tampilkan dialog pemilihan direktori penyimpanan
//   Directory? selectedDirectory = await getDirectory();

//   // Periksa apakah pengguna telah memilih direktori atau membatalkan pemilihan
//   if (selectedDirectory == null) {
//     print("Batal memilih direktori penyimpanan.");
//     return;
//   }

//   // Tentukan nama file Excel
//   String excelFileName = "data_kandang_krb.xlsx";

//   // Buat objek Excel
//   var excelFile = excel.Excel.createExcel();

//   // Tambahkan sheet ke file Excel
//   var sheet = excelFile['Sheet1'];

//   // Tambahkan header ke sheet
//   sheet.appendRow(["ID Kandang", "Latitude", "Longitude", /*Tambahkan kolom lain sesuai kebutuhan*/]);

//   // Tambahkan data kandang ke sheet
//   kandangList.forEach((kandang) {
//     sheet.appendRow([kandang.idKandang, kandang.latitude, kandang.longitude, /*Tambahkan data lain sesuai kebutuhan*/]);
//   });

//   // Simpan file Excel di direktori yang dipilih oleh pengguna
//   var excelFilePath = '${selectedDirectory.path}/$excelFileName';
//   await File(excelFilePath).writeAsBytes(await excelFile.encode()!);

//   // Tampilkan lokasi file yang telah disimpan
//   print("File Excel disimpan di: $excelFilePath");
// }

// void checkKandangInKRB() {
//   // Iterate through the list of kandang
//   posts3.value.content!.forEach((kandang) {
//     double kandangLat = double.tryParse(kandang.latitude ?? '') ?? 0.0;
//     double kandangLon = double.tryParse(kandang.longitude ?? '') ?? 0.0;

//     // Check if the kandang is in the KRB
//     if (isKandangInKRB(kandangLat, kandangLon, centerSemeru.latitude,
//         centerSemeru.longitude, radiusKRB)) {
//       // Kandang berada dalam wilayah KRB
//       // Lakukan tindakan atau logika yang sesuai di sini
//       print('Kandang ${kandang.idKandang} berada dalam wilayah KRB');

//       // Tambahkan logika atau tindakan lain yang sesuai di sini
//     } else {
//       // Kandang di luar wilayah KRB
//       print('Kandang ${kandang.idKandang} di luar wilayah KRB');

//       // Tambahkan logika atau tindakan lain yang sesuai di sini
//     }
//   });
// }



  // loadKandangData() async {
  //   homeScreen = false;
  //   update();
  //   showLoading();
  //   posts3.value = await KandangApi().loadKandangApi();
  //   update();
  //   stopLoading();
  //   if (posts3.value.status == 200) {
  //     if (posts3.value.content!.isEmpty) {
  //       homeScreen = true;
  //       update();
  //     } else {
  //       // Mengambil data latitude dan longitude dari setiap kandang
  //       posts3.value.content!.forEach((kandang) {
  //         double kandangLat = double.tryParse(kandang.latitude ?? '') ?? 0.0;
  //         double kandangLon = double.tryParse(kandang.longitude ?? '') ?? 0.0;
  //         print(kandang.latitude);
  //         print(kandang.longitude);

  //         // Check if the kandang is in the KRB
  //         if (isKandangInKRB(kandangLat, kandangLon, centerSemeru.latitude,
  //             centerSemeru.longitude, radiusKRB)) {
  //           // Kandang berada dalam wilayah KRB
  //           // Lakukan tindakan atau logika yang sesuai di sini
  //           print('Kandang ${kandang.idKandang} berada dalam wilayah KRB');
  //         } else {
  //           // Kandang di luar wilayah KRB
  //           print('Kandang ${kandang.idKandang} di luar wilayah KRB');
  //         }

  //         checkKandangInKRB();
  //       });
  //     }
  //   } else if (posts3!.value.status == 204) {
  //     print("Empty");
  //   } else if (posts3!.value.status == 404) {
  //     homeScreen = true;
  //     update();
  //   } else if (posts3!.value.status == 401) {
  //   } else {
  //     print("someting wrong 400");
  //   }
  // }

//   bool isKandangInKRB(double kandangLat, double kandangLon, double krbLat, double krbLon, double radiusKRB) {
//   // Convert latitude and longitude from degrees to radians
//   final kandangLatRad = radians(kandangLat);
//   final kandangLonRad = radians(kandangLon);
//   final krbLatRad = radians(krbLat);
//   final krbLonRad = radians(krbLon);

//   // Haversine formula
//   final dLat = kandangLatRad - krbLatRad;
//   final dLon = kandangLonRad - krbLonRad;
//   final a = sin(dLat / 2) * sin(dLat / 2) +
//       cos(krbLatRad) * cos(kandangLatRad) * sin(dLon / 2) * sin(dLon / 2);
//   final c = 2 * atan2(sqrt(a), sqrt(1 - a));

//   // Distance in meters (assuming Earth's radius is approximately 6371 km)
//   final distance = 6371000 * c;

//   // Check if the distance is within the KRB radius
//   return distance <= radiusKRB;
// }

  // loadKandangData() async {
  //   homeScreen = false;
  //   update();
  //   showLoading();
  //   posts3.value = await KandangApi().loadKandangApi();
  //   update();
  //   stopLoading();
  //   if (posts3.value.status == 200) {
  //     if (posts3.value.content!.isEmpty) {
  //       homeScreen = true;
  //       update();
  //     }
  //   } else if (posts3!.value.status == 204) {
  //     print("Empty");
  //   } else if (posts3!.value.status == 404) {
  //     homeScreen = true;
  //     update();
  //   } else if (posts3!.value.status == 401) {
  //   } else {
  //     print("someting wrong 400");
  //   }

    
  // }
  // Fungsi untuk menghitung koordinat batas wilayah KRB

// List<LatLng> calculateKRBBoundary(LatLng center, double radius) {
//   List<LatLng> boundary = [];
//   int numberOfPoints = 100;

//   for (int i = 0; i < numberOfPoints; i++) {
//     double angle = (360 / numberOfPoints) * i * (pi / 180.0);
//     double latitude = center.latitude + (radius / 111) * cos(angle);

//     // Modulo 360 agar nilai longitude tetap dalam rentang -180 hingga 180
//     double longitude = (center.longitude +
//         (radius / (111 * cos(center.latitude))) * sin(angle)) %
//         360;

//     // Periksa apakah nilai longitude berada dalam rentang -180 hingga 180
//     if (longitude > 180) {
//       longitude -= 360;
//     } else if (longitude < -180) {
//       longitude += 360;
//     }

//     boundary.add(LatLng(latitude, longitude));
//   }
//   print('KRB Boundary: $boundary');
//   return boundary;
// }