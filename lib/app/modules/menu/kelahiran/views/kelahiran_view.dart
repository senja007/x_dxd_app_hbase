import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/app_color.dart';
import '../../menu_view/views/menu_view.dart';
import '../controllers/kelahiran_controller.dart';

class KelahiranView extends GetView<KelahiranController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Kelahiran'),
        backgroundColor: Color(0xff132137),
        elevation: 0,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: AppColor.secondaryExtraSoft,
          ),
        ),
      ),
    );
  }
}
