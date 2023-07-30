import 'package:crud_flutter_api/app/utils/api.dart';
import 'package:crud_flutter_api/app/data/user_model.dart';
import 'package:crud_flutter_api/app/data/post_model.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/internetMessage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostApi extends SharedApi {
  // Login API
  Future<PostListModel> loadPostAPI() async {
    try {
      var data =
          await http.get(Uri.parse(baseUrl + 'posts'), headers: getToken());
      print("hasil" + data.statusCode.toString());
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);
        return PostListModel.fromJson(
            {"status": 200, "items": jsonData['data']});
      } else {
        return PostListModel.fromJson({"status": data.statusCode, "items": []});
      }
    } on Exception catch (_) {
      return PostListModel.fromJson({"status": 404, "items": []});
    }
  }

  Future<PostModel?> addPostAPI(String title, String content) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.post(
        Uri.parse(baseUrl + 'posts'),
        headers: getToken(),
        body: {'title': title, 'content': content, 'status': "1"},
      );
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        jsonData['data']['status_code'] = 200;
        return PostModel.fromJson(jsonData['data']);
      } else {
        showErrorMessage(jsonData['message']);
        return PostModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return PostModel.fromJson({"status": 404});
    }
  }

  Future<PostModel?> editPostAPI(
      String title, String content, String id) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.put(
        Uri.parse(baseUrl + 'posts/' + id.toString()),
        headers: getToken(),
        body: {'title': title, 'content': content, 'status': "1"},
      );
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        jsonData['data']['status_code'] = 200;
        return PostModel.fromJson(jsonData['data']);
      } else {
        showErrorMessage(jsonData['message']);
        return PostModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return PostModel.fromJson({"status": 404});
    }
  }

  Future<PostModel?> deletePostAPI(String id) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.delete(
        Uri.parse(baseUrl + 'posts/' + id.toString()),
        headers: getToken(),
      );
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        // Simpan nilai jsonData['data'] dalam variabel baru
        var postData = <String, dynamic>{};
        postData["status_code"] = 200;
        postData["status"] = 1;
        postData['id'] = 0;
        postData['title'] = "";
        postData['content'] = "";
        postData['slug'] = "";
        print(postData);
        // Kirim variabel postData ke dalam fungsi PostModel.fromJson
        return PostModel.fromJson(postData);
      } else {
        showErrorMessage(jsonData['message']);
        return PostModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return PostModel.fromJson({"status": 404});
    }
  }
}
