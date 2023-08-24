import 'package:crud_flutter_api/app/utils/api.dart';
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
      var data = await http.get(Uri.parse(baseUrl + '/pengobatan'),
          headers: getToken());
      print("hasil" + data.statusCode.toString());
      print(json.decode(data.body));
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);

        print(jsonData['content']);

        return PostListModel.fromJson(
            {"status": 200, "content": jsonData['content']});
      } else {
        return PostListModel.fromJson(
            {"status": data.statusCode, "content": []});
      }
    } on Exception catch (_) {
      return PostListModel.fromJson({"status": 404, "content": []});
    }
  }

  Future<PostModel?> addPostAPI(String content, String text) async {
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
        return PostModel.fromJson(jsonData);
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
        Uri.parse(baseUrl + '/pengobatan/' + id.toString()),
        headers: getToken(),
        body: {'content': content, 'status': "1"},
      );
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        jsonData['statusCode'] = 200;
        return PostModel.fromJson(jsonData);
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
