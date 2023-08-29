import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_input.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_hewan_controller.dart';

class AddHewanView extends GetView<AddHewanController> {
  const AddHewanView({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tambah Data Hewan',
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
            label: 'Kode Earteg Nasional',
            hint: 'Kode Earteg Nasional',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'No Kartu Ternak',
            hint: 'No Kartu Ternak',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Nik Peternak',
            hint: 'Nik Peternak',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'Id Peternak',
            hint: 'Id Peternak',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Nama Peternak',
            hint: 'Nama Peternak',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'Provinsi',
            hint: 'Provinsi',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'Kabupaten',
            hint: 'Kabupaten',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Kecamatan',
            hint: 'Kecamatan',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'Desa',
            hint: 'Desa',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'Identifikasi Hewan',
            hint: 'Identifikasi Hewan',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Jenis Kelamin',
            hint: 'Jenis Kelamin',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'Spesies',
            hint: 'Spesies',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'Umur',
            hint: 'Umur',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Petugas terdaftar',
            hint: 'Petugas terdaftar',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'Tanggal terdaftar',
            hint: 'Tanggal terdaftar',
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
