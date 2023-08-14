import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pemilik_controller.dart';

class PemilikView extends GetView<PemilikController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pemilik'),
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
          'Pemilik Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
