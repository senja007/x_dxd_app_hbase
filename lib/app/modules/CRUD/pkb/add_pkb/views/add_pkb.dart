import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_input.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_pkb_controller.dart';

class AddPkbView extends GetView<AddPkbController> {
  const AddPkbView({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7EBE1),
      appBar: AppBar(
        title: Text(
          'Tambah Data Pkb',
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
            label: 'Id Hewan',
            hint: 'Id Hewan',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Id Peternak',
            hint: 'Id Peternak',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'NIK Peternak',
            hint: 'NIK Peternak',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Nama Peternak',
            hint: 'Nama Peternak',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'Jumlah',
            hint: 'Jumlah',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'Kategori',
            hint: 'Kategori',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'Lokasi',
            hint: 'Lokasi',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Spesies',
            hint: 'Spesies',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Umur Kebuntingan',
            hint: 'Umur Kebuntingan',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Pemeriksa Kebuntingan',
            hint: 'Pemeriksa Kebuntingan',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Tanggal Pkb',
            hint: 'Tanggal Pkb',
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
