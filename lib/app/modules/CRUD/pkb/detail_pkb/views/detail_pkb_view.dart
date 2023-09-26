import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_pkb_controller.dart';

class DetailPkbView extends GetView<DetailPkbController> {
  const DetailPkbView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        title: Text(
          'Detail Data',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Ikon panah kembali
          onPressed: () {
            Navigator.of(context).pop(); // Aksi saat tombol diklik
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (controller.isEditing.value) {
                controller.tutupEdit();
              } else {
                controller.tombolEdit();
              }
            },
            icon: Obx(() {
              return Icon(
                controller.isEditing.value ? Icons.close : Icons.edit,
              );
            }),
          ),
        ],
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
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: controller.isEditing.value
                      ? Colors.grey[200]
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(width: 1, color: AppColor.secondaryExtraSoft),
                ),
                child: TextFormField(
                  enabled: false,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.idKejadianC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Id Kejadian",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 14,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Id Kejadian",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: controller.isEditing.value
                      ? Colors.white
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(width: 1, color: AppColor.secondaryExtraSoft),
                ),
                child: TextFormField(
                  enabled: controller.isEditing.value,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.idHewanC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Id Hewan",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 14,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Id Hewan",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: controller.isEditing.value
                      ? Colors.white
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(width: 1, color: AppColor.secondaryExtraSoft),
                ),
                child: TextFormField(
                  enabled: controller.isEditing.value,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.idPeternakC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Id Peternak",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 14,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Id Peternak",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: controller.isEditing.value
                      ? Colors.white
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(width: 1, color: AppColor.secondaryExtraSoft),
                ),
                child: TextFormField(
                  enabled: controller.isEditing.value,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.nikPeternakC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "NIK Peternak",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 14,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "NIK Peternak",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: controller.isEditing.value
                      ? Colors.white
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(width: 1, color: AppColor.secondaryExtraSoft),
                ),
                child: TextFormField(
                  enabled: controller.isEditing.value,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.namaPeternakC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Nama Peternak",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 14,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Nama Peternak",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: controller.isEditing.value
                      ? Colors.white
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(width: 1, color: AppColor.secondaryExtraSoft),
                ),
                child: TextFormField(
                  enabled: controller.isEditing.value,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.jumlahC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Jumlah",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 14,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Jumlah",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: controller.isEditing.value
                      ? Colors.white
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(width: 1, color: AppColor.secondaryExtraSoft),
                ),
                child: TextFormField(
                  enabled: controller.isEditing.value,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.kategoriC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "kategori",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 14,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "kategori",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: controller.isEditing.value
                      ? Colors.white
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(width: 1, color: AppColor.secondaryExtraSoft),
                ),
                child: TextFormField(
                  enabled: controller.isEditing.value,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.lokasiC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Lokasi",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 14,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Lokasi",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: controller.isEditing.value
                      ? Colors.white
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(width: 1, color: AppColor.secondaryExtraSoft),
                ),
                child: TextFormField(
                  enabled: controller.isEditing.value,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.spesiesC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Spesies",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 14,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Spesies",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: controller.isEditing.value
                      ? Colors.white
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(width: 1, color: AppColor.secondaryExtraSoft),
                ),
                child: TextFormField(
                  enabled: controller.isEditing.value,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.umurKebuntinganC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Umur Kebuntingan",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 14,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Umur Kebuntingan",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: controller.isEditing.value
                      ? Colors.white
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(width: 1, color: AppColor.secondaryExtraSoft),
                ),
                child: TextFormField(
                  enabled: controller.isEditing.value,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.pemeriksaKebuntinganC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Pemeriksa Kebuntingan",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 14,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Pemeriksa Kebuntingan",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: controller.isEditing.value
                      ? Colors.white
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(width: 1, color: AppColor.secondaryExtraSoft),
                ),
                child: TextFormField(
                  enabled: controller.isEditing.value,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.tanggalPkbC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Tanggal PKB",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 14,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Tanggal PKB",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (controller.isEditing.value)
                  ElevatedButton(
                    onPressed: () {
                      controller.EditPkb();
                    },
                    child: Text(
                      'Edit post',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'poppins',
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(120, 55),
                      backgroundColor: Color(0xff132137),
                      padding: EdgeInsets.symmetric(vertical: 18),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    // ... Other button properties
                  )
                else
                  ElevatedButton(
                    onPressed: () {
                      controller.deletePkb();
                    },
                    child: Text(
                      'Delete post',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'poppins',
                        color: AppColor.primaryExtraSoft,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(120, 55),
                      backgroundColor: Color(0xff132137),
                      padding: EdgeInsets.symmetric(vertical: 18),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
              ],
            );
          })
        ],
      ),
    );
  }
}
