import 'package:crud_flutter_api/app/modules/menu/menu_view/views/menu_view.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:crud_flutter_api/app/widgets/message/auto_load.dart';
import 'package:crud_flutter_api/app/widgets/message/empty.dart';
import 'package:crud_flutter_api/app/widgets/message/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/pkb_controller.dart';

class PKBView extends GetView<PKBController> {
  const PKBView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PKBController>(
      builder: (controller) => RefreshIndicator(
        onRefresh: () async {
          await controller.loadPKB();
        },
        child: Scaffold(
          backgroundColor: AppColor.primary,
          appBar: AppBar(
            title: Text(
              'Semua Data PKB',
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
          ),
          //body: Container(),
          body: GetBuilder<PKBController>(
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
                                Routes.DETAILPKB,
                                arguments: {
                                  "id_kejadian": "${postData.idKejadian}",
                                  "id_hewan": "${postData.idHewan}",
                                  "id_peternak": "${postData.idPeternak}",
                                  "nik": "${postData.nikPeternak}",
                                  "nama": "${postData.namaPeternak}",
                                  "jumlah": "${postData.jumlah}",
                                  "kategori": "${postData.kategori}",
                                  "lokasi": "${postData.lokasi}",
                                  "spesies": "${postData.spesies}",
                                  "umur": "${postData.umurKebuntingan}",
                                  "pemeriksa":
                                      "${postData.pemeriksaKebuntingan}",
                                  "tanggal": "${postData.tanggalPkb}"
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
                                    blurRadius:
                                        10, // changes position of shadow
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
                                            : "ID Kejadian: ${postData.idKejadian}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        (postData.status == null)
                                            ? "-"
                                            : "Nama Peternak: ${postData.namaPeternak}",
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
                                            : "Tanggal PKB: "
                                                "${postData.tanggalPkb}",
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
                      )
                : NoData(),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: FloatingActionButton(
              onPressed: () {
                Get.toNamed(Routes.ADDPKB);
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

// class PKBView extends GetView<PKBController> {
//   const PKBView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<PKBController>(
//       builder: (controller) => RefreshIndicator(
//         onRefresh: () => controller.refreshPKB(),
//         child: AutoLoad(
//           onInit: () async {
//             await controller.loadPKB();
//           },
//           child: Scaffold(
//             appBar: AppBar(
//               title: Text(
//                 'Semua Data',
//                 style: TextStyle(
//                   color: AppColor.secondaryExtraSoft,
//                 ),
//               ),
//               backgroundColor: Color(0xff132137),
//               elevation: 0,
//               centerTitle: true,
//               bottom: PreferredSize(
//                 preferredSize: Size.fromHeight(1),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 1,
//                   color: AppColor.secondaryExtraSoft,
//                 ),
//               ),
//             ),
//             body: _buildPKBListView(controller),
//             floatingActionButton: Padding(
//               padding: const EdgeInsets.only(bottom: 16.0),
//               child: FloatingActionButton(
//                 onPressed: () {
//                   Get.toNamed(Routes.ADDPKB);
//                 },
//                 child: Icon(Icons.add),
//                 backgroundColor: Color(0xff132137),
//               ),
//             ),
//             floatingActionButtonLocation:
//                 FloatingActionButtonLocation.centerFloat,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildPKBListView(PKBController controller) {
//     if (controller.posts == null) {
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     } else if (controller.posts!.status == 200) {
//       if (controller.posts!.content!.isEmpty) {
//         return EmptyView();
//       } else {
//         return ListView.separated(
//           itemCount: controller.posts!.content!.length,
//           // shrinkWrap: true,
//           physics: BouncingScrollPhysics(),
//           separatorBuilder: (context, index) => SizedBox(height: 16),
//           itemBuilder: (context, index) {
//             var postData = controller.posts!.content![index];
//             return InkWell(
//               onTap: () => {
//                 Get.toNamed(
//                   Routes.DETAILPKB,
//                   arguments: {
//                     "detail_id_kejadian": "${postData.idKejadian}",
//                     "detail_id_hewan": "${postData.idHewan}",
//                     "detail_id_peternak": "${postData.idPeternak}",
//                     "detail_nik": "${postData.nikPeternak}",
//                     "detail_nama": "${postData.namaPeternak}",
//                     "detail_jumlah": "${postData.jumlah}",
//                     "detail_kategori": "${postData.kategori}",
//                     "detail_lokasi": "${postData.lokasi}",
//                     "detail_spesies": "${postData.spesies}",
//                     "detail_umur": "${postData.umurKebuntingan}",
//                     "detail_pemeriksa": "${postData.pemeriksaKebuntingan}",
//                     "detail_tanggal": "${postData.tanggalPkb}"
//                   },
//                 ),
//               },
//               borderRadius: BorderRadius.circular(8),
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(
//                     width: 1,
//                     color: AppColor.primaryExtraSoft,
//                   ),
//                 ),
//                 padding:
//                     EdgeInsets.only(left: 24, top: 20, right: 29, bottom: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           (postData.status == null)
//                               ? "-"
//                               : "Id Kasus : ${postData.idKejadian} ${postData.tanggalPkb}",
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         Text((postData.status == null)
//                             ? "-"
//                             : "${postData.jumlah}"),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       }
//     } else {
//       return NoData();
//     }
//   }
// }
