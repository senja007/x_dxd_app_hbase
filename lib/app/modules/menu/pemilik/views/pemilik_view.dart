import 'package:crud_flutter_api/app/widgets/message/auto_load.dart';
import 'package:crud_flutter_api/app/widgets/message/empty.dart';
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
      builder: (controller) => RefreshIndicator(
        onRefresh: () => controller.refreshPeternak(),
        child: AutoLoad(
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
            body: _buildPeternakListView(controller),
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
      ),
    );
  }

  Widget _buildPeternakListView(PeternakController controller) {
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
                  Routes.DETAILPETERNAK,
                  arguments: {
                    "detail_id_peternak": "${postData.idPeternak}",
                    "detail_id_isikhnas": "${postData.idIsikhnas}",
                    "detail_nik": "${postData.nikPeternak}",
                    "detail_nama": "${postData.namaPeternak}",
                    "detail_lokasi": "${postData.lokasi}",
                    "detail_petugas_pendaftar": "${postData.petugasPendaftar}",
                    "detail_tanggal_pendaftaran": "${postData.tanggalPendaftaran}",
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
                              : "Id Peternak : ${postData.idPeternak}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text((postData.status == null)
                            ? "-"
                            : "${postData.namaPeternak}"),
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