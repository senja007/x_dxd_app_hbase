import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:crud_flutter_api/app/modules/home/controllers/home_controller.dart';
import 'package:crud_flutter_api/app/modules/CRUD/hewan/add_hewan/controllers/add_hewan_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCardWidget("assets/images/cow.png", "${controller.posts1?.totalElements ?? 0}", "Ternak"),
                    SizedBox(width: 12),
                    _buildCardWidget("assets/images/man.png", "${controller.posts2?.totalElements}", "Peternak"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCardWidget(
                        "assets/images/people.png", "${controller.posts?.totalElements ?? 0}", "Petugas"),
                    SizedBox(width: 12),
                    _buildCardWidget(
                        "assets/images/house.png", "38", "Kandang"),
                  ],
                ),

                // Other widgets...
              ],
            ),
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






// import 'package:crud_flutter_api/app/modules/home/controllers/home_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class HomeView extends GetView<HomeController> {
//   HomeView({Key? key}) : super(key: key);

//   final List<String> imageUrls = [
//     'assets/images/eksotik.jpg',
//     'assets/images/dkpp.jpg',
//     'assets/images/pet.jpg',
//     'assets/images/pet2.jpg',
//     'assets/images/pet3.jpg',
//   ];

//   int _currentIndex = 0;
//   CarouselController _carouselController = CarouselController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'TERNAK',
//           style: TextStyle(color: Colors.white),
//         ),
//         automaticallyImplyLeading: false,
//         backgroundColor: Color(0xff132137), // Warna latar belakang AppBar
//         elevation: 0.0, // Menghilangkan shadow // Warna latar belakang AppBar
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//               color: Color(0xffF7EBE1),
//               child: Column(
//                 children: <Widget>[
//                   Padding(
//                       padding: EdgeInsets.all(10),
//                       child: Text(
//                         "Dinas Ketahanan Pangan Dan Pertanian",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       )),
//                   Padding(
//                       padding: EdgeInsets.all(0),
//                       child: Text(
//                         "Selamat Datang Di Sistem Manajemen Aplikasi Ternak \n",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 15,
//                           fontWeight: FontWeight.normal,
//                         ),
//                       )),
//                   SizedBox(
//                       width: double.infinity,
//                       height: 250,
//                       child: CarouselSlider.builder(
//                         itemCount: imageUrls.length,
//                         itemBuilder: (context, index, _) {
//                           return Image.asset(
//                             imageUrls[index],
//                             fit: BoxFit.cover,
//                           );
//                         },
//                         options: CarouselOptions(
//                           autoPlay: true,
//                           autoPlayInterval: Duration(seconds: 5),
//                           autoPlayCurve: Curves.fastOutSlowIn,
//                           enlargeCenterPage: true,
//                         ),
//                       )),
//                   Padding(
//                       padding: EdgeInsets.all(5),
//                       child: Container(
//                         child: Center(
//                           child: Wrap(
//                             spacing: 80.0,
//                             runSpacing: 20.0,
//                             children: [
//                               SizedBox(
//                                 width: 250,
//                                 height: 30,
//                                 child: Card(
//                                   color: Color(0xff132137),
//                                   elevation: 2.0,
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(5.0)),
//                                   child: Text(
//                                     "Informasi Data Peternakan",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         // alignment: Alignment.center,
//                         // width: 80,
//                         // height: 21,
//                         // decoration: BoxDecoration(
//                         //   borderRadius: BorderRadius.circular(10),
//                         //   gradient: LinearGradient(
//                         //     begin: Alignment.centerLeft,
//                         //     end: Alignment.centerRight,
//                         //     colors: [
//                         //       Color(0xff132137),
//                         //     ],
//                         //   ),
//                         // ),
//                         // child: Text(
//                         //   "Informasi Data Peternakan",
//                         //   textAlign: TextAlign.center,
//                         //   style: TextStyle(
//                         //     color: Colors.white,
//                         //     fontSize: 18,
//                         //     fontWeight: FontWeight.bold,
//                         //   ),
//                         // ),
//                       )),
//                   Expanded(
                    
