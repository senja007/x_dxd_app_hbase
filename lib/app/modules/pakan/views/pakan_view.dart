import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pakan_controller.dart';

class PakanView extends GetView<PakanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pakan'),
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
          'Pakan Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
