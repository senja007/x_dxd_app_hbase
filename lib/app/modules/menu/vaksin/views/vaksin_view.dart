import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../menu_view/views/menu_view.dart';
import '../controllers/vaksin_controller.dart';

class VaksinView extends GetView<VaksinController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Vaksin'),
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
