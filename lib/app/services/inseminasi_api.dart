import 'package:crud_flutter_api/app/utils/api.dart';
import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/internetMessage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../data/inseminasi_model.dart';

class PostApi extends SharedApi {
  // Login API
  Future<InseminasiListModel> loadPostAPI() async {
    try {
      var data = await http.get(Uri.parse(baseUrl + '/inseminasi'),
          headers: getToken());
      print("hasil" + data.statusCode.toString());
      print(json.decode(data.body));
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);

        print(jsonData['content']);

        return InseminasiListModel.fromJson(
            {"status": 200, "content": jsonData['content']});
      } else {
        return InseminasiListModel.fromJson(
            {"status": data.statusCode, "content": []});
      }
    } on Exception catch (_) {
      return InseminasiListModel.fromJson({"status": 404, "content": []});
    }
  }

  Future<InseminasiModel?> addPostAPI(String content, String text) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.post(
        Uri.parse(baseUrl + '/inseminasi'),
        headers: getToken(),
        body: {'content': content, 'status': "1"},
      );
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        jsonData['statusCode'] = 200;
        return InseminasiModel.fromJson(jsonData);
      } else {
        showErrorMessage(jsonData['message']);
        return InseminasiModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return InseminasiModel.fromJson({"status": 404});
    }
  }

  Future<InseminasiModel?> editPostAPI(
      String title, String content, String id) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.put(
        Uri.parse(baseUrl + '/inseminasi/' + id.toString()),
        headers: getToken(),
        body: {'content': content, 'status': "1"},
      );
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        jsonData['statusCode'] = 200;
        return InseminasiModel.fromJson(jsonData);
      } else {
        showErrorMessage(jsonData['message']);
        return InseminasiModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return InseminasiModel.fromJson({"status": 404});
    }
  }

  Future<InseminasiModel?> deletePostAPI(String id) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.delete(
        Uri.parse(baseUrl + '/inseminasi/' + id.toString()),
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
        // Kirim variabel postData ke dalam fungsi InseminasiModel.fromJson
        return InseminasiModel.fromJson(postData);
      } else {
        showErrorMessage(jsonData['message']);
        return InseminasiModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return InseminasiModel.fromJson({"status": 404});
    }
  }
}
