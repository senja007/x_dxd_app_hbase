import 'package:crud_flutter_api/app/data/hewan_model.dart';
import 'package:crud_flutter_api/app/utils/api.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/internetMessage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../data/hewan_model.dart';

class HewanApi extends SharedApi {
  // Login API
  Future<HewanListModel> loadHewanAPI() async {
    try {
      var data = await http.get(Uri.parse(baseUrl + '/hewan'),
          headers: getToken());
      print("hasil" + data.statusCode.toString());
      print(json.decode(data.body));
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);

        print(jsonData['content']);

        return HewanListModel.fromJson(
            {"status": 200, "content": jsonData['content']});
      } else {
        return HewanListModel.fromJson(
            {"status": data.statusCode, "content": []});
      }
    } on Exception catch (_) {
      return HewanListModel.fromJson({"status": 404, "content": []});
    }
  }

  Future<HewanModel?> addHewanAPI(String eartag, String kartu, String nik, String idPeternak, String namaPeternak, 
  String provinsi, String kabupaten, String kecamatan, String desa, String identifikasi, String kelamin, String spesies, 
  String umur, String petugasPendaftar, String tanggalTerdaftar) async {
    try {
      var jsonData;
      showLoading();

      var bodyData = {
      'eartag': eartag, 'kartu': kartu, 'nik': nik, 'idPeternak': idPeternak, 'namaPeternak' : namaPeternak, 
      'provinsi' : provinsi, 'kabupaten' : kabupaten, 'kecamatan' : kecamatan, 'desa' : desa, 'identifikasi' : identifikasi, 
      'kelamin' : kelamin, 'spesies' : spesies, 'umur' : umur, 'petugasPendaftar' : petugasPendaftar, 'tanggalTerdaftar' : tanggalTerdaftar
      };
      var data = await http.post(
        Uri.parse(baseUrl + '/hewan'),
        headers: {...getToken() , 'Content-Type': 'application/json',},
        body: jsonEncode(bodyData),
      );
      stopLoading();
      jsonData = json.decode(data.body);
      print(data.body);
      print("apalah");
      if (data.statusCode == 200) {
        jsonData['statusCode'] = 200;
        print(HewanModel);
        print(jsonData);
        print(bodyData);
        return HewanModel.fromJson(jsonData);
      } else {
        showErrorMessage(jsonData['message']);
        return null; //InseminasiModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return HewanModel.fromJson({"status": 404});
    }
  }

  Future<HewanModel?> editHewanAPI(
      String title, String content, String id) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.put(
        Uri.parse(baseUrl + '/hewan/' + id.toString()),
        headers: getToken(),
        body: {'content': content, 'status': "1"},
      );
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        jsonData['statusCode'] = 200;
        return HewanModel.fromJson(jsonData);
      } else {
        showErrorMessage(jsonData['message']);
        return HewanModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return HewanModel.fromJson({"status": 404});
    }
  }

  Future<HewanModel?> deleteInseminasiAPI(String id) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.delete(
        Uri.parse(baseUrl + '/hewan/' + id.toString()),
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
        return HewanModel.fromJson(postData);
      } else {
        showErrorMessage(jsonData['message']);
        return HewanModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return HewanModel.fromJson({"status": 404});
    }
  }
}
