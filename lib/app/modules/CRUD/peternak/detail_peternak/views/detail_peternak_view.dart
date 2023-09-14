import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/detail_peternak_controller.dart';

class DetailPeternakView extends GetView<DetailPeternakController> {
  const DetailPeternakView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7EBE1),
      appBar: AppBar(
        title: Text(
          'Tambah Data Peternak',
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
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 14, right: 14, top: 4),
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
            ),
            child: TextField(
              style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
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
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 14, right: 14, top: 4),
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
            ),
            child: TextField(
              style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
              maxLines: 1,
              controller: controller.idIsikhnasC,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text(
                  "Id ISIKHNAS",
                  style: TextStyle(
                    color: AppColor.secondarySoft,
                    fontSize: 14,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: InputBorder.none,
                hintText: "Id ISIKHNAS",
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w500,
                  color: AppColor.secondarySoft,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 14, right: 14, top: 4),
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
            ),
            child: TextField(
              style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
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
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 14, right: 14, top: 4),
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
            ),
            child: TextField(
              style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
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
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 14, right: 14, top: 4),
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
            ),
            child: TextField(
              style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
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
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 14, right: 14, top: 4),
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
            ),
            child: TextField(
              style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
              maxLines: 1,
              controller: controller.petugasPendaftarC,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text(
                  "Petugas Pendaftar",
                  style: TextStyle(
                    color: AppColor.secondarySoft,
                    fontSize: 14,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: InputBorder.none,
                hintText: "Petugas Pendaftar",
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w500,
                  color: AppColor.secondarySoft,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 14, right: 14, top: 4),
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
            ),
            child: TextField(
              style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
              maxLines: 1,
              controller: controller.tanggalPendaftaranC,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                label: Text(
                  "Tanggal Pendaftaran",
                  style: TextStyle(
                    color: AppColor.secondarySoft,
                    fontSize: 14,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: InputBorder.none,
                hintText: "Tanggal Pendaftaran",
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w500,
                  color: AppColor.secondarySoft,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(Routes.EDITPETERNAK);
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
              ),
              SizedBox(
                width: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.deletePost();
                },
                child: Text(
                  'Delete post',
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
