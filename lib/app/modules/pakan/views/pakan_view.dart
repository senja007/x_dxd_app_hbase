import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pakan_controller.dart';

class PakanView extends GetView<PakanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PakanView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PakanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
