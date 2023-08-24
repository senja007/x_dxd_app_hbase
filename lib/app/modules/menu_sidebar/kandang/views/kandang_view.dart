import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kandang_controller.dart';

class KandangView extends GetView<KandangController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kandang'),
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
          'Kandang Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
