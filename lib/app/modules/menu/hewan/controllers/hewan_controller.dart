import 'dart:convert';
import 'package:crud_flutter_api/app/data/hewan_model.dart';
import 'package:crud_flutter_api/app/services/hewan_api.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class HewanController extends GetxController {
  HewanListModel? posts;
  final box = GetStorage();
  bool homeScreen = false;

  var hewan = <HewanModel>[].obs; // Daftar item dari API
  var filteredHewan = <HewanModel>[].obs; // Daftar item yang telah difilter
  var searchQuery = ''.obs; // Query pencarian

  @override
  void onInit() {
    //fetchHewan(); // Panggil fungsi untuk mengambil data dari API saat inisialisasi
    loadHewan();
    super.onInit();
  }

  void reInitialize() {
    onInit();
  }

  loadHewan() async {
    homeScreen = false;
    update();
    showLoading();
    posts = await HewanApi().loadHewanApi();
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

  // void fetchHewan() async {
  //   final response = await http.get(Uri.parse('URL_API_ANDA'));
  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body) as List;
  //     hewan.assignAll(data.map((e) => HewanModel.fromJson(e)));
  //     filterHewan();
  //   }
  // }

  // void filterHewan() {
  //   filteredHewan.assignAll(hewan.where((hewan) {
  //     final nokartu = hewan.noKartuTernak?.toLowerCase();
  //     final query = searchQuery.value.toLowerCase();
  //     return nokartu!.contains(query);
  //   }));
  // }
}
