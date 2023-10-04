import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_inseminasi_controller.dart';

class DetailInseminasiView extends GetView<DetailInseminasiController> {
  const DetailInseminasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        title: Text(
          'Detail Inseminasi',
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
                padding: EdgeInsets.only(left: 15, right: 15, top: 4),
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
                    fontSize: 18,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.idInseminasiC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Id Inseminasi",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Id Inseminas",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          // No Eartag Nasional
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 15, right: 15, top: 4),
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
                    fontSize: 18,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.eartagC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "No Eartag Nasional",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "No Eartag Nasional",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          // Id Hewan
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 15, right: 15, top: 4),
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
                    fontSize: 18,
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
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Id Hewan",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          // Id Pembuatan
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 15, right: 15, top: 4),
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
                    fontSize: 18,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.idPembuatanC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Id Pembuatan",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Id Pembuatan",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          // Id Pejantan
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 15, right: 15, top: 4),
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
                    fontSize: 18,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.idPejantanC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Id Pejantan",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Id Pejantan",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          // Bangsa Pejantan
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 15, right: 15, top: 4),
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
                    fontSize: 18,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.bangsaPejantanC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Bangsa Pejantan",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Bangsa Pejantan",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          // IB 1
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 15, right: 15, top: 4),
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
                    fontSize: 18,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.ib1C,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "IB 1",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "IB 1",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          // IB 2
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 15, right: 15, top: 4),
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
                    fontSize: 18,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.ib2C,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "IB 2",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "IB 2",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 15, right: 15, top: 4),
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
                    fontSize: 18,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.ib3C,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "IB 3",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "IB 3",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 15, right: 15, top: 4),
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
                    fontSize: 18,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.ibLainC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "IB Lain",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "IB Lain",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 15, right: 15, top: 4),
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
                    fontSize: 18,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.produsenC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Produsen",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Produsen",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 15, right: 15, top: 4),
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
                    fontSize: 18,
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
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Id Peternak",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 15, right: 15, top: 4),
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
                    fontSize: 18,
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
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Nama Peternak",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 15, right: 15, top: 4),
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
                    fontSize: 18,
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
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Lokasi",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 15, right: 15, top: 4),
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
                    fontSize: 18,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.inseminatorC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Inseminator",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Inseminator",
                    hintStyle: TextStyle(
                      fontSize: 15,
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
                child: TextField(
                  enabled: controller.isEditing.value,
                  style: TextStyle(
                      fontSize: 14, fontFamily: 'poppins', color: Colors.black),
                  maxLines: 1,
                  controller: controller.tanggalIBC,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.calendar_today),
                    labelText: "Tanggal IB",
                  ),
                  readOnly: true,
                  onTap: () => controller.tanggalIB(context),
                ),
              )),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (controller.isEditing.value)
                  ElevatedButton(
                    onPressed: () {
                      controller.editInseminasi();
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
                      controller.deleteInseminasi();
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
