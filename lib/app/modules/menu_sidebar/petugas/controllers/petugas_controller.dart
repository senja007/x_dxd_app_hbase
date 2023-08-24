import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:crud_flutter_api/app/data/post_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:crud_flutter_api/app/services/post_api.dart';
import 'package:http/http.dart';

class PetugasController extends GetxController {
  PostListModel? posts;
  final box = GetStorage();
  bool homeScreen = false;

  @override
  void onInit() {
    super.onInit();
    loadPost();
  }

  loadPost() async {
    homeScreen = false;
    update();
    showLoading();
    posts = await PostApi().loadPostAPI();
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
}
