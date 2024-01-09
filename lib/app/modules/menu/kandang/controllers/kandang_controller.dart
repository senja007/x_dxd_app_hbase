import 'package:crud_flutter_api/app/data/kandang_model.dart';
import 'package:crud_flutter_api/app/services/kandang_api.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class KandangController extends GetxController {
  var posts = KandangListModel().obs;
  final box = GetStorage();
  bool homeScreen = false;

  RxList<KandangModel> filteredPosts = RxList<KandangModel>();

  @override
  void onInit() {
    super.onInit();
    loadKandang();
  }

  void reInitialize() {
    onInit();
  }

  loadKandang() async {
    homeScreen = false;
    update();
    showLoading();
    posts.value = await KandangApi().loadKandangApi();
    update();
    stopLoading();
    if (posts.value.status == 200) {
      final List<KandangModel> filteredList = posts.value.content!.toList();

      filteredPosts.assignAll(filteredList);
      homeScreen = true;
      update();
    } else if (posts.value.status == 204) {
      print("Empty");
    } else if (posts.value.status == 404) {
      homeScreen = true;
      update();
    } else if (posts.value.status == 401) {
    } else {
      print("someting wrong 400");
    }
  }

  void searchKandang(String keyword) {
    final List<KandangModel> filteredList =
        posts.value.content!.where((kandang) {
      return kandang.idKandang!.toLowerCase().contains(keyword.toLowerCase());
    }).toList();

    filteredPosts.assignAll(filteredList);
  }
}
