import 'dart:io';

import 'package:crud_flutter_api/app/utils/api.dart';
import 'package:crud_flutter_api/app/data/user_model.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/internetMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/successMessage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthApi extends SharedApi {
  Future<UserModel?> loginAPI(String email, String password) async {
    try {
      var jsonData;
      var data = await http.post(
        Uri.parse("$baseUrl/auth/signin"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'usernameOrEmail': email,
          'password': password,
        }),
      );

      jsonData = json.decode(data.body);
      print('Response from loginAPI: $jsonData');

      print(data.body);
      if (data.statusCode == 200) {
        jsonData['status'] = 200;
        showSuccessMessage("login sukses");
        return UserModel.fromJson(jsonData);
      } else if (data.statusCode == 400) {
        showErrorMessage('Username dan Password Harus DiIsi');
        return UserModel.fromJson({"status": data.statusCode});
      } else if (data.statusCode == 401) {
        showErrorMessage(jsonData['message']);
        return UserModel.fromJson({"status": data.statusCode});
      } else {
        showErrorMessage("Ada yang salah");
        return UserModel.fromJson({"status": data.statusCode});
      }
    } on SocketException catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return UserModel.fromJson({"status": 404});
    } on Exception catch (e) {
      print("Exception: $e");
      showErrorMessage("Username / Password Salah");
      return UserModel.fromJson({"status": 500});
    }
  }

  // Check Token API
  Future<UserModel?> checkTokenApi(String token) async {
    try {
      var headers = {
        "Authorization": "Bearer $token",
      };
      var jsonData;
      showLoading();
      var data =
          await http.get(Uri.parse('$baseUrl/user/me'), headers: headers);
      stopLoading();
      jsonData = json.decode(data.body);
      print(data.body);
      if (data.statusCode == 200) {
        jsonData['status'] = '200';
        jsonData['accessToken'] = token;
        jsonData['tokenType'] = "Bearer ";
        print(jsonData);
        print(data.body);
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
        Uri.parse('$baseUrl/auth/signup'),
        body: {'name': name, 'email': email, 'password': password},
      );
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        print(jsonData['data']);
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
