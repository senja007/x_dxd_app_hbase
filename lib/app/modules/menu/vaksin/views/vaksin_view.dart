import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:crud_flutter_api/app/widgets/message/auto_load.dart';
import 'package:crud_flutter_api/app/widgets/message/empty.dart';
import 'package:crud_flutter_api/app/widgets/message/no_data.dart';
import 'package:flutter/material.dart';

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
          appBar: AppBar(
            title: Text(
              'Semua Data Vaksin',
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
          body: GetBuilder<VaksinController>(
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
                                Routes.DETAILVAKSIN,
                                arguments: {
                                  "id_vaksin": "${postData.idVaksin}",
                                  "eartag": "${postData.eartag}",
                                  "id_hewan": "${postData.idHewan}",
                                  "id_pembuatan": "${postData.idPembuatan}",
                                  "id_pejantan": "${postData.idPejantan}",
                                  "bangsa_pejantan":
                                      "${postData.bangsaPejantan}",
                                  "ib1": "${postData.ib1}",
                                  "ib2": "${postData.ib2}",
                                  "ib3": "${postData.ib3}",
                                  "ib_lain": "${postData.ibLain}",
                                  "produsen": "${postData.produsen}",
                                  "id_peternak": "${postData.idPeternak}",
                                  "nama_peternak": "${postData.namaPeternak}",
                                  "lokasi": "${postData.lokasi}",
                                  "inseminator": "${postData.inseminator}",
                                  "tanggal": "${postData.tanggalIB}",
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
                                                "${postData.namaPeternak}",
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

// class VaksinView extends GetView<VaksinController> {
//   const VaksinView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<VaksinController>(
//       builder: (controller) => AutoLoad(
//         onInit: () async {
//           await controller.loadVaksin();
//         },
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text(
//               'Semua Data',
//               style: TextStyle(
//                 color: AppColor.secondaryExtraSoft,
//               ),
//             ),
//             backgroundColor: Color(0xff132137),
//             elevation: 0,
//             centerTitle: true,
//             bottom: PreferredSize(
//               preferredSize: Size.fromHeight(1),
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 1,
//                 color: AppColor.secondaryExtraSoft,
//               ),
//             ),
//           ),
//           //body: Container(),
//           body: GetBuilder<VaksinController>(
//             builder: (controller) => controller.posts?.status == 200
//                 ? controller.posts!.content!.isEmpty
//                     ? EmptyView()
//                     : ListView.separated(
//                         itemCount: controller.posts!.content!.length,
//                         shrinkWrap: true,
//                         physics: BouncingScrollPhysics(),
//                         separatorBuilder: (context, index) =>
//                             SizedBox(height: 16),
//                         itemBuilder: (context, index) {
//                           var postData = controller.posts!.content![index];
//                           return InkWell(
//                             onTap: () => {
//                               Get.toNamed(
//                                 Routes.DETAILVAKSIN,
//                                 arguments: {
//                                   "id_vaksin": "${postData.idVaksin}",
//                                   "eartag": "${postData.eartag}",
//                                   "id_hewan": "${postData.idHewan}",
//                                   "id_pembuatan": "${postData.idPembuatan}",
//                                   "id_pejantan": "${postData.idPejantan}",
//                                   "bangsa_pejantan":
//                                       "${postData.bangsaPejantan}",
//                                   "ib1": "${postData.ib1}",
//                                   "ib2": "${postData.ib2}",
//                                   "ib3": "${postData.ib3}",
//                                   "ib_lain": "${postData.ibLain}",
//                                   "produsen": "${postData.produsen}",
//                                   "id_peternak": "${postData.idPeternak}",
//                                   "nama_peternak": "${postData.namaPeternak}",
//                                   "lokasi": "${postData.lokasi}",
//                                   "inseminator": "${postData.inseminator}",
//                                   "tanggal": "${postData.tanggalIB}",
//                                 },
//                               ),
//                             },
//                             borderRadius: BorderRadius.circular(8),
//                             child: Container(
//                               width: MediaQuery.of(context).size.width,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 border: Border.all(
//                                   width: 1,
//                                   color: AppColor.primaryExtraSoft,
//                                 ),
//                               ),
//                               padding: EdgeInsets.only(
//                                   left: 24, top: 20, right: 29, bottom: 20),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         (postData.status == null)
//                                             ? "-"
//                                             : "Tanggal IB : ${postData.idVaksin}",
//                                         style: TextStyle(fontSize: 18),
//                                       ),
//                                       Text((postData.status == null)
//                                           ? "-"
//                                           : "${postData.lokasi}"),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       )
//                 : NoData(),
//           ),
//           floatingActionButton: Padding(
//             padding: const EdgeInsets.only(bottom: 16.0),
//             child: FloatingActionButton(
//               onPressed: () {
//                 Get.toNamed(Routes.ADDVAKSIN);
//               },
//               child: Icon(Icons.add),
//               backgroundColor: Color(0xff132137),
//             ),
//           ),
//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.centerFloat,
//         ),
//       ),
//     );
//   }
// }
