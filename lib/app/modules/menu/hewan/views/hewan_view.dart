import 'package:crud_flutter_api/app/widgets/message/auto_load.dart';
import 'package:crud_flutter_api/app/widgets/message/empty.dart';
import 'package:crud_flutter_api/app/widgets/message/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/hewan_controller.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/utils/app_color.dart';

class HewanView extends GetView<HewanController> {
  const HewanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HewanController>(
      builder: (controller) => AutoLoad(
        onInit: () async {
          await controller.loadHewan();
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
          body: GetBuilder<HewanController>(
            builder: (controller) => controller.posts?.status == 200
                ? controller.posts!.content!.isEmpty
                    ? EmptyView()
                    : ListView.separated(
                        itemCount: controller.posts!.content!.length,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          var postData = controller.posts!.content![index];
                          return InkWell(
                            onTap: () => {
                              Get.toNamed(
                                Routes.DETAILHEWAN,
                                arguments: {
                                  "eartag_hewan_detail": "${postData.kodeEartagNasional}",
                                  "kartu_hewan_detail": "${postData.noKartuTernak}",
                                  "provinsi_hewan_detail": "${postData.provinsi}",
                                  "kabupaten_hewan_detail": "${postData.kabupaten}",
                                  "kecamatan_hewan_detail": "${postData.kecamatan}",
                                  "desa_hewan_detail": "${postData.desa}",
                                  "nama_peternak_hewan_detail": "${postData.namaPeternak}",
                                  "id_peternak_hewan_detail": "${postData.idPeternak}",
                                  "nik_hewan_detail": "${postData.nikPeternak}",
                                  "spesies_hewan_detail": "${postData.spesies}",
                                  "kelamin_hewan_detail": "${postData.sex}",
                                  "umur_hewan_detail": "${postData.umur}",
                                  "identifikasi_hewan_detail": "${postData.identifikasiHewan}",
                                  "petugas_terdaftar_hewan_detail": "${postData.petugasPendaftar}",
                                  "tanggal_terdaftar_hewan_detail": "${postData.tanggalTerdaftar}",
                                  
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
                                            : "No Kartu Ternak : ${postData.kodeEartagNasional} ${postData.noKartuTernak}",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text((postData.status == null)
                                          ? "-"
                                          : "${postData.spesies}"),
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
