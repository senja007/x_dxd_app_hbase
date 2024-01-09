import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/menu_controller.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MainMenuView extends GetView<MainMenuController> {
  const MainMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Menu'),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff132137), // Warna latar belakang AppBar
        elevation: 0.0,
      ),
      body: Container(
        color: const Color(0xffF7EBE1),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20), // Add padding to the bottom
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
        const SizedBox(height: 30),
        TyperAnimatedTextKit(
          // Widget untuk animasi tulisan diketik
          text: const ["Semua data Peternakan Lumajang"],
          speed: const Duration(milliseconds: 100),
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff132137),
          ),
        ),
        const SizedBox(height: 30),
        //SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(Routes.HEWAN, 'Hewan', Icons.pets),
            const SizedBox(width: 30),
            buildButton(Routes.PEMILIK, 'Peternak', Icons.person),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(Routes.PETUGAS, 'Petugas', Icons.people),
            const SizedBox(width: 30),
            buildButton(Routes.VAKSIN, 'Vaksin', Icons.medical_services),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(Routes.PENGOBATAN, 'Pengobatan', Icons.healing),
            const SizedBox(width: 30),
            buildButton(Routes.INSEMINASI, 'Inseminasi', Icons.adjust),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(Routes.KELAHIRAN, 'Kelahiran', Icons.child_care),
            const SizedBox(width: 30),
            buildButton(Routes.PKB, 'PKB', Icons.work),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(Routes.KANDANG, 'Kandang', Icons.holiday_village),
            const SizedBox(width: 30),
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
        const SizedBox(height: 30),
        TyperAnimatedTextKit(
          // Widget untuk animasi tulisan diketik
          text: const ["Semua data Peternakan Lumajang"],
          speed: const Duration(milliseconds: 100),
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff132137),
          ),
        ),
        const SizedBox(height: 30),
        //SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(Routes.HEWAN, 'Hewan', Icons.pets),
            const SizedBox(width: 30),
            buildButton(Routes.VAKSIN, 'Vaksin', Icons.medical_services),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(Routes.PENGOBATAN, 'Pengobatan', Icons.healing),
            const SizedBox(width: 30),
            buildButton(Routes.INSEMINASI, 'Inseminasi', Icons.adjust),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(Routes.KELAHIRAN, 'Kelahiran', Icons.child_care),
            const SizedBox(width: 30),
            buildButton(Routes.PKB, 'PKB', Icons.work),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(Routes.KANDANG, 'Kandang', Icons.holiday_village),
            const SizedBox(width: 30),
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
        const SizedBox(height: 30),
        TyperAnimatedTextKit(
          // Widget untuk animasi tulisan diketik
          text: const ["Semua Data Ternak Saya"],
          speed: const Duration(milliseconds: 100),
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff132137),
          ),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 30),
            // Tambahkan menu yang hanya terlihat untuk ROLE_STUDENT
            buildButton(Routes.TERNAKSAYA, 'Ternak Saya', Icons.pets_sharp),
            const SizedBox(width: 30),
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
            backgroundColor: const Color(0xff132137), // Warna latar belakang tombol
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
