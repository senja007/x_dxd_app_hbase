import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:crud_flutter_api/app/widgets/message/auto_load.dart';
import 'package:crud_flutter_api/app/widgets/message/empty.dart';
import 'package:crud_flutter_api/app/widgets/message/no_data.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../menu_view/views/menu_view.dart';
import '../controllers/vaksin_controller.dart';

class VaksinView extends GetView<VaksinController> {
  const VaksinView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VaksinController>(
      builder: (controller) => RefreshIndicator(
        onRefresh: () async {
          await controller.loadVaksin();
        },
        child: Scaffold(
          backgroundColor: AppColor.primary,
          appBar: EasySearchBar(
              searchBackgroundColor: AppColor.secondary,
              elevation: 0,
              searchCursorColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.white),
              searchClearIconTheme: IconThemeData(color: Colors.white),
              searchBackIconTheme: IconThemeData(color: Colors.white),
              systemOverlayStyle: SystemUiOverlayStyle.light,
              searchHintText: 'Cari Data ID Vaksin',
              searchTextStyle: TextStyle(color: Colors.white),
              title: Text(
                'Data Vaksin',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: AppColor.secondary,
              onSearch: (value) => controller.searchVaksin(value)),
          body: Obx(
            () {
              if (controller.posts?.value.status == 200) {
                if (controller.posts.value.content!.isEmpty) {
                  return EmptyView();
                } else {
                  return ListView.separated(
                    itemCount: controller.filteredPosts!.value.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      var postData = controller.filteredPosts.value[index];
                      return InkWell(
                        onTap: () => {
                          Get.toNamed(
                            Routes.DETAILVAKSIN,
                            arguments: {
                              "idVaksin": "${postData.idVaksin}",
                              "tanggalIB": "${postData.tanggalIB}",
                              "lokasi": "${postData.lokasi}",
                              "namaPeternak":
                                  "${postData.idPeternak?.namaPeternak}",
                              "idPeternak":
                                  "${postData.idPeternak?.idPeternak}",
                              "idHewan": "${postData.idHewan}",
                              "eartag": "${postData.eartag}",
                              "ib1": "${postData.ib1}",
                              "ib2": "${postData.ib2}",
                              "ib3": "${postData.ib3}",
                              "ibLain": "${postData.ibLain}",
                              "idPejantan": "${postData.idPejantan}",
                              "idPembuatan": "${postData.idPembuatan}",
                              "bangsaPejantan": "${postData.bangsaPejantan}",
                              "produsen": "${postData.produsen}",
                              "inseminator": "${postData.inseminator}",
                            },
                          ),
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 5),
                                color: Color.fromARGB(255, 0, 47, 255)
                                    .withOpacity(.2),
                                spreadRadius: 2,
                                blurRadius: 10, // changes position of shadow
                              ),
                            ],
                            color: AppColor.primaryExtraSoft,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 1, color: AppColor.primaryExtraSoft),
                          ),
                          padding: EdgeInsets.only(
                              left: 20, top: 15, right: 29, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (postData.status == null)
                                        ? "-"
                                        : "No Eartag: ${postData.eartag}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    (postData.status == null)
                                        ? "-"
                                        : "ID Vaksin: ${postData.idVaksin}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    (postData.status == null)
                                        ? "-"
                                        : "Nama Peternak: "
                                            "${postData.idPeternak?.namaPeternak}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              } else {
                return NoData();
              }
            },
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: FloatingActionButton(
              onPressed: () {
                Get.toNamed(Routes.ADDVAKSIN);
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
