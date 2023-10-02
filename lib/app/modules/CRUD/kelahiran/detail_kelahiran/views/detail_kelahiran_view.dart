import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/detail_kelahiran_controller.dart';

class DetailKelahiranView extends GetView<DetailKelahiranController> {
  const DetailKelahiranView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        title: Text(
          'Detail Kelahiran',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
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
            Obx(() {
              return Container(
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
                  controller: controller.idKejadianC,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "ID Kejadian",
                    labelStyle: TextStyle(
                      color: AppColor.secondarySoft,
                      fontSize: 15,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "ID Kejadian",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              );
            }),
            Obx(() => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: controller.isEditing.value
                        ? Colors.white
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextFormField(
                    enabled: controller.isEditing.value,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'poppins',
                        color: Colors.black),
                    maxLines: 1,
                    autofocus: true,
                    controller: controller.tanggalLaporanC,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text(
                        "Tanggal Laporan",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          fontSize: 15,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                      hintText: "Tanggal Laporan",
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
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextFormField(
                    enabled: controller.isEditing.value,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'poppins',
                        color: Colors.black),
                    maxLines: 1,
                    autofocus: true,
                    controller: controller.tanggalLahirC,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text(
                        "Tanggal Lahir",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          fontSize: 15,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                      hintText: "Tanggal Lahir",
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
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextFormField(
                    enabled: controller.isEditing.value,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'poppins',
                        color: Colors.black),
                    maxLines: 1,
                    autofocus: true,
                    controller: controller.lokasiC,
                    keyboardType: TextInputType.name,
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
                )),Obx(() => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: controller.isEditing.value
                        ? Colors.white
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextFormField(
                    enabled: controller.isEditing.value,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'poppins',
                        color: Colors.black),
                    maxLines: 1,
                    autofocus: true,
                    controller: controller.namaPeternakC,
                    keyboardType: TextInputType.name,
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
                )),Obx(() => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: controller.isEditing.value
                        ? Colors.white
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextFormField(
                    enabled: controller.isEditing.value,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'poppins',
                        color: Colors.black),
                    maxLines: 1,
                    autofocus: true,
                    controller: controller.idPeternakC,
                    keyboardType: TextInputType.name,
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
                )),Obx(() => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: controller.isEditing.value
                        ? Colors.white
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextFormField(
                    enabled: controller.isEditing.value,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'poppins',
                        color: Colors.black),
                    maxLines: 1,
                    autofocus: true,
                    controller: controller.kartuTernakIndukC,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text(
                        "Kartu Ternak Induk",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          fontSize: 15,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                      hintText: "Kartu Ternak Induk",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondarySoft,
                      ),
                    ),
                  ),
                )),Obx(() => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: controller.isEditing.value
                        ? Colors.white
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextFormField(
                    enabled: controller.isEditing.value,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'poppins',
                        color: Colors.black),
                    maxLines: 1,
                    autofocus: true,
                    controller: controller.eartagIndukC,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text(
                        "Eartag Induk",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          fontSize: 15,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                      hintText: "Eartag Induk",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondarySoft,
                      ),
                    ),
                  ),
                )),Obx(() => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: controller.isEditing.value
                        ? Colors.white
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextFormField(
                    enabled: controller.isEditing.value,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'poppins',
                        color: Colors.black),
                    maxLines: 1,
                    autofocus: true,
                    controller: controller.idHewanIndukC,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text(
                        "ID Hewan Induk",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          fontSize: 15,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                      hintText: "ID Hewan Induk",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondarySoft,
                      ),
                    ),
                  ),
                )),Obx(() => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: controller.isEditing.value
                        ? Colors.white
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextFormField(
                    enabled: controller.isEditing.value,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'poppins',
                        color: Colors.black),
                    maxLines: 1,
                    autofocus: true,
                    controller: controller.spesiesIndukC,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text(
                        "Spesies Induk",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          fontSize: 15,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                      hintText: "Spesies Induk",
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
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextFormField(
                    enabled: controller.isEditing.value,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'poppins',
                        color: Colors.black),
                    maxLines: 1,
                    autofocus: true,
                    controller: controller.idPejantanStrawC,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text(
                        "ID Pejantan Straw",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          fontSize: 15,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                      hintText: "ID Pejantan Straw",
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
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextFormField(
                    enabled: controller.isEditing.value,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'poppins',
                        color: Colors.black),
                    maxLines: 1,
                    autofocus: true,
                    controller: controller.idBatchStrawC,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text(
                        "ID Batch Straw",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          fontSize: 15,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                      hintText: "ID Batch Straw",
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
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextFormField(
                    enabled: controller.isEditing.value,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'poppins',
                        color: Colors.black),
                    maxLines: 1,
                    autofocus: true,
                    controller: controller.produsenStrawC,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text(
                        "Produsen Straw",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          fontSize: 15,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                      hintText: "Produsen Straw",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondarySoft,
                      ),
                    ),
                  ),
                )),Obx(() => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: controller.isEditing.value
                        ? Colors.white
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextFormField(
                    enabled: controller.isEditing.value,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'poppins',
                        color: Colors.black),
                    maxLines: 1,
                    autofocus: true,
                    controller: controller.spesiesPejantanC,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text(
                        "Spesies Pejantan",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          fontSize: 15,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                      hintText: "Spesies Pejantan",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondarySoft,
                      ),
                    ),
                  ),
                )),Obx(() => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: controller.isEditing.value
                        ? Colors.white
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextFormField(
                    enabled: controller.isEditing.value,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'poppins',
                        color: Colors.black),
                    maxLines: 1,
                    autofocus: true,
                    controller: controller.jumlahC,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text(
                        "Jumlah",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          fontSize: 15,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                      hintText: "Jumlah",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondarySoft,
                      ),
                    ),
                  ),
                )),Obx(() => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: controller.isEditing.value
                        ? Colors.white
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextFormField(
                    enabled: controller.isEditing.value,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'poppins',
                        color: Colors.black),
                    maxLines: 1,
                    autofocus: true,
                    controller: controller.kartuTernakAnakC,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text(
                        "Kartu Ternak Anak",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          fontSize: 15,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                      hintText: "Kartu Ternak Anak",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondarySoft,
                      ),
                    ),
                  ),
                )),Obx(() => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: controller.isEditing.value
                        ? Colors.white
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextFormField(
                    enabled: controller.isEditing.value,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'poppins',
                        color: Colors.black),
                    maxLines: 1,
                    autofocus: true,
                    controller: controller.eartagAnakC,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text(
                        "Eartag Anak",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          fontSize: 15,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                      hintText: "Eartag Anak",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondarySoft,
                      ),
                    ),
                  ),
                )),Obx(() => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: controller.isEditing.value
                        ? Colors.white
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextFormField(
                    enabled: controller.isEditing.value,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'poppins',
                        color: Colors.black),
                    maxLines: 1,
                    autofocus: true,
                    controller: controller.idHewanAnakC,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text(
                        "ID Hewan Anak",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          fontSize: 15,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                      hintText: "ID Hewan Anak",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondarySoft,
                      ),
                    ),
                  ),
                )),Obx(() => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: controller.isEditing.value
                        ? Colors.white
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextFormField(
                    enabled: controller.isEditing.value,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'poppins',
                        color: Colors.black),
                    maxLines: 1,
                    autofocus: true,
                    controller: controller.jenisKelaminAnakC,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text(
                        "Jenis Kelamin Anak",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          fontSize: 15,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                      hintText: "Jenis Kelamin Anak",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondarySoft,
                      ),
                    ),
                  ),
                )),Obx(() => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: controller.isEditing.value
                        ? Colors.white
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextFormField(
                    enabled: controller.isEditing.value,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'poppins',
                        color: Colors.black),
                    maxLines: 1,
                    autofocus: true,
                    controller: controller.kategoriC,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text(
                        "Kategori",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          fontSize: 15,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                      hintText: "Kategori",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondarySoft,
                      ),
                    ),
                  ),
                )),Obx(() => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: controller.isEditing.value
                        ? Colors.white
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextFormField(
                    enabled: controller.isEditing.value,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'poppins',
                        color: Colors.black),
                    maxLines: 1,
                    autofocus: true,
                    controller: controller.petugasPelaporC,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text(
                        "Petugas Pelapor",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          fontSize: 15,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                      hintText: "Petugas Pelapor",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondarySoft,
                      ),
                    ),
                  ),
                )),Obx(() => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: controller.isEditing.value
                        ? Colors.white
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextFormField(
                    enabled: controller.isEditing.value,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'poppins',
                        color: Colors.black),
                    maxLines: 1,
                    autofocus: true,
                    controller: controller.urutanIbC,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text(
                        "Urutan IB",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          fontSize: 15,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                      hintText: "Urutan IB",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondarySoft,
                      ),
                    ),
                  ),
                )),
            Obx(
              () {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (controller.isEditing.value)
                      ElevatedButton(
                        onPressed: () {
                          controller.editKelahiran();
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
                          controller.deleteKelahiran();
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
              },
            )
          ]),
    );
  }
}


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.primary,
//       appBar: AppBar(
//         title: Text(
//           'Detail Kelahiran',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18,
//           ),
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back), // Ikon panah kembali
//           onPressed: () {
//             Navigator.of(context).pop(); // Aksi saat tombol diklik
//           },
//         ),
//        actions: [
//           IconButton(
//             onPressed: () {
//               if (controller.isEditing.value) {
//                 controller.tutupEdit();
//               } else {
//                 controller.tombolEdit();
//               }
//             },
//             icon: Obx(() {
//               return Icon(
//                 controller.isEditing.value ? Icons.close : Icons.edit,
//               );
//             }),
//           ),
//         ],
//         backgroundColor: Color(0xff132137),
//         elevation: 0,
//         centerTitle: true,
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(1),
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: 1,
//             color: AppColor.secondaryExtraSoft,
//           ),
//         ),
//       ),
//       body: ListView(
//         shrinkWrap: true,
//         physics: BouncingScrollPhysics(),
//         padding: EdgeInsets.all(20),
//         children: [
          
