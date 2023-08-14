import 'package:crud_flutter_api/app/modules/sidebar/views/sidebar_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/unit_usaha_controller.dart';

class UnitUsahaView extends GetView<UnitUsahaController> {
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Usaha'),
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
          'ini unit usaha',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