//                     child: GridView.count(
//                       padding: EdgeInsets.all(30),
//                       crossAxisCount: 2,
//                       children: [
//                         Padding(
//                             padding: EdgeInsets.all(12.0),
//                             child: Center(
//                               child: Wrap(
//                                 spacing: 20.0,
//                                 runSpacing: 20.0,
//                                 children: [
//                                   SizedBox(
//                                     width: 160.0,
//                                     height: 160.0,
//                                     child: Card(
//                                       color: Color(0xff132137),
//                                       elevation: 2.0,
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(10.0)),
//                                       child: Center(
//                                           child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: new InkWell(
//                                             onTap: () => Navigator.pushNamed(
//                                                 context, '/homePage'),
//                                             child: Column(
//                                               children: [
//                                                 Image.asset(
//                                                     "assets/images/cow.png",
//                                                     width: 70.0),
//                                                 SizedBox(height: 10.0),
//                                                 Text(
//                                                   "118",
//                                                   style: TextStyle(
//                                                       color: Color.fromARGB(
//                                                           255, 255, 255, 255),
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 20.0),
//                                                 ),
//                                                 SizedBox(height: 10.0),
//                                                 Text(
//                                                   "Ternak",
//                                                   style: TextStyle(
//                                                       color: Color.fromARGB(
//                                                           255, 255, 255, 255),
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 20.0),
//                                                 )
//                                               ],
//                                             )),
//                                       )),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             )),
//                         Padding(
//                             padding: EdgeInsets.all(12.0),
//                             child: Center(
//                               child: Wrap(
//                                 spacing: 20.0,
//                                 runSpacing: 20.0,
//                                 children: [
//                                   SizedBox(
//                                     width: 160.0,
//                                     height: 160.0,
//                                     child: Card(
//                                       color: Color(0xff132137),
//                                       elevation: 2.0,
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(10.0)),
//                                       child: Center(
//                                           child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: new InkWell(
//                                           onTap: () =>
//                                               Navigator.pushNamed(context, '/'),
//                                           child: Column(
//                                             children: [
//                                               Image.asset(
//                                                   "assets/images/man.png",
//                                                   width: 70.0),
//                                               SizedBox(height: 10.0),
//                                               Text(
//                                                 "56",
//                                                 style: TextStyle(
//                                                     color: Color.fromARGB(
//                                                         255, 255, 255, 255),
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 20.0),
//                                               ),
//                                               SizedBox(height: 10.0),
//                                               Text(
//                                                 "Peternak",
//                                                 style: TextStyle(
//                                                     color: Color.fromARGB(
//                                                         255, 255, 255, 255),
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 20.0),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       )),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             )),
//                         Padding(
//                             padding: EdgeInsets.all(12.0),
//                             child: Center(
//                               child: Wrap(
//                                 spacing: 20.0,
//                                 runSpacing: 20.0,
//                                 children: [
//                                   SizedBox(
//                                     width: 160.0,
//                                     height: 160.0,
//                                     child: Card(
//                                       color: Color(0xff132137),
//                                       elevation: 2.0,
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(10.0)),
//                                       child: Center(
//                                           child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: new InkWell(
//                                             onTap: () => Navigator.pushNamed(
//                                                 context, '/'),
//                                             child: Column(
//                                               children: [
//                                                 Image.asset(
//                                                     "assets/images/people.png",
//                                                     width: 70.0),
//                                                 SizedBox(height: 10.0),
//                                                 Text(
//                                                   "20",
//                                                   style: TextStyle(
//                                                       color: Color.fromARGB(
//                                                           255, 255, 255, 255),
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 20.0),
//                                                 ),
//                                                 SizedBox(height: 10.0),
//                                                 Text(
//                                                   "Petugas",
//                                                   style: TextStyle(
//                                                       color: Color.fromARGB(
//                                                           255, 255, 255, 255),
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 20.0),
//                                                 )
//                                               ],
//                                             )),
//                                       )),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             )),
//                         Padding(
//                             padding: EdgeInsets.all(12.0),
//                             child: Center(
//                               child: Wrap(
//                                 spacing: 20.0,
//                                 runSpacing: 20.0,
//                                 children: [
//                                   SizedBox(
//                                     width: 160.0,
//                                     height: 160.0,
//                                     child: Card(
//                                       color: Color(0xff132137),
//                                       elevation: 2.0,
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(10.0)),
//                                       child: Center(
//                                           child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: new InkWell(
//                                             onTap: () => Navigator.pushNamed(
//                                                 context, '/'),
//                                             child: Column(
//                                               children: [
//                                                 Image.asset(
//                                                     "assets/images/house.png",
//                                                     width: 70.0),
//                                                 SizedBox(height: 10.0),
//                                                 Text(
//                                                   "38",
//                                                   style: TextStyle(
//                                                       color: Color.fromARGB(
//                                                           255, 255, 255, 255),
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 20.0),
//                                                 ),
//                                                 SizedBox(height: 10.0),
//                                                 Text(
//                                                   "Kandang",
//                                                   style: TextStyle(
//                                                       color: Color.fromARGB(
//                                                           255, 255, 255, 255),
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 20.0),
//                                                 )
//                                               ],
//                                             )),
//                                       )),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             )),
//                       ],
//                     ),
//                   )
//                 ],
//               ))),
//       ),
//     );
//   }
// }
