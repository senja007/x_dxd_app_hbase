import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_input.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_pengobatan_controller.dart';

class AddPengobatanView extends GetView<AddPengobatanController> {
  const AddPengobatanView({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tambah Data Pengobatan',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Ikon panah kembali
          onPressed: () {
            Navigator.of(context).pop(); // Aksi saat tombol diklik
          },
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
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20),
        children: [
          CustomInput(
            controller: controller.titleC,
            label: 'Id Kasus',
            hint: 'Id Kasus',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'Nama Infrastuktur',
            hint: 'Nama Infrastuktur',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Dosis',
            hint: 'Dosis',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Sindrom',
            hint: 'Sindrom',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'Diagnosa Banding',
            hint: 'Diagnosa Banding',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'Lokasi',
            hint: 'Lokasi',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'Petugas Pendaftar',
            hint: 'Petugas Pendaftar',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Tanggal Kasus',
            hint: 'Tanggal Kasus',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Tanggal Pengobatan',
            hint: 'Tanggal Pengobatan',
          ),
          SizedBox(height: 32),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Obx(
              () => ElevatedButton(
                onPressed: () {
                  if (controller.isLoading.isFalse) {
                    controller.addPost();
                  }
                },
                child: Text(
                  (controller.isLoading.isFalse) ? 'Tambah post' : 'Loading...',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'poppins',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff132137),
                  padding: EdgeInsets.symmetric(vertical: 18),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
