import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pemilik_controller.dart';

class PemilikView extends GetView<PemilikController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PemilikView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PemilikView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
