import 'dart:convert';

import 'package:crud_flutter_api/app/data/kandang_model.dart';
import 'package:crud_flutter_api/app/modules/menu/kandang/controllers/kandang_controller.dart';
import 'package:crud_flutter_api/app/services/kandang_api.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/successMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AddKandangController extends GetxController {
  KandangModel? kandangModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  final formattedDate = ''.obs; // Gunakan .obs untuk membuat Rx variabel
  final KandangController kandangController = Get.put(KandangController());
  XFile? selectedImage;
  RxString selcetedProvinsi = ''.obs;
  // List<String> provinsi = ["JAWA TIMUR", "JAWA BARAT"];
  RxList<String> provinsi = <String>[].obs;

  TextEditingController idKandangC = TextEditingController();
  TextEditingController idPeternakC = TextEditingController();
  TextEditingController namaPeternakC = TextEditingController();
  TextEditingController luasC = TextEditingController();
  TextEditingController kapasitasC = TextEditingController();
  TextEditingController nilaiBangunanC = TextEditingController();
  TextEditingController alamatC = TextEditingController();
  TextEditingController desaC = TextEditingController();
  TextEditingController kecamatanC = TextEditingController();
  TextEditingController kabupatenC = TextEditingController();
  // TextEditingController provinsiC = TextEditingController();

  @override
  onClose() {
    idKandangC.dispose();
    idPeternakC.dispose();
    namaPeternakC.dispose();
    luasC.dispose();
    kapasitasC.dispose();
    nilaiBangunanC.dispose();
    alamatC.dispose();
    desaC.dispose();
    kecamatanC.dispose();
    kabupatenC.dispose();
    // provinsiC.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    fetchProvinsiData();
  }

  void fetchProvinsiData() async {
    final response = await http.get(Uri.parse(
        'https://www.emsifa.com/api-wilayah-indonesia/api/provinces.json'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      provinsi.clear();
      data.forEach((province) {
        provinsi.add(province['name']);
      });
    } else {
      // Handle the error if the request fails
      print('Failed to fetch provinsi data');
    }
  }

  Future addKandang(BuildContext context) async {
    try {
      isLoading.value = true;
      kandangModel = await KandangApi().addKandangAPI(
        idKandangC.text,
        idPeternakC.text,
        namaPeternakC.text,
        luasC.text,
        kapasitasC.text,
        nilaiBangunanC.text,
        alamatC.text,
        desaC.text,
        kecamatanC.text,
        kabupatenC.text,
        selcetedProvinsi.value,
      );

      if (kandangModel != null) {
        if (kandangModel!.status == 201) {
          kandangController.reInitialize();
          Get.back();
          showSuccessMessage("Kandang Baru berhasil ditambahkan");
        } else {
          showErrorMessage(
              "Gagal menambahkan Kandang dengan status ${kandangModel?.status}");
        }
      }
    } catch (e) {
      showCupertinoDialog(
        context: context, // Gunakan context yang diberikan sebagai parameter.
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("Kesalahan"),
            content: Text(e.toString()),
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
    } finally {
      isLoading.value = false;
    }
  }
}
