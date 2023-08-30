import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_input.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_kelahiran_controller.dart';

class AddKelahiranView extends GetView<AddkelahiranController> {
  const AddKelahiranView({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7EBE1),
      appBar: AppBar(
        title: Text(
          'Tambah Data Kelahiran',
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
            label: 'Id Kejadian',
            hint: 'Id Kejadian',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'No Earteg Induk',
            hint: 'No Earteg Induk',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'No Earteg Anak',
            hint: 'No Earteg Anak',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Id Hewan Induk',
            hint: 'Id Hewan Induk',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Id Hewan Anak',
            hint: 'Id Hewan Anak',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Id Batch ',
            hint: 'Id Batch',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Id Penjantan',
            hint: 'Id Penjantan',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Jenis Kelamin Anak',
            hint: 'Jenis Kelamin Anak',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'Jumlah',
            hint: 'Jumlah',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Kartu Ternak Anak',
            hint: 'Kartu Ternak Anak',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Kartu Ternak Induk',
            hint: 'Kartu Ternak Induk',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Kategori',
            hint: 'Kategori',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Lokasi',
            hint: 'Lokasi',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'Id Peternak',
            hint: 'Id Peternak',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'Nama Peternak',
            hint: 'Nama Peternak',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Petugas Pelapor',
            hint: 'Petugas Pelapor',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Produsen',
            hint: 'Produsen',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Spesies Induk',
            hint: 'Spesies Induk',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Spesies Penjantan',
            hint: 'Spesies Penjantan',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Tanggal Lahir',
            hint: 'Tanggal Lahir',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Tanggal laporan',
            hint: 'Tanggal laporan',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Urutan IB',
            hint: 'Urutan IB',
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
