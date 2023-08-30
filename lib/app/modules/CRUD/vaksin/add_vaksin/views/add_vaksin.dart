import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_input.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_vaksin_controller.dart';

class AddVaksinView extends GetView<AddVaksinController> {
  const AddVaksinView({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7EBE1),
      appBar: AppBar(
        title: Text(
          'Tambah Data Vaksin',
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
            label: 'Id vaksin',
            hint: 'Id vaksin',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'No Earteg Nasional',
            hint: 'No Earteg Nasional',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Id Hewan',
            hint: 'Id Hewan',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Id Pembuatan',
            hint: 'Id Pembuatan',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Id Penjantan',
            hint: 'Id Penjantan',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Bangsa Pejantan',
            hint: 'Bangsa Pejantan',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'IB 1',
            hint: 'IB 1',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'IB 2',
            hint: 'IB 2',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'IB 3',
            hint: 'IB 3',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'IB lain',
            hint: 'IB lain',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'Produsen',
            hint: 'Produsen',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Id Peternak',
            hint: 'Id Peternak',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Nama Peternak',
            hint: 'Nama Peternak',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Lokasi',
            hint: 'Lokasi',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Inseminator',
            hint: 'Inseminator',
          ),
          CustomInput(
            controller: controller.titleC,
            label: 'Tanggal IB',
            hint: 'Tanggal IB',
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
