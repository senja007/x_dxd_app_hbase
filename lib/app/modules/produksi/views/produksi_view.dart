import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/produksi_controller.dart';

class ProduksiView extends GetView<ProduksiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produksi'),
        // Set the hamburger menu icon to open the sidebar
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: Center(
        child: Text(
          'Produksi Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
