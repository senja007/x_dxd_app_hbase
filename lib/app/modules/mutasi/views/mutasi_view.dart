import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mutasi_controller.dart';

class MutasiView extends GetView<MutasiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MutasiView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MutasiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
