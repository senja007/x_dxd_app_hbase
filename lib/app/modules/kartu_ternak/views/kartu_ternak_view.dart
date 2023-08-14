import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kartu_ternak_controller.dart';

class KartuTernakView extends GetView<KartuTernakController> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kartu Ternak'),
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
          'Kartu Ternak Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
