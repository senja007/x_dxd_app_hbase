import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/menu_controller.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';

class MainMenuView extends GetView<MainMenuController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff132137), // AppBar background color
        elevation: 0.0,
      ),
      body: Container(
        color: Color(0xffF7EBE1), // Background color for the body
        child: Center(
          child: GridView.count(
            crossAxisCount: 2, // Number of columns
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            padding: EdgeInsets.all(16.0),
            children: [
              _buildMenuItem(
                icon: Icons.pets,
                label: 'Hewan',
                route: Routes.HEWAN,
              ),
              _buildMenuItem(
                icon: Icons.person,
                label: 'Peternak',
                route: Routes.PEMILIK,
              ),
              _buildMenuItem(
                icon: Icons.person_outline,
                label: 'Petugas',
                route: Routes.PETUGAS,
              ),
              _buildMenuItem(
                icon: Icons.medical_services,
                label: 'Vaksin',
                route: Routes.VAKSIN,
              ),
              _buildMenuItem(
                icon: Icons.healing,
                label: 'Inseminasi',
                route: Routes.INSEMINASI,
              ),
              _buildMenuItem(
                icon: Icons.child_care,
                label: 'Kelahiran',
                route: Routes.KELAHIRAN,
              ),
              _buildMenuItem(
                icon: Icons.local_hospital,
                label: 'Pengobatan',
                route: Routes.PENGOBATAN,
              ),
              _buildMenuItem(
                icon: Icons.business,
                label: 'PKB',
                route: Routes.PKB,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      {required IconData icon, required String label, required String route}) {
    return ElevatedButton(
      onPressed: () {
        Get.toNamed(route);
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xff132137), // Background color for the button
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48.0), // Icon
          SizedBox(height: 8.0),
          Text(
            label,
            style: TextStyle(color: Colors.white), // Text color
          ), // Label
        ],
      ),
    );
  }
}
