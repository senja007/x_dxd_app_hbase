import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mutasi_controller.dart';

class MutasiView extends GetView<MutasiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mutasi'),
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
          'Mutasi Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
