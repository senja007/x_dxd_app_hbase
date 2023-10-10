import 'package:crud_flutter_api/app/data/kandang_model.dart';
import 'package:crud_flutter_api/app/services/kandang_api.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class KandangController extends GetxController {
  KandangListModel? posts;
  final box = GetStorage();
  bool homeScreen = false;

  @override
  void onInit() {
    super.onInit();
    loadKandang();
  }

  void reInitialize() {
    onInit();
  }

  Future<void> refreshKandang() async {
    posts = await KandangApi().loadKandangApi();
    update();
    print("refresh");
  }

  loadKandang() async {
    homeScreen = false;
    update();
    showLoading();
    posts = await KandangApi().loadKandangApi();
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
