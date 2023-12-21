import 'dart:math' show cos, sin, sqrt, atan2, pi;

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

class HomeController extends GetxController {
 // late BannerAd bannerAd;
  LatLng centerSemeru =
      LatLng(-8.1067727, 112.9209181); // Koordinat pusat Gunung Semeru
  double radiusKRB = 20; // Radius wilayah KRB dalam meter
  List<LatLng>? krbBoundary;

  Rx<PetugasListModel> posts = PetugasListModel().obs;
  Rx<HewanListModel> posts1 = HewanListModel().obs;
  Rx<PeternakListModel> posts2 = PeternakListModel().obs;
  Rx<KandangListModel> posts3 = KandangListModel().obs;

  PopupController popupLayerController = PopupController();

  final box = GetStorage();
  bool homeScreen = false;

  @override
  HomeController() {
    
    //loadBannerAd();
    krbBoundary = calculateKRBBoundary(centerSemeru, radiusKRB);
    // Panggil loadPetugasData saat HomeController dibuat
    loadPetugasData();
    loadHewanData();
    loadPeternakData();
    loadKandangData();
    //checkKandangInKRB();
    super.onInit();
  }
 // void loadBannerAd() {
    // bannerAd = BannerAd(
    //   adUnitId: 'ca-app-pub-6237408663282103/4857843118',
    //   size: AdSize.banner,
    //   request: AdRequest(),
    //   listener: BannerAdListener(),
    // );

    // bannerAd.load();
  //}

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
  int countKandangInKRB = 0;
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
  print('Jumlah kandang dalam wilayah KRB: $countKandangInKRB');
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

}

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