import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/myaccount_controller.dart';

class MyaccountView extends GetView<MyaccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyaccountView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MyaccountView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