//           Obx(() => Container(
//                 width: MediaQuery.of(context).size.width,
//                 padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//                 margin: EdgeInsets.only(bottom: 16),
//                 decoration: BoxDecoration(
//                   color: controller.isEditing.value
//                       ? Colors.grey[200]
//                       : Colors.grey[200],
//                   borderRadius: BorderRadius.circular(8),
//                   border:
//                       Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//                 ),
//                 child: TextFormField(
//                   enabled: false,
//                   style: TextStyle(
//                       fontSize: 18, fontFamily: 'poppins', color: Colors.black),
//                   maxLines: 1,
//                   autofocus: true,
//                   controller: controller.idKejadianC,
//                   keyboardType: TextInputType.name,
//                   decoration: InputDecoration(
//                     label: Text(
//                       "ID Kejadian",
//                       style: TextStyle(
//                         color: AppColor.secondarySoft,
//                         fontSize: 15,
//                       ),
//                     ),
//                     floatingLabelBehavior: FloatingLabelBehavior.always,
//                     border: InputBorder.none,
//                     hintText: "ID Kejadian",
//                     hintStyle: TextStyle(
//                       fontSize: 15,
//                       fontFamily: 'poppins',
//                       fontWeight: FontWeight.w500,
//                       color: AppColor.secondarySoft,
//                     ),
//                   ),
//                 ),
//               )),
//            Obx(() => Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
//               maxLines: 1,
//               controller: controller.eartagIndukC,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 label: Text(
//                   "No Eartag Induk",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "No Eartag Induk",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           )),
//           Obx(() => Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
//               maxLines: 1,
//               controller: controller.eartagAnakC,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 label: Text(
//                   "No Eartag Anak",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "No Eartag Anak",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           )),
//           Obx(() =>Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
//               maxLines: 1,
//               controller: controller.idHewanIndukC,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 label: Text(
//                   "Id Hewan Induk",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "Id Hewan Induk",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           )),
//           Obx(() =>Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
//               maxLines: 1,
//               controller: controller.idHewanAnakC,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 label: Text(
//                   "Id Hewan Anak",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "Id Hewan Anak",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           )),
//           Obx(() =>Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
//               maxLines: 1,
//               controller: controller.idBatchStrawC,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 label: Text(
//                   "Id Batch",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "Id Batch",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           )),
//           Obx(() =>Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
//               maxLines: 1,
//               controller: controller.idPejantanStrawC,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 label: Text(
//                   "Id Pejantan",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "Id Pejantan",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           )),
//           Obx(() =>Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
//               maxLines: 1,
//               controller: controller.jenisKelaminAnakC,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 label: Text(
//                   "Jenis Kelamin Anak",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "Jenis Kelamin Anak",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           )),
//           Obx(() =>Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
//               maxLines: 1,
//               controller: controller.jumlahC,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 label: Text(
//                   "Jumlah",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "Jumlah",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           )),
//           Obx(() =>Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
//               maxLines: 1,
//               controller: controller.urutanIbC,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 label: Text(
//                   "Urutan IB",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "Urutan IB",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           )),
//           Obx(() =>Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
//               maxLines: 1,
//               controller: controller.kartuTernakAnakC,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 label: Text(
//                   "Kartu Ternak Anak",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "Kartu Ternak Anak",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           )),
//           Obx(() =>Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
//               maxLines: 1,
//               controller: controller.kartuTernakIndukC,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 label: Text(
//                   "kartu Ternak Induk",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "kartu Ternak Induk",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           )),
//           Obx(() =>Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
//               maxLines: 1,
//               controller: controller.kategoriC,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 label: Text(
//                   "Kategori",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "Kategori",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           )),
//           Obx(() =>Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
//               maxLines: 1,
//               controller: controller.lokasiC,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 label: Text(
//                   "Lokasi",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "Lokasi",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           )),
//           Obx(() =>Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
//               maxLines: 1,
//               controller: controller.idPeternakC,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 label: Text(
//                   "Id peternak",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "Id peternak",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           )),
//           Obx(() =>Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
//               maxLines: 1,
//               controller: controller.namaPeternakC,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 label: Text(
//                   "Nama Peternak",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "Nama Peternak",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           )),
//           Obx(() =>Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
//               maxLines: 1,
//               controller: controller.petugasPelaporC,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 label: Text(
//                   "Petugas Pelapor",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "Petugas Pelapor",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           )),
//           Obx(() =>Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
//               maxLines: 1,
//               controller: controller.produsenStrawC,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 label: Text(
//                   "Produsen",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "Produsen",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           )),
//           Obx(() =>Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
//               maxLines: 1,
//               controller: controller.spesiesIndukC,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 label: Text(
//                   "Spesies Induk",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "Spesies Induk",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           )),
//           Obx(() =>Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
//               maxLines: 1,
//               controller: controller.spesiesPejantanC,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 label: Text(
//                   "Spesies Pejantan",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "Spesies Pejantan",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           )),
//           Obx(() =>Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
//               maxLines: 1,
//               controller: controller.tanggalLahirC,
//               keyboardType: TextInputType.datetime,
//               decoration: InputDecoration(
//                 label: Text(
//                   "Tanggal Lahir",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "Tanggal Lahir",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           )),
//           Obx(() =>Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
//               maxLines: 1,
//               controller: controller.tanggalLaporanC,
//               keyboardType: TextInputType.datetime,
//               decoration: InputDecoration(
//                 label: Text(
//                   "Tanggal Laporan",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "Tanggal Laporan",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           )),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   Get.offAllNamed(Routes.EDITKELAHIRAN);
//                 },
//                 child: Text(
//                   'Edit post',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontFamily: 'poppins',
//                     color: Colors.white,
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: Size(120, 55),
//                   backgroundColor: Color(0xff132137),
//                   padding: EdgeInsets.symmetric(vertical: 18),
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 25,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   controller.deleteKelahiran();
//                 },
//                 child: Text(
//                   'Delete post',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontFamily: 'poppins',
//                     color: Colors.white,
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: Size(120, 55),
//                   backgroundColor: Color(0xff132137),
//                   padding: EdgeInsets.symmetric(vertical: 18),
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }