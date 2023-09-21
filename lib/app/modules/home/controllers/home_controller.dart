import 'package:crud_flutter_api/app/data/hewan_model.dart';
import 'package:crud_flutter_api/app/data/peternak_model.dart';
import 'package:crud_flutter_api/app/services/hewan_api.dart';
import 'package:crud_flutter_api/app/services/peternak_api.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_alert_dialog.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';

class HomeController extends GetxController {
  PetugasListModel? posts;
  HewanListModel? posts1;
  PeternakListModel? posts2;
  final box = GetStorage();
  bool homeScreen = false;

   HomeController() {
    // Panggil loadPetugasData saat HomeController dibuat
    loadPetugasData();
    loadHewanData();
    loadPeternakData();
  }

  loadPetugasData() async {
    homeScreen = false;
    update();
    showLoading();
    posts = await PetugasApi().loadPetugasApi();
    update();
    stopLoading();
    if (posts?.status == 200) {
      if (posts!.content!.isEmpty) {
        homeScreen = true;
        update();
      }
    } else if (posts!.status == 204) {
      print("Empty");
    } else if (posts!.status == 404) {
      homeScreen = true;
      update();
    } else if (posts!.status == 401) {
    } else {
      print("someting wrong 400");
    }
  }

  loadHewanData() async {
    homeScreen = false;
    update();
    showLoading();
    posts1 = await HewanApi().loadHewanApi();
    update();
    stopLoading();
    if (posts1?.status == 200) {
      if (posts1!.content!.isEmpty) {
        homeScreen = true;
        update();
      }
    } else if (posts1!.status == 204) {
      print("Empty");
    } else if (posts1!.status == 404) {
      homeScreen = true;
      update();
    } else if (posts1!.status == 401) {
    } else {
      print("someting wrong 400");
    }
  }

  loadPeternakData() async {
    homeScreen = false;
    update();
    showLoading();
    posts2 = await PeternakApi().loadPeternakApi();
    update();
    stopLoading();
    if (posts2?.status == 200) {
      if (posts2!.content!.isEmpty) {
        homeScreen = true;
        update();
      }
    } else if (posts2!.status == 204) {
      print("Empty");
    } else if (posts2!.status == 404) {
      homeScreen = true;
      update();
    } else if (posts2!.status == 401) {
    } else {
      print("someting wrong 400");
    }
  }

  logout() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Logout System",
      message: "Apakah anda yakin akan logout dari sistem ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back(); // close modal
        Get.back(); // back page
        try {
          box.remove("token");
          box.remove("name");
          box.remove("email");
          update();
          await Get.offAllNamed(Routes.LOGIN);
        } catch (e) {}
      },
    );
  }
}
