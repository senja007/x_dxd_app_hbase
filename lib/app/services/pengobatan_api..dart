import 'package:crud_flutter_api/app/utils/api.dart';
import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/internetMessage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../data/pengobatan_model.dart';

class PengobatanApi extends SharedApi {
  // Login API
  Future<PengobatanListModel> loadPengobatanAPI() async {
    try {
      var data = await http.get(Uri.parse(baseUrl + '/pengobatan'),
          headers: getToken());
      print("hasil" + data.statusCode.toString());
      print(json.decode(data.body));
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);

        print(jsonData['content']);

        return PengobatanListModel.fromJson(
            {"status": 200, "content": jsonData['content']});
      } else {
        return PengobatanListModel.fromJson(
            {"status": data.statusCode, "content": []});
      }
    } on Exception catch (_) {
      return PengobatanListModel.fromJson({"status": 404, "content": []});
    }
  }

  Future<PengobatanModel?> addPengobatanAPI(String content, String text) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.post(
        Uri.parse(baseUrl + '/pengobatan'),
        headers: getToken(),
        body: {'content': content, 'status': "1"},
      );
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        jsonData['statusCode'] = 200;
        return PengobatanModel.fromJson(jsonData);
      } else {
        showErrorMessage(jsonData['message']);
        return PengobatanModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return PengobatanModel.fromJson({"status": 404});
    }
  }

  Future<PengobatanModel?> editPengobatanAPI(
      String title, String content, String id) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.put(
        Uri.parse(baseUrl + '/pengobatan/' + id.toString()),
        headers: getToken(),
        body: {'content': content, 'status': "1"},
      );
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        jsonData['statusCode'] = 200;
        return PengobatanModel.fromJson(jsonData);
      } else {
        showErrorMessage(jsonData['message']);
        return PengobatanModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return PengobatanModel.fromJson({"status": 404});
    }
  }

  Future<PengobatanModel?> deletePengobatanAPI(String id) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.delete(
        Uri.parse(baseUrl + '/pengobatan/' + id.toString()),
        headers: getToken(),
      );
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        // Simpan nilai jsonData['data'] dalam variabel baru
        var postData = <String, dynamic>{};
        postData["statusCode"] = 200;
        postData["status"] = 1;
        postData['id'] = 0;

        postData['content'] = "";

        print(postData);
        // Kirim variabel postData ke dalam fungsi PengobatanModel.fromJson
        return PengobatanModel.fromJson(postData);
      } else {
        showErrorMessage(jsonData['message']);
        return PengobatanModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return PengobatanModel.fromJson({"status": 404});
    }
  }
}
