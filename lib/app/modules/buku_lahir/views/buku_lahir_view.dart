import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/buku_lahir_controller.dart';

class BukuLahirView extends GetView<BukuLahirController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BukuLahirView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BukuLahirView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
