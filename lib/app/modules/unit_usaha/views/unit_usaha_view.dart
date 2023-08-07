import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/unit_usaha_controller.dart';

class UnitUsahaView extends GetView<UnitUsahaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UnitUsahaView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UnitUsahaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
