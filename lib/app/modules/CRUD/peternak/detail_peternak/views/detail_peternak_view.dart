import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:flutter/material.dart';

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
                      fontSize: 18, fontFamily: 'poppins', color: Colors.black),
                  maxLines: 1,
                  controller: controller.idPeternakC,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Text(
                      "ID Peternak",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "ID Peternak",
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
                child: TextFormField(
                  enabled: controller.isEditing.value,
                  style: TextStyle(
                      fontSize: 18, fontFamily: 'poppins', color: Colors.black),
                  maxLines: 1,
                  controller: controller.idISIKHNASC,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Text(
                      "ID ISIKHNAS",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "ID ISIKHNAS",
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
                child: TextFormField(
                  enabled: controller.isEditing.value,
                  style: TextStyle(
                      fontSize: 18, fontFamily: 'poppins', color: Colors.black),
                  maxLines: 1,
                  controller: controller.nikPeternakC,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text(
                      "NIK Peternak",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "NIK Peternak",
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
                child: TextFormField(
                  enabled: controller.isEditing.value,
                  style: TextStyle(
                      fontSize: 18, fontFamily: 'poppins', color: Colors.black),
                  maxLines: 1,
                  controller: controller.namaPeternakC,
                  keyboardType: TextInputType.emailAddress,
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
                      fontSize: 18, fontFamily: 'poppins', color: Colors.black),
                  maxLines: 1,
                  controller: controller.lokasiC,
                  keyboardType: TextInputType.emailAddress,
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
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 14, right: 14, top: 4),
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Text(
                    "Petugas Pendaftar",
                    style: TextStyle(
                      color: AppColor.secondarySoft,
                      fontSize: 12,
                    ),
                  ),
                ),
                Obx(() {
                  return DropdownButton<String>(
                    value: controller.selectedPetugas.value,
                    items: controller.petugasList.map((PetugasModel petugas) {
                      return DropdownMenuItem<String>(
                        value: petugas.namaPetugas ?? '',
                        child: Text(petugas.namaPetugas ?? ''),
                      );
                    }).toList(),
                    onChanged: (String? selectedNama) {
                      controller.selectedPetugas.value = selectedNama ?? '';
                    },
                    hint: Text('Pilih Petugas'),
                  );
                }),
              ],
            ),
          ),
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
                  controller: controller.tanggalPendaftaranC,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.calendar_today),
                    labelText: "Tanggal Pendaftaran",
                  ),
                  readOnly: true,
                  onTap: () => controller.tanggalPendaftaran(context),
                ),
              )),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (controller.isEditing.value)
                  ElevatedButton(
                    onPressed: () {
                      controller.editPeternak();
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
                      controller.deletePeternak();
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
