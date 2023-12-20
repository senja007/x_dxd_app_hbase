import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map_marker_popup/extension_api.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:crud_flutter_api/app/modules/home/controllers/home_controller.dart';
import 'package:crud_flutter_api/app/modules/CRUD/hewan/add_hewan/controllers/add_hewan_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:latlong2/latlong.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final List<String> imageUrls = [
    'assets/images/eksotik.jpg',
    'assets/images/dkpp.jpg',
    'assets/images/pet.jpg',
    'assets/images/pet2.jpg',
    'assets/images/pet3.jpg',
    'assets/images/logo.png',
  ];

  int _currentIndex = 0;
  CarouselController _carouselController = CarouselController();

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
      backgroundColor: Color(0xffF7EBE1),
      appBar: AppBar(
        title: Text(
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
                Padding(
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
                Container(
                  alignment: Alignment.bottomCenter,
                  child: AdWidget(ad: controller.bannerAd),
                  width: controller.bannerAd.size.width.toDouble(),
                  height: controller.bannerAd.size.height.toDouble(),
                ),
                Padding(
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
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(5),
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
                                color: Color(0xff132137),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Text(
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

                      if (controller.posts1 != null &&
                          controller.posts1!.value != null &&
                          controller.posts1!.value.content != null &&
                          controller.posts3 != null &&
                          controller.posts3!.value != null &&
                          controller.posts3!.value.content != null) {
                        markersTernak =
                            controller.posts1!.value.content!.map((n) {
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
                            controller.posts3!.value.content!.map((n) {
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
                        options: MapOptions(
                          initialCenter: LatLng(-8.1351667, 113.2218143),
                          initialZoom: 5,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                            subdomains: ['a', 'b', 'c'],
                          ),
                          if (controller.krbBoundary != null)
                            PolygonLayer(
                              polygons: [
                                Polygon(
                                  points: controller.krbBoundary!,
                                  color: Color.fromARGB(255, 42, 255, 106),
                                  borderColor: Colors.blue,
                                  borderStrokeWidth:
                                      2, // Sesuaikan dengan kebutuhan Anda
                                ),
                              ],
                            ),
                          PopupMarkerLayer(
                            options: PopupMarkerLayerOptions(
                              markers: allMarkers,
                              popupController: controller.popupLayerController,
                              selectedMarkerBuilder:
                                  (BuildContext context, Marker marker) {
                                return Container(
                                  child: Text('ini adalah'),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    })),

                SizedBox(height: 3),
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildMiniCardWidget(
                            //"assets/images/cow.png",
                            "${controller.posts1!.value.totalElements ?? 0}",
                            "KRB 1"),
                        SizedBox(width: 3),
                        _buildMiniCardWidget(
                            // "assets/images/man.png",
                            "${controller.posts2!.value.totalElements ?? 0}",
                            "KRB 2"),
                        SizedBox(width: 3),
                        _buildMiniCardWidget(
                            // "assets/images/man.png",
                            "${controller.posts2!.value.totalElements ?? 0}",
                            "KRB 3"),
                      ],
                    )),
                SizedBox(height: 7),
                Padding(
                    padding: EdgeInsets.all(5),
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
                                color: Color(0xff132137),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Text(
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
                            "${controller.posts1!.value.totalElements ?? 0}",
                            "Ternak"),
                        SizedBox(width: 12),
                        _buildCardWidget(
                            "assets/images/man.png",
                            "${controller.posts2!.value.totalElements ?? 0}",
                            "Peternak"),
                      ],
                    )),
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildCardWidget(
                            "assets/images/people.png",
                            "${controller.posts!.value.totalElements ?? 0}",
                            "Petugas"),
                        SizedBox(width: 12),
                        _buildCardWidget(
                            "assets/images/house.png",
                            "${controller.posts3!.value.totalElements ?? 0}",
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
        color: Color(0xff132137),
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
              SizedBox(height: 2.0),
              Text(
                count,
                style: TextStyle(
                  color: Color(0xffF7EBE1),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 2.0),
              Text(
                label,
                style: TextStyle(
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
        color: Color(0xff132137),
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
                padding: EdgeInsets.all(13.0), // Add top padding here
                child: Image.asset(
                  imagePath,
                  width: 70.0,
                ),
              ),
              SizedBox(height: 2.0),
              Text(
                count,
                style: TextStyle(
                  color: Color(0xffF7EBE1),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 2.0),
              Text(
                label,
                style: TextStyle(
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
