import 'package:crud_flutter_api/app/widgets/message/auto_load.dart';
import 'package:crud_flutter_api/app/widgets/message/empty.dart';
import 'package:crud_flutter_api/app/widgets/message/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/hewan_controller.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/utils/app_color.dart';

class HewanView extends GetView<HewanController> {
  final HewanController hewanController = Get.find();

  // const HewanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HewanController>(
      builder: (controller) => RefreshIndicator(
        onRefresh: () async {
          await controller.loadHewan();
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
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Get.defaultDialog(
                  //   title: 'Cari Data Hewan',
                  //   content: TextField(
                  //     // Konfigurasi TextField untuk pencarian
                  //     decoration: InputDecoration(
                  //       hintText: 'Masukkan kode Eartag Nasional',
                  //     ),
                  //   ),
                  //   actions: [
                  //     ElevatedButton(
                  //       onPressed: () {
                  //         // Tambahkan logika pencarian di sini
                  //         Get.back(); // Tutup dialog
                  //       },
                  //       child: Text('Cari'),
                  //     ),
                  //   ],
                  // );
                },
              ),
            ],
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
          // floatingActionButton: FloatingActionButton(
          //   tooltip: 'Search people',
          //   onPressed: () => showSearch(
          //     context: context,
          //     delegate: SearchPage(
          //       onQueryUpdate: print,
          //       items: people,
          //       searchLabel: 'Search people',
          //       suggestion: const Center(
          //         child: Text('Filter people by name, surname or age'),
          //       ),
          //       failure: const Center(
          //         child: Text('No person found :('),
          //       ),
          //       filter: (person) => [
          //         person.name,
          //         person.surname,
          //         person.age.toString(),
          //       ],
          //       sort: (a, b) => a.compareTo(b),
          //       builder: (person) => ListTile(
          //         title: Text(person.name),
          //         subtitle: Text(person.surname),
          //         trailing: Text('${person.age} yo'),
          //       ),
          //     ),
          //   ),
          //   child: const Icon(Icons.search),
          // ),
          //body: Container(),
          body: GetBuilder<HewanController>(
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
                          child:
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  onChanged: (query) {
                                    hewanController.searchQuery.value = query;
                                    //hewanController.filterHewan();
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Cari Item',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GetBuilder<HewanController>(
                                  builder: (controller) {
                                    return ListView.builder(
                                      itemCount:
                                          controller.filteredHewan.length,
                                      itemBuilder: (context, index) {
                                        final hewan =
                                            controller.filteredHewan[index];
                                        return ListTile(
                                          title: Text(hewan.noKartuTernak!),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                          return InkWell(
                            onTap: () => {
                              Get.toNamed(
                                Routes.DETAILHEWAN,
                                arguments: {
                                  "eartag_hewan_detail":
                                      "${postData.kodeEartagNasional}",
                                  "kartu_hewan_detail":
                                      "${postData.noKartuTernak}",
                                  "provinsi_hewan_detail":
                                      "${postData.provinsi}",
                                  "kabupaten_hewan_detail":
                                      "${postData.kabupaten}",
                                  "kecamatan_hewan_detail":
                                      "${postData.kecamatan}",
                                  "desa_hewan_detail": "${postData.desa}",
                                  "nama_peternak_hewan_detail":
                                      "${postData.idPeternak?.namaPeternak}",
                                  "id_peternak_hewan_detail":
                                      "${postData.idPeternak?.idPeternak}",
                                  "nik_hewan_detail":
                                      "${postData.idPeternak?.nikPeternak}",
                                  "spesies_hewan_detail": "${postData.spesies}",
                                  "kelamin_hewan_detail": "${postData.sex}",
                                  "umur_hewan_detail": "${postData.umur}",
                                  "identifikasi_hewan_detail":
                                      "${postData.identifikasiHewan}",
                                  "petugas_terdaftar_hewan_detail":
                                      "${postData.petugasPendaftar}",
                                  "tanggal_terdaftar_hewan_detail":
                                      "${postData.tanggalTerdaftar}",
                                  "foto_hewan_detail": "${postData.fotoHewan}",
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
                                            : "Kode Eartag Nasional: ${postData.kodeEartagNasional}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        (postData.status == null)
                                            ? "-"
                                            : "No Kartu Ternak: ${postData.noKartuTernak}",
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
                                            : "Nik Peternak: "
                                                "${postData.nikPeternak}",
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
                Get.toNamed(Routes.ADDHEWAN);
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


// class HewanView extends GetView<HewanController> {
//   const HewanView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HewanController>(
//       builder: (controller) => AutoLoad(
//         onInit: () async {
//           await controller.loadHewan();
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
//           body: GetBuilder<HewanController>(
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
//                                 Routes.DETAILHEWAN,
//                                 arguments: {
//                                   "eartag_hewan_detail": "${postData.kodeEartagNasional}",
//                                   "kartu_hewan_detail": "${postData.noKartuTernak}",
//                                   "provinsi_hewan_detail": "${postData.provinsi}",
//                                   "kabupaten_hewan_detail": "${postData.kabupaten}",
//                                   "kecamatan_hewan_detail": "${postData.kecamatan}",
//                                   "desa_hewan_detail": "${postData.desa}",
//                                   "nama_peternak_hewan_detail": "${postData.namaPeternak}",
//                                   "id_peternak_hewan_detail": "${postData.idPeternak}",
//                                   "nik_hewan_detail": "${postData.nikPeternak}",
//                                   "spesies_hewan_detail": "${postData.spesies}",
//                                   "kelamin_hewan_detail": "${postData.sex}",
//                                   "umur_hewan_detail": "${postData.umur}",
//                                   "identifikasi_hewan_detail": "${postData.identifikasiHewan}",
//                                   "petugas_terdaftar_hewan_detail": "${postData.petugasPendaftar}",
//                                   "tanggal_terdaftar_hewan_detail": "${postData.tanggalTerdaftar}",
                                  
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
//                                             : "No Kartu Ternak : ${postData.kodeEartagNasional} ${postData.noKartuTernak}",
//                                         style: TextStyle(fontSize: 18),
//                                       ),
//                                       Text((postData.status == null)
//                                           ? "-"
//                                           : "${postData.spesies}"),
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
//                 Get.toNamed(Routes.ADDHEWAN);
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