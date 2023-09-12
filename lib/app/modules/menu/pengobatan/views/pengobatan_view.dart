import 'package:crud_flutter_api/app/modules/menu/pengobatan/controllers/pengobatan_controller.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:crud_flutter_api/app/widgets/message/auto_load.dart';
import 'package:crud_flutter_api/app/widgets/message/empty.dart';
import 'package:crud_flutter_api/app/widgets/message/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../menu_view/views/menu_view.dart';

class PengobatanView extends GetView<PengobatanController> {
  const PengobatanView({Key? key}) : super(key: key);
  @override
Widget build(BuildContext context) {
    return GetBuilder<PengobatanController>(
      builder: (controller) => RefreshIndicator(
        onRefresh: () => controller.refreshPengobatan(),
        child: AutoLoad(
          onInit: () async {
            await controller.loadPengobatan();
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
            body: _buildPengobatanListView(controller),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: FloatingActionButton(
                onPressed: () {
                  Get.toNamed(Routes.ADDPENGOBATAN);
                },
                child: Icon(Icons.add),
                backgroundColor: Color(0xff132137),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          ),
        ),
      ),
    );
  }

  Widget _buildPengobatanListView(PengobatanController controller) {
    if (controller.posts == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (controller.posts!.status == 200) {
      if (controller.posts!.content!.isEmpty) {
        return EmptyView();
      } else {
        return ListView.separated(
          itemCount: controller.posts!.content!.length,
          // shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(height: 16),
          itemBuilder: (context, index) {
            var postData = controller.posts!.content![index];
            return InkWell(
              onTap: () => {
                Get.toNamed(
                  Routes.DETAILPENGOBATAN,
                  arguments: {
                    "detail_id_kasus": "${postData.idKasus}",
                    "detail_infrastruktur": "${postData.namaInfrastruktur}",
                    "detail_dosis": "${postData.dosis}",
                    "detail_sindrom": "${postData.sindrom}",
                    "detail_diagnosa": "${postData.dignosaBanding}",
                    "detail_lokasi": "${postData.lokasi}",
                    "detail_petugas_pendaftar": "${postData.namaPetugas}",
                    "detail_tanggal_kasus": "${postData.tanggalKasus}",
                    "detail_tanggal_pengobatan": "${postData.tanggalPengobatan}",
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
                          (postData.status == null)
                              ? "-"
                              : "Id Kasus : ${postData.idKasus} ${postData.tanggalKasus}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text((postData.status == null)
                            ? "-"
                            : "${postData.dignosaBanding}"),
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
  }
}