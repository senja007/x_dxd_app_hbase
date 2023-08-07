import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kartu_ternak_controller.dart';

class KartuTernakView extends GetView<KartuTernakController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KartuTernakView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'KartuTernakView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
