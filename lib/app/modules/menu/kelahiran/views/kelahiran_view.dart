import 'package:crud_flutter_api/app/modules/menu/kelahiran/controllers/kelahiran_controller.dart';
import 'package:crud_flutter_api/app/widgets/message/auto_load.dart';
import 'package:crud_flutter_api/app/widgets/message/empty.dart';
import 'package:crud_flutter_api/app/widgets/message/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/utils/app_color.dart';

class KelahiranView extends GetView<KelahiranController> {
  const KelahiranView({Key? key}) : super(key: key);
  @override
Widget build(BuildContext context) {
    return GetBuilder<KelahiranController>(
      builder: (controller) => RefreshIndicator(
        onRefresh: () => controller.refreshKelahiran(),
        child: AutoLoad(
          onInit: () async {
            await controller.loadkelahiran();
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
            body: _buildKelahiranListView(controller),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: FloatingActionButton(
                onPressed: () {
                  Get.toNamed(Routes.ADDKELAHIRAN);
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

  Widget _buildKelahiranListView(KelahiranController controller) {
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
                  Routes.DETAILKELAHIRAN,
                  arguments: {
                    "id_kejadian_detail": "${postData.idKejadian}",
                    "eartag_induk_detail": "${postData.eartagInduk}",
                    "eartag_anak_detail": "${postData.eartagAnak}",
                    "id_hewan_induk_detail": "${postData.idHewanInduk}",
                    "id_hewan_anak_detail": "${postData.idHewanAnak}",
                    "id_batch_detail": "${postData.idBatchStraw}",
                    "id_pejantan_detail": "${postData.idPejantanStraw}",
                    "kelamin_anak_detail": "${postData.jenisKelaminAnak}",
                    "jumlah_detail": "${postData.jumlah}",
                    "urutan_ib_detail": "${postData.urutanIb}",
                    "kartu_ternak_anak_detail": "${postData.kartuTernakAnak}",
                    "kartu_ternak_induk_detail": "${postData.kartuTernakInduk}",
                    "kategori_detail": "${postData.kategori}",
                    "lokasi_detail": "${postData.lokasi}",
                    "id_peternak_detail": "${postData.idPeternak}",
                    "nama_peternak_detail": "${postData.namaPeternak}",
                    "petugas_pelapor_detail": "${postData.petugasPelapor}",
                    "produsen_detail": "${postData.produsenStraw}",
                    "spesies_induk_detail": "${postData.spesiesInduk}",
                    "spesies_pejantan_detail": "${postData.spesiesPejantan}",
                    "tanggal_lahir_detail": "${postData.tanggalLahir}",
                    "tanggal_laporan_detail": "${postData.tanggalLaporan}",
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
                              : "Id Kasus : ${postData.idKejadian} ${postData.tanggalLaporan}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text((postData.status == null)
                            ? "-"
                            : "${postData.jumlah}"),
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
