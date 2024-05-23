import 'package:crud_flutter_api/app/widgets/message/empty.dart';
import 'package:crud_flutter_api/app/widgets/message/no_data.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/app_color.dart';
import '../controllers/peternak_controller.dart';

class PeternakView extends GetView<PeternakController> {
  const PeternakView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PeternakController>(
      builder: (controller) => RefreshIndicator(
        onRefresh: () async {
          await controller.loadPeternak();
        },
        child: Scaffold(
          backgroundColor: AppColor.primary,
          appBar: EasySearchBar(
              searchBackgroundColor: AppColor.secondary,
              elevation: 0,
              searchCursorColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.white),
              searchClearIconTheme: const IconThemeData(color: Colors.white),
              searchBackIconTheme: const IconThemeData(color: Colors.white),
              systemOverlayStyle: SystemUiOverlayStyle.light,
              searchHintText: 'Cari Data ID Peternak',
              searchTextStyle: const TextStyle(color: Colors.white),
              title: const Text(
                'Data Peternak',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: AppColor.secondary,
              onSearch: (value) => controller.searchPeternak(value)),
          body: Obx(
            () {
              if (controller.posts.value.status == 200) {
                if (controller.posts.value.content!.isEmpty) {
                  return const EmptyView();
                } else {
                  return ListView.separated(
                    itemCount: controller.filteredPosts.value.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      var postData = controller.filteredPosts.value[index];
                      return InkWell(
                        onTap: () => {
                          Get.toNamed(
                            Routes.DETAILPETERNAK,
                            arguments: {
                              "idPeternak": "${postData.idPeternak}",
                              "idISIKHNAS": "${postData.idISIKHNAS}",
                              "nikPeternak": "${postData.nikPeternak}",
                              "namaPeternak": "${postData.namaPeternak}",
                              "lokasi": "${postData.lokasi}",
                              "petugasPendaftar":
                                  "${postData.petugasPendaftar?.nikPetugas}",
                              "namaPetugas":
                                  "${postData.petugasPendaftar?.namaPetugas}",
                              "tanggalPendaftaran":
                                  "${postData.tanggalPendaftaran}",
                            },
                          ),
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 5),
                                color: const Color.fromARGB(255, 0, 47, 255)
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
                          padding: const EdgeInsets.only(
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
                                        : "ID Peternak: ${postData.idPeternak}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    (postData.status == null)
                                        ? "-"
                                        : "Nik Peternak: ${postData.nikPeternak}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    (postData.status == null)
                                        ? "-"
                                        : "Nama Peternak: "
                                            "${postData.namaPeternak}",
                                    style: const TextStyle(
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
                return const NoData();
              }
            },
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: FloatingActionButton(
              onPressed: () {
                Get.toNamed(Routes.ADDPETERNAK);
              },
              backgroundColor: const Color(0xff132137),
              child: const Icon(Icons.add),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }
}
