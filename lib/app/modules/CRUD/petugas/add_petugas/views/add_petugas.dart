import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Import CupertinoAlertDialog

import 'package:get/get.dart';

import '../controllers/add_petugas_controller.dart';

class AddPetugasView extends GetView<AddPetugasController> {
  const AddPetugasView({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7EBE1),
      appBar: AppBar(
        title: Text(
          'Tambah Data Petugas',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
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
            controller: controller.nikC,
            label: 'NIK Petugas',
            hint: 'NIK Petugas',
          ),
          CustomInput(
            controller: controller.namaC,
            label: 'Nama petugas',
            hint: 'Nama petugas',
          ),
          CustomInput(
            controller: controller.notlpC,
            label: 'No Telepon',
            hint: 'No Telepon',
          ),
          CustomInput(
            controller: controller.emailC,
            label: 'Email',
            hint: 'Email',
          ),
          SizedBox(height: 32),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Obx(
              () => ElevatedButton(
                onPressed: () {
                  if (controller.isLoading.isFalse) {
                    if (controller.nikC.text.isEmpty) {
                      // Periksa NIK kosong
                      showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text("Peringatan"),
                            content: Text("NIK tidak boleh kosong."),
                            actions: [
                              CupertinoDialogAction(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else if (controller.namaC.text.isEmpty) {
                      // Periksa NIK kosong
                      showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text("Peringatan"),
                            content: Text("Nama tidak boleh kosong."),
                            actions: [
                              CupertinoDialogAction(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      controller.addPost();
                    }
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
