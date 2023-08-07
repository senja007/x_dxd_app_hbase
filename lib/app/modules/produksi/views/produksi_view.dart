import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/produksi_controller.dart';

class ProduksiView extends GetView<ProduksiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProduksiView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProduksiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
