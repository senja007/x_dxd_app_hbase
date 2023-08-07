import 'package:crud_flutter_api/app/modules/buku_lahir/views/buku_lahir_view.dart';
import 'package:crud_flutter_api/app/modules/kandang/views/kandang_view.dart';
import 'package:crud_flutter_api/app/modules/kartu_ternak/views/kartu_ternak_view.dart';
import 'package:crud_flutter_api/app/modules/mutasi/views/mutasi_view.dart';
import 'package:crud_flutter_api/app/modules/pakan/views/pakan_view.dart';
import 'package:crud_flutter_api/app/modules/pemilik/views/pemilik_view.dart';
import 'package:crud_flutter_api/app/modules/produksi/views/produksi_view.dart';
import 'package:crud_flutter_api/app/modules/unit_usaha/views/unit_usaha_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/sidebar_controller.dart';

class SidebarView extends StatefulWidget {
  @override
  _SidebarViewState createState() => _SidebarViewState();
}

class _SidebarViewState extends State<SidebarView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    UnitUsahaView(),
    KandangView(),
    PakanView(),
    BukuLahirView(),
    PemilikView(),
    KartuTernakView(),
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
    return GetBuilder<SidebarController>(builder: (controller) {
      return Scaffold(
        drawer: Drawer(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              UnitUsahaView(),
              KandangView(),
              PakanView(),
              BukuLahirView(),
              PemilikView(),
              KartuTernakView(),
              MutasiView(),
              ProduksiView(),
            ],
          ),
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
              ListTile(
                leading: Icon(Icons.real_estate_agent),
                title: Text('Unit Usaha'),
                onTap: () {
                  _onItemTapped(0);
                  Navigator.pop(context); // Close the sidebar
                },
              ),
              ListTile(
                leading: Icon(Icons.warehouse_rounded),
                title: Text('Kandang'),
                onTap: () {
                  _onItemTapped(1);
                  Navigator.pop(context); // Close the sidebar
                },
              ),
              ListTile(
                leading: Icon(Icons.grass),
                title: Text('Pakan'),
                onTap: () {
                  _onItemTapped(2);
                  Navigator.pop(context); // Close the sidebar
                },
              ),
              ListTile(
                leading: Icon(Icons.menu_book_rounded),
                title: Text('Buku Lahir'),
                onTap: () {
                  _onItemTapped(3);
                  Navigator.pop(context); // Close the sidebar
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Pemilik'),
                onTap: () {
                  _onItemTapped(4);
                  Navigator.pop(context); // Close the sidebar
                },
              ),
              ListTile(
                leading: Icon(Icons.credit_card_rounded),
                title: Text('Kartu Ternak'),
                onTap: () {
                  _onItemTapped(5);
                  Navigator.pop(context); // Close the sidebar
                },
              ),
              ListTile(
                leading: Icon(Icons.warning_rounded),
                title: Text('Mutasi'),
                onTap: () {
                  _onItemTapped(6);
                  Navigator.pop(context); // Close the sidebar
                },
              ),
              ListTile(
                leading: Icon(Icons.auto_graph),
                title: Text('Produksi'),
                onTap: () {
                  _onItemTapped(7);
                  Navigator.pop(context); // Close the sidebar
                },
              ),
            ],
          ),
        ),
        body: _pages[_currentIndex],
      );

      // navigate(int index) {
      //   if (index == 0) {
      //     Get.toNamed(Routes.PAKAN);
      //   } else if (index == 1) {
      //     Get.toNamed(Routes.PEMILIK);
      //   }
      //   if (index == 2) {
      //     Get.toNamed(Routes.PRODUKSI);
      //   }
    });
  }
}
