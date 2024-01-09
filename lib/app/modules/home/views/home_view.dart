import 'dart:io';

import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:crud_flutter_api/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final List<String> imageUrls = [
    'assets/images/eksotik.jpg',
    'assets/images/dkpp.jpg',
    'assets/images/pet.jpg',
    'assets/images/pet2.jpg',
    'assets/images/pet3.jpg',
    'assets/images/logo.png',
  ];

  final int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  String get jsonKRB => '';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColor.secondary, // Set your primary color here
        statusBarIconBrightness: Brightness
            .light, // Use Brightness.dark if your primary color is light
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xffF7EBE1),
      appBar: AppBar(
        title: const Text(
          'TERNAK',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.secondary,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Dinas Ketahanan Pangan Dan Pertanian",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Container(
                //   alignment: Alignment.bottomCenter,
                //   child: AdWidget(ad: controller.bannerAd),
                //   width: controller.bannerAd.size.width.toDouble(),
                //   height: controller.bannerAd.size.height.toDouble(),
                // ),
                const Padding(
                    padding: EdgeInsets.all(0),
                    child: Text(
                      "Selamat Datang Di Sistem Manajemen Aplikasi Ternak \n",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    )),
                // Other widgets...

                SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: CarouselSlider.builder(
                    itemCount: imageUrls.length,
                    itemBuilder: (context, index, _) {
                      return Image.asset(
                        imageUrls[index],
                        fit: BoxFit.cover,
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      child: Center(
                        child: Wrap(
                          spacing: 80.0,
                          runSpacing: 20.0,
                          children: [
                            SizedBox(
                              width: 250,
                              height: 30,
                              child: Card(
                                color: const Color(0xff132137),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: const Text(
                                  "Peta Lokasi",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                SizedBox(
                  width: double.maxFinite,
                  height: 250,
                  child: Obx(() {
                    List<Marker> markersTernak = [];
                    List<Marker> markersKandang = [];

                    if (controller.posts1.value.content != null &&
                        controller.posts3.value.content != null) {
                      markersTernak = controller.posts1.value.content!.map((n) {
                        return Marker(
                          width: 25.0,
                          height: 25.0,
                          point: LatLng(
                            double.tryParse(n.latitude ?? '') ?? 00.0,
                            double.tryParse(n.longitude ?? '') ?? 00.0,
                          ),
                          child: Container(
                            child: Image.asset(
                              'assets/images/cow.png', // Ganti dengan path ke gambar Anda
                            ),
                          ),
                        );
                      }).toList();

                      markersKandang =
                          controller.posts3.value.content!.map((n) {
                        return Marker(
                          width: 25.0,
                          height: 25.0,
                          point: LatLng(
                            double.tryParse(n.latitude ?? '') ?? 00.0,
                            double.tryParse(n.longitude ?? '') ?? 00.0,
                          ),
                          child: Container(
                            child: Image.asset(
                              'assets/images/house.png', // Ganti dengan path ke gambar Anda
                            ),
                          ),
                        );
                      }).toList();
                    }
                    List<Marker> allMarkers = [
                      ...markersTernak,
                      ...markersKandang
                    ];

                    return FlutterMap(
                      options: const MapOptions(
                        initialCenter: LatLng(-8.1351667, 113.2218143),
                        initialZoom: 9,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          subdomains: const ['a', 'b', 'c'],
                        ),
                        if (controller.krbBoundary != null)
                          PolygonLayer(
                            polygons: [
                              Polygon(
                                points: controller.krbBoundary!,
                                color: const Color.fromARGB(255, 255, 0, 0),
                                borderColor:
                                    const Color.fromARGB(255, 255, 21, 21),
                                borderStrokeWidth: 2,
                              ),
                            ],
                          ),

                        FutureBuilder<List<List<LatLng>>>(
                          future: controller.someFunction(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                // Tampilkan PolygonLayer setelah mendapatkan data
                                return PolygonLayer(
                                  polygons: snapshot.data!.isEmpty
                                      ? [] // Tambahkan penanganan jika data kosong
                                      : snapshot.data!.map((polygonPoints) {
                                          return Polygon(
                                            points: polygonPoints,
                                            color: Color.fromARGB(34, 255, 0, 0),
                                            borderColor: Colors.red,
                                            borderStrokeWidth: 2,
                                            isFilled: true
                                          );
                                        }).toList(),
                                );
                              }
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              // Tampilkan loading indicator selama data dimuat
                              return const CircularProgressIndicator();
                            } else {
                              // Tampilkan pesan default jika ada kesalahan lainnya
                              return const Text('Data tidak dapat dimuat');
                            }
                          },
                        ),

                        // FutureBuilder<List<LatLng>>(
                        //   future: controller.someFunction(),
                        //   builder: (context, snapshot) {
                        //     if (snapshot.connectionState ==
                        //         ConnectionState.done) {
                        //       if (snapshot.hasError) {
                        //         return Text('Error: ${snapshot.error}');
                        //       } else {
                        //         // Tampilkan PolygonLayer setelah mendapatkan data
                        //         return PolygonLayer(
                        //           polygons: [
                        //             Polygon(
                        //               points: snapshot.data!,
                        //               color: Colors.blue,
                        //               borderColor: Colors.red,
                        //               borderStrokeWidth: 2,
                        //             ),
                        //           ],
                        //         );
                        //       }
                        //     } else if (snapshot.connectionState ==
                        //         ConnectionState.waiting) {
                        //       // Tampilkan loading indicator selama data dimuat
                        //       return const CircularProgressIndicator();
                        //     } else {
                        //       // Tampilkan pesan default jika ada kesalahan lainnya
                        //       return const Text('Data tidak dapat dimuat');
                        //     }
                        //   },
                        // ),
                        PopupMarkerLayer(
                          options: PopupMarkerLayerOptions(
                            markers: allMarkers,
                            popupController: controller.popupLayerController,
                            selectedMarkerBuilder:
                                (BuildContext context, Marker marker) {
                              return Container(
                                child: const Text('ini adalah'),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                const SizedBox(height: 3),
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildMiniCardWidget(
                            //"assets/images/cow.png",
                            "${controller.countKandangInKRB.value}",
                            "KRB 1"),
                        const SizedBox(width: 3),
                        _buildMiniCardWidget(
                            // "assets/images/man.png",
                            "${0}",
                            "KRB 2"),
                        const SizedBox(width: 3),
                        _buildMiniCardWidget(
                            // "assets/images/man.png",
                            "${0}",
                            "KRB 3"),
                      ],
                    )),
                ElevatedButton(
                  onPressed: () async {
                    // Ganti cara pemanggilan fungsi agar lebih sesuai dengan logika
                    Directory? selectedDirectory =
                        await controller.getDirectory();

                    if (selectedDirectory != null) {
                      // Perbarui nilai Rx<Directory?>
                      controller.savePath.value = selectedDirectory;

                      // Perbarui cara mengakses nilai Rx<Directory?>
                      controller.downloadDataInKRB(controller.savePath.value);
                    }
                  },
                  child: const Text("Download Data KRB"),
                ),

                const SizedBox(height: 7),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      child: Center(
                        child: Wrap(
                          spacing: 80.0,
                          runSpacing: 20.0,
                          children: [
                            SizedBox(
                              width: 250,
                              height: 30,
                              child: Card(
                                color: const Color(0xff132137),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: const Text(
                                  "Informasi Data Peternakan",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),

                // Other widgets...

                // Organize card widgets using a Row and Spacer for spacing.
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildCardWidget(
                            "assets/images/cow.png",
                            "${controller.posts1.value.totalElements ?? 0}",
                            "Ternak"),
                        const SizedBox(width: 12),
                        _buildCardWidget(
                            "assets/images/man.png",
                            "${controller.posts2.value.totalElements ?? 0}",
                            "Peternak"),
                      ],
                    )),
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildCardWidget(
                            "assets/images/people.png",
                            "${controller.posts.value.totalElements ?? 0}",
                            "Petugas"),
                        const SizedBox(width: 12),
                        _buildCardWidget(
                            "assets/images/house.png",
                            "${controller.posts3.value.totalElements ?? 0}",
                            "Kandang"),
                      ],
                    )),

                // Other widgets...
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMiniCardWidget(String count, String label) {
    return SizedBox(
      width: 120.0,
      height: 60.0,
      child: Card(
        color: const Color(0xff132137),
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          // onTap: () => Navigator.pushNamed(
          //     AddHewanController() as BuildContext, '/homePage'),
          child: Column(
            children: [
              // Padding(
              //   padding: EdgeInsets.all(13.0), // Add top padding here
              //   child: Image.asset(
              //     imagePath,
              //     width: 70.0,
              //   ),
              // ),
              const SizedBox(height: 2.0),
              Text(
                count,
                style: const TextStyle(
                  color: Color(0xffF7EBE1),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 2.0),
              Text(
                label,
                style: const TextStyle(
                  color: Color.fromARGB(255, 137, 255, 143),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardWidget(String imagePath, String count, String label) {
    return SizedBox(
      width: 170.0,
      height: 170.0,
      child: Card(
        color: const Color(0xff132137),
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          // onTap: () => Navigator.pushNamed(
          //     AddHewanController() as BuildContext, '/homePage'),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(13.0), // Add top padding here
                child: Image.asset(
                  imagePath,
                  width: 70.0,
                ),
              ),
              const SizedBox(height: 2.0),
              Text(
                count,
                style: const TextStyle(
                  color: Color(0xffF7EBE1),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 2.0),
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xffF7EBE1),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
