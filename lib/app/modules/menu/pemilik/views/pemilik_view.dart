import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/app_color.dart';
import '../../menu_view/views/menu_view.dart';
import '../controllers/pemilik_controller.dart';

class PemilikView extends GetView<PemilikController> {
  final PemilikController controller = Get.put(PemilikController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Pemilik Ternak'),
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
      body: Column(
        children: [
          InkWell(
            onTap: () => {
              Get.toNamed(
                Routes.DETAIL_POST,
                arguments: {
                  "id": "1",
                  "content": "content",
                },
              ),
            },
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 1,
                  color: AppColor.primaryExtraSoft,
                ),
              ),
              padding:
                  EdgeInsets.only(left: 24, top: 20, right: 29, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "data 1",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => {
              Get.toNamed(
                Routes.DETAIL_POST,
                arguments: {
                  "id": "2",
                  "content": "content",
                },
              ),
            },
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 1,
                  color: AppColor.primaryExtraSoft,
                ),
              ),
              padding:
                  EdgeInsets.only(left: 24, top: 20, right: 29, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "data2",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
