import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/menu_controller.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MainMenuView extends GetView<MainMenuController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff132137), // Warna latar belakang AppBar
        elevation: 0.0,
      ),
      body: Container(
        color: Color(0xffF7EBE1),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20), // Add padding to the bottom
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Menerapkan kondisi berdasarkan peran pengguna
                  if (controller.isAdmin.value)
                    buildAdminMenu()
                  else if (controller.isPetugas.value)
                    buildLecturerMenu()
                  else if (controller.isUser.value)
                    buildStudentMenu(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAdminMenu() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 30),
        TyperAnimatedTextKit(
          // Widget untuk animasi tulisan diketik
          text: ["Semua data Peternakan Lumajang"],
          speed: Duration(milliseconds: 100),
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff132137),
          ),
        ),
        SizedBox(height: 30),
        //SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(Routes.HEWAN, 'Hewan', Icons.pets),
            SizedBox(width: 30),
            buildButton(Routes.PEMILIK, 'Peternak', Icons.person),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(Routes.PETUGAS, 'Petugas', Icons.people),
            SizedBox(width: 30),
            buildButton(Routes.VAKSIN, 'Vaksin', Icons.medical_services),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(Routes.PENGOBATAN, 'Pengobatan', Icons.healing),
            SizedBox(width: 30),
            buildButton(Routes.INSEMINASI, 'Inseminasi', Icons.adjust),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(Routes.KELAHIRAN, 'Kelahiran', Icons.child_care),
            SizedBox(width: 30),
            buildButton(Routes.PKB, 'PKB', Icons.work),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(Routes.KANDANG, 'Kandang', Icons.holiday_village),
            SizedBox(width: 30),
            buildButton(Routes.MONITORING, 'LIVE MONITORING', Icons.monitor),
          ],
        ),
      ],
    );
  }

  Widget buildLecturerMenu() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 30),
        TyperAnimatedTextKit(
          // Widget untuk animasi tulisan diketik
          text: ["Semua data Peternakan Lumajang"],
          speed: Duration(milliseconds: 100),
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff132137),
          ),
        ),
        SizedBox(height: 30),
        //SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(Routes.HEWAN, 'Hewan', Icons.pets),
            SizedBox(width: 30),
            buildButton(Routes.VAKSIN, 'Vaksin', Icons.medical_services),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(Routes.PENGOBATAN, 'Pengobatan', Icons.healing),
            SizedBox(width: 30),
            buildButton(Routes.INSEMINASI, 'Inseminasi', Icons.adjust),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(Routes.KELAHIRAN, 'Kelahiran', Icons.child_care),
            SizedBox(width: 30),
            buildButton(Routes.PKB, 'PKB', Icons.work),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(Routes.KANDANG, 'Kandang', Icons.holiday_village),
            SizedBox(width: 30),
            buildButton(Routes.MONITORING, 'LIVE MONITORING', Icons.monitor),
          ],
        ),
        // ... (Tambahkan menu lain sesuai kebutuhan untuk ROLE_LECTURE)
      ],
    );
  }

  Widget buildStudentMenu() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 30),
        TyperAnimatedTextKit(
          // Widget untuk animasi tulisan diketik
          text: ["Semua Data Ternak Saya"],
          speed: Duration(milliseconds: 100),
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff132137),
          ),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 30),
            // Tambahkan menu yang hanya terlihat untuk ROLE_STUDENT
            buildButton(Routes.TERNAKSAYA, 'Ternak Saya', Icons.pets_sharp),
            SizedBox(width: 30),
            buildButton(Routes.MONITORING, 'Live Monitoring', Icons.monitor),
          ],
        ),
        // ... (Tambahkan menu lain sesuai kebutuhan untuk ROLE_STUDENT)
      ],
    );
  }

  Widget buildButton(String route, String text, IconData iconData) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 150,
        height: 150,
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(route);
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xff132137), // Warna latar belakang tombol
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(height: 10),
              Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
