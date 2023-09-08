import 'package:crud_flutter_api/app/widgets/message/auto_load.dart';
import 'package:crud_flutter_api/app/widgets/message/no_data.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/app_color.dart';
import '../../menu_view/views/menu_view.dart';
import '../controllers/pemilik_controller.dart';

class PeternakView extends GetView<PeternakController> {
  const PeternakView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PeternakController>(
      builder: (controller) => AutoLoad(
        onInit: () async {
          await controller.loadPeternak();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Semua Data',
              style: TextStyle(
                color: AppColor.secondaryExtraSoft,
              ),
            ),
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
          //body: Container(),
          body: GetBuilder<PeternakController>(
            builder: (controller) => controller.posts?.status == 200
                ? ListView.separated(
                    itemCount: controller.posts!.content!.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      var postData = controller.posts!.content![index];
                      return InkWell(
                        onTap: () => {
                          Get.toNamed(
                            Routes.DETAIL_POST,
                            arguments: {
                              "id": "${postData.id}",
                              "content": "${postData.idPeternak}",
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
                          padding: EdgeInsets.only(
                              left: 24, top: 20, right: 29, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (postData.status == null)
                                        ? "-"
                                        : "Nama Peternak: ${postData.idPeternak} ${postData.namaPeternak}",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text((postData.status == null)
                                      ? "-"
                                      : "${postData.tanggalPendaftaran}"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : NoData(),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: FloatingActionButton(
              onPressed: () {
                Get.toNamed(Routes.ADDPETERNAK);
              },
              child: Icon(Icons.add),
              backgroundColor: Color(0xff132137),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }
}
