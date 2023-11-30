import 'package:crud_flutter_api/app/data/peternak_model.dart';
import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';

import '../controllers/detail_hewan_controller.dart';

class DetailHewanView extends GetView<DetailHewanController> {
  const DetailHewanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        title: Text(
          'Detail Hewan',
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
                  controller: controller.kodeEartagNasionalC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Kode Eartag Nasional",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Kode Eartag Nasional",
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
                  controller: controller.noKartuTernakC,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text(
                      "No Kartu Ternak",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "No Kartu Ternak",
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
                  controller: controller.provinsiC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Provinsi",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Provinsi",
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
                  controller: controller.kabupatenC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Kabupaten",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Kabupaten",
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
                  controller: controller.kecamatanC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Kecamatan",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Kecamatan",
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
                  controller: controller.desaC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Desa",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Desa",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          // Obx(() => Container(
          //       width: MediaQuery.of(context).size.width,
          //       padding: EdgeInsets.only(left: 14, right: 14, top: 4),
          //       margin: EdgeInsets.only(bottom: 16),
          //       decoration: BoxDecoration(
          //         color: controller.isEditing.value
          //             ? Colors.white
          //             : Colors.grey[200],
          //         borderRadius: BorderRadius.circular(8),
          //         border:
          //             Border.all(width: 1, color: AppColor.secondaryExtraSoft),
          //       ),
          //       child: GestureDetector(
          //         onTap: () {
          //           print("${controller.selectedPeternakId.value}");
          //         },
          //         child: controller.isEditing.value
          //             ? DropdownButton<String>(
          //                 value: controller.selectedPeternakId.value,
          //                 items: controller.peternakList
          //                     .map((PeternakModel peternak) {
          //                   return DropdownMenuItem<String>(
          //                     value: peternak.idPeternak ?? '',
          //                     child: Text(peternak.namaPeternak ?? ''),
          //                   );
          //                 }).toList(),
          //                 onChanged: (String? selectedId) {
          //                   // Update selectedPeternakId
          //                   controller.selectedPeternakId.value =
          //                       selectedId ?? '';

          //                   // Update nikPeternakC and namaPeternakC based on selectedPeternakId
          //                   PeternakModel selectedPeternak =
          //                       controller.peternakList.firstWhere(
          //                     (peternak) => peternak.idPeternak == selectedId,
          //                     orElse: () =>
          //                         PeternakModel(), // Default value if not found
          //                   );

          //                   controller.nikPeternakC.text =
          //                       selectedPeternak.nikPeternak ?? '';
          //                   controller.namaPeternakC.text =
          //                       selectedPeternak.namaPeternak ?? '';
          //                 },
          //                 hint: Text('Pilih Peternak'),
          //               )
          //             : TextField(
          //                 controller: controller.idPeternakC,
          //                 decoration: InputDecoration(
          //                   labelText: 'ID Peternak',
          //                   border: InputBorder.none,
          //                 ),
          //                 readOnly: true,
          //               ),
          //       ),
          //     )),
          // Obx(() => Container(
          //       width: MediaQuery.of(context).size.width,
          //       padding: EdgeInsets.only(left: 14, right: 14, top: 4),
          //       margin: EdgeInsets.only(bottom: 16),
          //       decoration: BoxDecoration(
          //         color: controller.isEditing.value
          //             ? Colors.white
          //             : Colors.grey[200],
          //         borderRadius: BorderRadius.circular(8),
          //         border:
          //             Border.all(width: 1, color: AppColor.secondaryExtraSoft),
          //       ),
          //       child: TextFormField(
          //         enabled: false,
          //         style: TextStyle(
          //           fontSize: 18,
          //           fontFamily: 'poppins',
          //           color: Colors.black,
          //         ),
          //         maxLines: 1,
          //         controller: controller.nikPeternakC,
          //         keyboardType: TextInputType.number,
          //         decoration: InputDecoration(
          //           label: Text(
          //             "Nik Peternak",
          //             style: TextStyle(
          //               color: AppColor.secondarySoft,
          //               fontSize: 15,
          //             ),
          //           ),
          //           floatingLabelBehavior: FloatingLabelBehavior.always,
          //           border: InputBorder.none,
          //           hintText: "Nik Peternak",
          //           hintStyle: TextStyle(
          //             fontSize: 15,
          //             fontFamily: 'poppins',
          //             fontWeight: FontWeight.w500,
          //             color: AppColor.secondarySoft,
          //           ),
          //         ),
          //       ),
          //     )),
          // Obx(() => Container(
          //       width: MediaQuery.of(context).size.width,
          //       padding: EdgeInsets.only(left: 14, right: 14, top: 4),
          //       margin: EdgeInsets.only(bottom: 16),
          //       decoration: BoxDecoration(
          //         color: controller.isEditing.value
          //             ? Colors.white
          //             : Colors.grey[200],
          //         borderRadius: BorderRadius.circular(8),
          //         border:
          //             Border.all(width: 1, color: AppColor.secondaryExtraSoft),
          //       ),
          //       child: TextFormField(
          //         enabled: false,
          //         style: TextStyle(
          //           fontSize: 18,
          //           fontFamily: 'poppins',
          //           color: Colors.black,
          //         ),
          //         maxLines: 1,
          //         controller: controller.namaPeternakC,
          //         keyboardType: TextInputType.number,
          //         decoration: InputDecoration(
          //           label: Text(
          //             "Nama Peternak",
          //             style: TextStyle(
          //               color: AppColor.secondarySoft,
          //               fontSize: 15,
          //             ),
          //           ),
          //           floatingLabelBehavior: FloatingLabelBehavior.always,
          //           border: InputBorder.none,
          //           hintText: "Nama Peternak",
          //           hintStyle: TextStyle(
          //             fontSize: 15,
          //             fontFamily: 'poppins',
          //             fontWeight: FontWeight.w500,
          //             color: AppColor.secondarySoft,
          //           ),
          //         ),
          //       ),
          //     )),

          Obx(
            () => Container(
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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: Text(
                          "Id Peternak",
                          style: TextStyle(
                            color: AppColor.secondarySoft,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("${controller.selectedPeternakId.value}");
                        },
                        child: controller.isEditing.value
                            ? DropdownButton<String>(
                                value: controller.selectedPeternakId.value,
                                items: controller.peternakList
                                    .map((PeternakModel peternak) {
                                  return DropdownMenuItem<String>(
                                    value: peternak.idPeternak ?? '',
                                    child: Text(peternak.idPeternak ?? ''),
                                  );
                                }).toList(),
                                onChanged: (String? selectedId) {
                                  // Update selectedPeternakId
                                  controller.selectedPeternakId.value =
                                      selectedId ?? '';

                                  // Update nikPeternakC and namaPeternakC based on selectedPeternakId
                                  PeternakModel selectedPeternak =
                                      controller.peternakList.firstWhere(
                                    (peternak) =>
                                        peternak.idPeternak == selectedId,
                                    orElse: () =>
                                        PeternakModel(), // Default value if not found
                                  );

                                  controller.nikPeternakC.text =
                                      selectedPeternak.nikPeternak ?? '';
                                  controller.namaPeternakC.text =
                                      selectedPeternak.namaPeternak ?? '';
                                },
                                hint: Text('Pilih Peternak'),
                              )
                            : TextField(
                                controller: controller.idPeternakC,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'poppins',
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  // labelText: 'ID Peternak',
                                  border: InputBorder.none,
                                ),
                                readOnly: true,
                              ),
                      ),
                    ])),
          ),
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
                    fontSize: 18,
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  controller: controller.nikPeternakC,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text(
                      "Nik Peternak",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Nik Peternak",
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
                  controller: controller.namaPeternakC,
                  keyboardType: TextInputType.number,
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
                  controller: controller.spesiesC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Spesies",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Spesies",
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
                  controller: controller.sexC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Sex",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Sex",
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
                  controller: controller.umurC,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text(
                      "Umur",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Umur",
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
                  controller: controller.identifikasiHewanC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Identifikasi Hewan",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Identifikasi Hewan",
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
                  controller: controller.petugasPendaftarC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      "Petugas Pendaftar",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Petugas Pendaftar",
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
                  controller: controller.tanggalTerdaftarC,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    label: Text(
                      "Tanggal",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 15,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Tanggal",
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
              child: Image.network(
                '${controller.sharedApi.imageUrl}${controller.argsData["foto_hewan_detail"]}',
                fit: BoxFit.fill,
              ))),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Obx(
              () => Visibility(
                visible: controller.isEditing.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Titik Kordinat",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      child: Text(controller.strLatLong.value),
                      onLongPress: () {
                        Clipboard.setData(
                            ClipboardData(text: controller.strLatLong.value));
                        final snackBar = SnackBar(
                          content: const Text("LatLong berhasil disalin!"),
                          backgroundColor: Colors.green,
                          action: SnackBarAction(
                            textColor: Colors.white,
                            label: "tutup",
                            onPressed: () {},
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "alamat",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: GestureDetector(
                        child: Text(controller.strAlamat.value),
                        onLongPress: () {
                          Clipboard.setData(
                              ClipboardData(text: controller.strAlamat.value));
                          final snackBar = SnackBar(
                            content: const Text("Alamat Berhasil Disalin!"),
                            backgroundColor: (Colors.green),
                            action: SnackBarAction(
                              textColor: Colors.white,
                              label: "Tutup",
                              onPressed: () {},
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    controller.loading.value
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  side: const BorderSide(color: Colors.green),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              try {
                                // Mengubah status loading menjadi true untuk menunjukkan bahwa proses sedang berlangsung
                                controller.loading.value = true;

                                // Mendapatkan posisi geolokasi
                                Position position =
                                    await controller.getGeoLocationPosition();

                                // Mengubah status loading menjadi false setelah mendapatkan posisi
                                controller.loading.value = false;

                                // Memperbarui nilai strLatLong dengan koordinat yang didapatkan
                                controller.strLatLong.value =
                                    '${position.latitude}, ${position.longitude}';

                                // Mendapatkan alamat dari koordinat
                                await controller
                                    .getAddressFromLongLat(position);
                              } catch (e) {
                                // Handle error jika terjadi kesalahan
                                print('Error in onPressed: $e');
                                controller.loading.value =
                                    false; // Pastikan status loading diubah kembali jika terjadi kesalahan
                              }
                            },
                            child: controller.loading.value
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : const Text('Tagging Lokasi')),
                  ],
                ),
              ),
            ),
          ),
//AND DELETE
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (controller.isEditing.value)
                  ElevatedButton(
                    onPressed: () {
                      controller.editHewan();
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
                      controller.deleteHewan();
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
