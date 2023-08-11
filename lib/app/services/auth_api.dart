import 'package:crud_flutter_api/app/utils/api.dart';
import 'package:crud_flutter_api/app/data/user_model.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/internetMessage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthApi extends SharedApi {
  // Login API
  Future<UserModel?> loginAPI(String email, String password) async {
    try {
      var jsonData;
      var data = await http.post(
        Uri.parse(baseUrl + "/auth" + "/signin"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'usernameOrEmail': email,
          'password': password,
        }),
      );
      stopLoading();
      print(data.statusCode);

      print(data.body);
      if (data.statusCode == 200) {
        jsonData = json.decode(data.body);

        if (jsonData != null) {
          jsonData['userSummary']['status'] = 200;
          jsonData['userSummary']['id'] = jsonData['id'];
          jsonData['userSummary']['username'] = jsonData['username'];
          jsonData['userSummary']['name'] = jsonData["name"];
          jsonData['userSummary']['role'] = jsonData["role"];
          jsonData['userSummary']['description'] = jsonData["description"];
          jsonData['userSummary']['avatar'] = jsonData["avatar"];
          jsonData['userSummary']['accessToken'] = jsonData["accessToken"];
          jsonData['userSummary']['tokenType'] = jsonData["tokenType"];

          print(jsonData);
          return UserModel.fromJson(jsonData['userSummary']);
        } else {
          showErrorMessage('Invalid response data');
          return UserModel.fromJson({"status": data.statusCode});
        }
      } else {
        jsonData = json.decode(data.body);
        showErrorMessage(jsonData['message']);
        return UserModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return UserModel.fromJson({"status": 404});
    }
  }

  // Check Token API
  Future<UserModel?> checkTokenApi(String token) async {
    try {
      var headers = {
        "Authorization": "Bearer " + token,
      };
      var jsonData;
      showLoading();
      var data = await http.get(Uri.parse(baseUrl + '/user' + '/me'),
          headers: headers);
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        jsonData['status'] = 200;
        jsonData['userSummary']['id'] = jsonData['id'];
        jsonData['userSummary']['username'] = jsonData['username'];
        jsonData['userSummary']['name'] = jsonData["name"];
        jsonData['userSummary']['role'] = jsonData["role"];
        jsonData['userSummary']['description'] = jsonData["description"];
        jsonData['userSummary']['avatar'] = jsonData["avatar"];
        jsonData['accessToken'] = token;
        jsonData['tokenType'] = "Bearer ";
        return UserModel.fromJson(jsonData);
      } else if (data.statusCode == 401) {
        showErrorMessage(jsonData['message']);
        return UserModel.fromJson({"status": data.statusCode});
      } else {
        showErrorMessage("Ada yang salah");
        return UserModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return UserModel.fromJson({"status": 404});
    }
  }

  // Login API
  Future<UserModel?> registerAPI(
      String name, String email, String password) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.post(
        Uri.parse(baseUrl + '/auth' + '/signup'),
        body: {'name': name, 'email': email, 'password': password},
      );
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        jsonData['data']['status'] = 200;
        jsonData['data']['access_token'] = jsonData['access_token'];
        jsonData['data']['token_type'] = jsonData['token_type'];
        return UserModel.fromJson(jsonData['data']);
      } else {
        showErrorMessage(jsonData['message']);
        return UserModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return UserModel.fromJson({"status": 404});
    }
  }
}
