import 'package:crud_flutter_api/app/modules/sidebar/views/sidebar_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SidebarView(),
      appBar: AppBar(
        title: Text('MainView'),
        backgroundColor: Color(0xff132137),
        centerTitle: true,
      ),
    );
  }
}
