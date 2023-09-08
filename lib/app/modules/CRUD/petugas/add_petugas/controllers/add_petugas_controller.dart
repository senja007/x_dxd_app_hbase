import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddPetugasController extends GetxController {
  PetugasModel? petugasModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  TextEditingController nikC = TextEditingController();
  TextEditingController namaC = TextEditingController();
  TextEditingController notlpC = TextEditingController();
  TextEditingController emailC = TextEditingController();

  @override
  onClose() {
    nikC.dispose();
    namaC.dispose();
    notlpC.dispose();
    emailC.dispose();
  }

  Future addPetugas(BuildContext context) async {
    try {
      isLoading.value = true;

      if (nikC.text.isEmpty) {
        throw "NIK tidak boleh kosong.";
      }

      if (namaC.text.isEmpty) {
        throw "Nama tidak boleh kosong.";
      }

      petugasModel = await PetugasApi()
          .addPetugasApi(nikC.text, namaC.text, notlpC.text, emailC.text);

      // if (petugasModel != null) {
      //   if (petugasModel?.status == 200) {
      //     // Petugas berhasil ditambahkan, tambahkan logika tambahan di sini jika diperlukan.
      //   } else if (petugasModel?.status == 404) {
      //     throw "Gagal menambahkan petugas: Data tidak ditemukan.";
      //   } else {
      //     throw "Gagal menambahkan petugas dengan status ${petugasModel?.status}";
      //   }
      // }
    } catch (e) {
      // Tangani error di sini
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


















// import 'package:crud_flutter_api/app/data/petugas_model.dart';
// import 'package:crud_flutter_api/app/routes/app_pages.dart';
// import 'package:crud_flutter_api/app/services/petugas_api.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

// class AddPetugasController extends GetxController {
//   PetugasModel? petugasModel;
//   RxBool isLoading = false.obs;
//   RxBool isLoadingCreateTodo = false.obs;
//   TextEditingController nikC = TextEditingController();
//   TextEditingController namaC = TextEditingController();
//   TextEditingController notlpC = TextEditingController();
//   TextEditingController emailC = TextEditingController();

//   @override
//   onClose() {
//     nikC.dispose();
//     namaC.dispose();
//     notlpC.dispose();
//     emailC.dispose();
//   }

//   Future addPost() async {
//     update();
//     petugasModel = await PetugasApi().addPetugasApi(nikC.text, namaC.text);
//     if (petugasModel!.status == 200) {
//       update();
//       Get.offAndToNamed(Routes.HOME); //ganti route sesuai data menu
//     } else if (petugasModel!.status == 404) {
//       update();
//     }
//   }


// }
