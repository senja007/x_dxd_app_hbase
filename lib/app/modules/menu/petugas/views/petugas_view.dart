import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:crud_flutter_api/app/widgets/message/auto_load.dart';
import 'package:crud_flutter_api/app/widgets/message/empty.dart';
import 'package:crud_flutter_api/app/widgets/message/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../../menu_view/views/menu_view.dart';
import '../controllers/petugas_controller.dart';

class PetugasView extends GetView<PetugasController> {
  const PetugasView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PetugasController>(
      builder: (controller) => RefreshIndicator(
        onRefresh: () async {
          await controller.loadPetugas();
        },
        child: Scaffold(
          backgroundColor: AppColor.primary,
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
                color: AppColor.primary,
              ),
            ),
          ),
          //body: Container(),
          body: GetBuilder<PetugasController>(
            builder: (controller) => controller.posts?.status == 200
                ? controller.posts!.content!.isEmpty
                    ? EmptyView()
                    : ListView.separated(
                        itemCount: controller.posts!.content!.length,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          var postData = controller.posts!.content![index];
                          return InkWell(
                            onTap: () => {
                              Get.toNamed(
                                Routes.DETAILPETUGAS,
                                arguments: {
                                  "nikPetugas": "${postData.nikPetugas}",
                                  "namaPetugas": "${postData.namaPetugas}",
                                  "noTelp": "${postData.noTelp}",
                                  "email": "${postData.email}",
                                },
                              ),
                            },
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: AppColor.primaryExtraSoft,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 1,
                                  color: AppColor.primaryExtraSoft
                                ),
                              ),
                              padding: EdgeInsets.only(
                                  left: 20, top: 10, right: 29, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        (postData.status == null)
                                            ? "-"
                                            : "Nama Petugas: ${postData.namaPetugas} ${postData.nikPetugas}",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text((postData.status == null)
                                          ? "-"
                                          : "Email Petugas" "${postData.email}"),
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
                Get.toNamed(Routes.ADDPETUGAS);
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
