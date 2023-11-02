import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:crud_flutter_api/app/widgets/message/empty.dart';
import 'package:crud_flutter_api/app/widgets/message/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                height: 5,
                color: AppColor.primary,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => SizedBox(
                    width: controller.isSearching.value
                        ? 200
                        : 50, // Sesuaikan lebar TextField sesuai kebutuhan
                    child: TextField(
                      style: TextStyle(
                        color: Colors.amberAccent,
                      ),
                      onChanged: (value) {
                        controller.isSearching.value = value.isNotEmpty;

                        controller.searchPetugas(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Cari NIK atau Nama',
                        hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 255, 209, 224),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        icon: controller.isSearching.value
                            ? IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  controller.isSearching.value = false;

                                  // Perform any other operations here like clearing the search results.
                                },
                              )
                            : null,
                        iconColor: Colors.amber,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
                          child: Wrap(
                            // Gunakan Wrap di sini
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (postData.status == null)
                                        ? "-"
                                        : "Nik Petugas: ${postData.nikPetugas}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    (postData.status == null)
                                        ? "-"
                                        : "Nama Petugas: ${postData.namaPetugas}",
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
                                        : "Email Petugas: "
                                            "${postData.email}",
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
