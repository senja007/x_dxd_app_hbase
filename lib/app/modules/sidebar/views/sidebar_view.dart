import 'package:crud_flutter_api/app/modules/kandang/views/kandang_view.dart';
import 'package:crud_flutter_api/app/modules/pakan/views/pakan_view.dart';
import 'package:crud_flutter_api/app/modules/buku_lahir/views/buku_lahir_view.dart';
import 'package:crud_flutter_api/app/modules/pemilik/views/pemilik_view.dart';
import 'package:crud_flutter_api/app/modules/mutasi/views/mutasi_view.dart';
import 'package:crud_flutter_api/app/modules/produksi/views/produksi_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../petugas/views/petugas_view.dart';

class SidebarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff132137),
              ),
              child: Text(
                'Sidebar Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            buildDrawerItem(
              icon: Icons.man,
              text: "Petugas",
              onTap: () => navigate(0),
              tileColor:
                  Get.currentRoute == Routes.PETUGAS ? Colors.blue : null,
              textIconColor: Get.currentRoute == Routes.PETUGAS
                  ? Colors.white
                  : Colors.black,
            ),
            buildDrawerItem(
              icon: Icons.home_filled,
              text: "Kandang",
              onTap: () => navigate(1),
              tileColor:
                  Get.currentRoute == Routes.KANDANG ? Colors.blue : null,
              textIconColor: Get.currentRoute == Routes.KANDANG
                  ? Colors.white
                  : Colors.black,
            ),
            buildDrawerItem(
              icon: Icons.grass,
              text: "Pakan",
              onTap: () => navigate(2),
              tileColor: Get.currentRoute == Routes.PAKAN ? Colors.blue : null,
              textIconColor: Get.currentRoute == Routes.PAKAN
                  ? Colors.white
                  : Colors.black,
            ),
            buildDrawerItem(
              icon: Icons.man_4,
              text: "Pemilik",
              onTap: () => navigate(3),
              tileColor:
                  Get.currentRoute == Routes.PEMILIK ? Colors.blue : null,
              textIconColor: Get.currentRoute == Routes.PEMILIK
                  ? Colors.white
                  : Colors.black,
            ),
            buildDrawerItem(
              icon: Icons.bookmark,
              text: "Mutasi",
              onTap: () => navigate(4),
              tileColor: Get.currentRoute == Routes.MUTASI ? Colors.blue : null,
              textIconColor: Get.currentRoute == Routes.MUTASI
                  ? Colors.white
                  : Colors.black,
            ),
            buildDrawerItem(
              icon: Icons.add_circle,
              text: "Produksi",
              onTap: () => navigate(5),
              tileColor:
                  Get.currentRoute == Routes.PRODUKSI ? Colors.blue : null,
              textIconColor: Get.currentRoute == Routes.PRODUKSI
                  ? Colors.white
                  : Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  buildDrawerItem({
    required IconData icon,
    required String text,
    required Function() onTap,
    MaterialColor? tileColor,
    required Color textIconColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: textIconColor),
      title: Text(
        text,
        style: TextStyle(color: textIconColor),
      ),
      tileColor: tileColor,
      onTap: onTap,
    );
  }

  navigate(int index) {
    if (index == 0) {
      Get.toNamed(Routes.PETUGAS);
    } else if (index == 1) {
      Get.toNamed(Routes.KANDANG);
    } else if (index == 2) {
      Get.toNamed(Routes.PAKAN);
    } else if (index == 3) {
      Get.toNamed(Routes.PEMILIK);
    } else if (index == 4) {
      Get.toNamed(Routes.MUTASI);
    }
    if (index == 5) {
      Get.toNamed(Routes.PRODUKSI);
    }
  }
}
