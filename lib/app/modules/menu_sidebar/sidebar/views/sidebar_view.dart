// // import 'package:best_flutter_ui_templates/sidebar/Kartu_Ternak.dart';
// import 'package:best_flutter_ui_templates/sidebar/Mutasi.dart';
import 'package:crud_flutter_api/app/modules/menu_sidebar/kandang/views/kandang_view.dart';
import 'package:crud_flutter_api/app/modules/menu_sidebar/pakan/views/pakan_view.dart';
import 'package:crud_flutter_api/app/modules/menu_sidebar/pemilik/views/pemilik_view.dart';
import 'package:crud_flutter_api/app/modules/menu_sidebar/petugas/views/petugas_view.dart';
import 'package:crud_flutter_api/app/modules/menu_sidebar/produksi/views/produksi_view.dart';
import 'package:crud_flutter_api/app/modules/menu_sidebar/mutasi/views/mutasi_view.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SidebarNavigation extends StatefulWidget {
  @override
  _SidebarNavigationState createState() => _SidebarNavigationState();
}

class _SidebarNavigationState extends State<SidebarNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    // UnitUsahaPage(),
    KandangView(),
    PakanView(),
    // BukuLahirPage(),
    PemilikView(),
    // KartuTernakPage(),
    PetugasView(),
    MutasiView(),
    ProduksiView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff132137),
              ),
              child: Text(
                'Sidebar Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            // ListTile(
            //   leading: Icon(Icons.real_estate_agent),
            //   title: Text('Unit Usaha'),
            //   onTap: () {
            //     _onItemTapped(0);
            //     Navigator.pop(context); // Close the sidebar
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.warehouse_rounded),
              title: Text('Kandang'),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context); // Close the sidebar
              },
            ),
            ListTile(
              leading: Icon(Icons.grass),
              title: Text('Pakan'),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context); // Close the sidebar
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.menu_book_rounded),
            //   title: Text('Buku Lahir'),
            //   onTap: () {
            //     _onItemTapped(3);
            //     Navigator.pop(context); // Close the sidebar
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Pemilik'),
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context); // Close the sidebar
              },
            ),
            ListTile(
              leading: Icon(Icons.credit_card_rounded),
              title: Text('Petugas'),
              onTap: () {
                // _onItemTapped(3);
                Navigator.pop(context); // Close the sidebar
                Get.toNamed(Routes.PETUGAS);
              },
            ),
            ListTile(
              leading: Icon(Icons.warning_rounded),
              title: Text('Mutasi'),
              onTap: () {
                _onItemTapped(4);
                Navigator.pop(context); // Close the sidebar
              },
            ),
            ListTile(
              leading: Icon(Icons.auto_graph),
              title: Text('Produksi'),
              onTap: () {
                _onItemTapped(5);
                Navigator.pop(context); // Close the sidebar
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
    );
  }
}
