import 'dart:io';

import 'package:crud_flutter_api/app/data/hewan_model.dart';
import 'package:crud_flutter_api/app/data/peternak_model.dart';
import 'package:crud_flutter_api/app/modules/menu/hewan/controllers/hewan_controller.dart';
import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:dropdown_search/dropdown_search.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/add_hewan_controller.dart';

class AddHewanView extends GetView<AddHewanController> {
  // const AddHewanView({Key? key}) : super(key: key);
  // String selected;

  Widget build(BuildContext context) {
    var selectedGender;
    return Scaffold(
      backgroundColor: Color(0xffF7EBE1),
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
              controller: controller.kodeEartagNasionalC,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text(
                  "Kode Eartag Nasional",
                  style: TextStyle(
                    color: AppColor.secondarySoft,
                    fontSize: 14,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: InputBorder.none,
                hintText: "Kode Eartag Nasional",
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
              controller: controller.noKartuTernakC,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text(
                  "Nomor Kartu Ternak",
                  style: TextStyle(
                    color: AppColor.secondarySoft,
                    fontSize: 14,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: InputBorder.none,
                hintText: "Nomor Kartu Ternak",
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
                border:
                    Border.all(width: 1, color: AppColor.secondaryExtraSoft),
              ),
              child: Obx(() {
                return DropdownButton<String>(
                  value: controller.selectedPeternakId.value,
                  items: controller.peternakList.map((PeternakModel peternak) {
                    return DropdownMenuItem<String>(
                      value: peternak.idPeternak ?? '',
                      child: Text(peternak.namaPeternak ?? ''),
                    );
                  }).toList(),
                  onChanged: (String? selectedId) {
                    controller.selectedPeternakId.value = selectedId ?? '';
                  },
                  hint: Text('Pilih Peternak'),
                );
              })),
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
            child: DropdownMenu<String>(
              inputDecorationTheme:
                  InputDecorationTheme(filled: false, iconColor: Colors.amber),
              initialSelection: controller.genders.first,
              onSelected: (String? value) {
                // This is called when the user selects an item.
                controller.selectedGender.value = value!;
              },
              dropdownMenuEntries: controller.genders
                  .map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
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
              controller: controller.umurC,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                label: Text(
                  "Umur ",
                  style: TextStyle(
                    color: AppColor.secondarySoft,
                    fontSize: 14,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: InputBorder.none,
                hintText: "Umur ",
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
              controller: controller.identifikasiHewanC,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text(
                  "Identifikasi Hewan",
                  style: TextStyle(
                    color: AppColor.secondarySoft,
                    fontSize: 14,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: InputBorder.none,
                hintText: "Identifikasi Hewan",
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
              controller: controller
                  .tanggalTerdaftarC, //editing controller of this TextField
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.calendar_today), //icon of text field
                  labelText: "Tanggal Terdaftar" //label text of field
                  ),
              readOnly:
                  true, //set it true, so that user will not able to edit text
              onTap: () => controller.tanggalTerdaftar(context),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await controller.pickImage();
                    },
                    child: Text('Pilih Gambar'),
                  ),
                  if (controller.fotoHewan.value != null)
                    Image.file(
                      controller.fotoHewan.value ??
                          File('null'), //path/to/default/image.jpg
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Titik Kordinat",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                              await controller.getAddressFromLongLat(position);
                            } catch (e) {
                              // Handle error jika terjadi kesalahan
                              print('Error in onPressed: $e');
                              controller.loading.value =
                                  false; // Pastikan status loading diubah kembali jika terjadi kesalahan
                            }
                          },
                          child: controller.loading.value
                              ? const Center(child: CircularProgressIndicator())
                              : const Text('Tagging Lokasi')),
                ],
              ),
            ),
          ),
          SizedBox(height: 32),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Obx(
              () => ElevatedButton(
                onPressed: () async {
                  if (!controller.isLoading.isTrue) {
                    await controller
                        .updateAlamatInfo(); // Memanggil updateAlamatInfo
                    await controller.addHewan(context); // Memanggil addHewan
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

class Gender {
  int? id;
  String? sex;

  Gender({this.id, this.sex});
}


