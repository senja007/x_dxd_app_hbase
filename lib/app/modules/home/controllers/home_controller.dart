import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_alert_dialog.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';

class HomeController extends GetxController {
  PetugasListModel? posts;
  final box = GetStorage();
  bool homeScreen = false;
  loadPost() async {
    homeScreen = false;
    update();
    showLoading();
    posts = await PetugasApi().loadPetugasApi();
    update();
    stopLoading();
    if (posts?.status == 200) {
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
