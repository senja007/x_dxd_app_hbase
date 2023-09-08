import 'package:crud_flutter_api/app/data/pengobatan_model.dart';
import 'package:crud_flutter_api/app/services/pengobatan_api..dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PengobatanController extends GetxController {
  PengobatanListModel? posts;
  final box = GetStorage();
  bool homeScreen = false;

  @override
  void onInit() {
    super.onInit();
    loadPengobatan();
  }

  loadPengobatan() async {
    homeScreen = false;
    update();
    showLoading();
    posts = await PengobatanApi().loadPengobatanAPI();
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
}
