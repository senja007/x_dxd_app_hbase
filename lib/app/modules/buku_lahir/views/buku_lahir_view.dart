import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/buku_lahir_controller.dart';

class BukuLahirView extends GetView<BukuLahirController> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buku Lahir'),
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
          'Buku lahir Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
