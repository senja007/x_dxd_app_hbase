import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kandang_controller.dart';

class KandangView extends GetView<KandangController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KandangView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'KandangView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
