import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
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
    print("walo");
  }

  Future addPetugas() async {
    try {
      isLoading.value = true;
      petugasModel = await PetugasApi().addPetugasApi(nikC.text, namaC.text, notlpC.text, emailC.text);

      if (petugasModel != null) {
        if (petugasModel!.status == 200) {
          Get.offNamed(Routes.HOME); // Menggunakan Get.offNamed
        } else if (petugasModel!.status == 404) {
          // Handle status 404
        }
      }
    } catch (e) {
      // Handle exceptions here
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
