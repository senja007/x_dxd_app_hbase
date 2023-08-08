import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

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
            ListTile(
              leading: Icon(Icons.real_estate_agent),
              title: Text("Unit Usaha"),
              onTap: () => navigate(0),
              tileColor:
                  Get.currentRoute == Routes.UNIT_USAHA ? Colors.blue : null,
              iconColor: Get.currentRoute == Routes.UNIT_USAHA
                  ? Colors.white
                  : Colors.black,
            ),
            ListTile(
              leading: Icon(Icons.warehouse_rounded),
              title: Text("Kandang"),
              onTap: () => navigate(1),
              tileColor:
                  Get.currentRoute == Routes.KANDANG ? Colors.blue : null,
              iconColor: Get.currentRoute == Routes.KANDANG
                  ? Colors.white
                  : Colors.black,
            ),
            ListTile(
              leading: Icon(Icons.grass),
              title: Text("Pakan"),
              onTap: () => navigate(2),
              tileColor: Get.currentRoute == Routes.PAKAN ? Colors.blue : null,
              iconColor: Get.currentRoute == Routes.PAKAN
                  ? Colors.white
                  : Colors.black,
            ),
            ListTile(
              leading: Icon(Icons.menu_book_rounded),
              title: Text("Buku Lahir"),
              onTap: () => navigate(3),
              tileColor:
                  Get.currentRoute == Routes.BUKU_LAHIR ? Colors.blue : null,
              iconColor: Get.currentRoute == Routes.BUKU_LAHIR
                  ? Colors.white
                  : Colors.black,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Pemilik"),
              onTap: () => navigate(4),
              tileColor:
                  Get.currentRoute == Routes.PEMILIK ? Colors.blue : null,
              iconColor: Get.currentRoute == Routes.PEMILIK
                  ? Colors.white
                  : Colors.black,
            ),
            ListTile(
              leading: Icon(Icons.credit_card_rounded),
              title: Text("Kartu Ternak"),
              onTap: () => navigate(5),
              tileColor:
                  Get.currentRoute == Routes.KARTU_TERNAK ? Colors.blue : null,
              iconColor: Get.currentRoute == Routes.KARTU_TERNAK
                  ? Colors.white
                  : Colors.black,
            ),
            ListTile(
              leading: Icon(Icons.warning_rounded),
              title: Text("Mutasi"),
              onTap: () => navigate(6),
              tileColor: Get.currentRoute == Routes.MUTASI ? Colors.blue : null,
              iconColor: Get.currentRoute == Routes.MUTASI
                  ? Colors.white
                  : Colors.black,
            ),
            ListTile(
              leading: Icon(Icons.auto_graph),
              title: Text("Produksi"),
              onTap: () => navigate(7),
              tileColor:
                  Get.currentRoute == Routes.PRODUKSI ? Colors.blue : null,
              iconColor: Get.currentRoute == Routes.PRODUKSI
                  ? Colors.white
                  : Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerItem({
    required String text,
    required IconData icon,
    required Color textIconColor,
    required Color? tileColor,
    required VoidCallback onTap,
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
      Get.toNamed(Routes.UNIT_USAHA);
    } else if (index == 1) {
      Get.toNamed(Routes.KANDANG);
    } else if (index == 2) {
      Get.toNamed(Routes.PAKAN);
    } else if (index == 3) {
      Get.toNamed(Routes.BUKU_LAHIR);
    } else if (index == 4) {
      Get.toNamed(Routes.PEMILIK);
    } else if (index == 5) {
      Get.toNamed(Routes.KARTU_TERNAK);
    } else if (index == 6) {
      Get.toNamed(Routes.MUTASI);
    }
    if (index == 7) {
      Get.toNamed(Routes.PRODUKSI);
    }
  }
}
