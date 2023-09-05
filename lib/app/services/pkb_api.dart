import 'package:crud_flutter_api/app/utils/api.dart';
import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/internetMessage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../data/pkb_model.dart';

class PKBApi extends SharedApi {
  // Login API
  Future<PKBListModel> loadPKBAPI() async {
    try {
      var data =
          await http.get(Uri.parse(baseUrl + '/pkb'), headers: getToken());
      print("hasil" + data.statusCode.toString());
      print(json.decode(data.body));
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);

        print(jsonData['content']);

        return PKBListModel.fromJson(
            {"status": 200, "content": jsonData['content']});
      } else {
        return PKBListModel.fromJson(
            {"status": data.statusCode, "content": []});
      }
    } on Exception catch (_) {
      return PKBListModel.fromJson({"status": 404, "content": []});
    }
  }

  Future<PKBModel?> addPKBAPI(
      String idKejadian,
      String idHewan,
      String idPeternak,
      String nik,
      String namaPeternak,
      String jumlah,
      String kategori,
      String lokasi,
      String spesies,
      String umurKebuntingan,
      String pemeriksaKebuntingan,
      String tanggalPkb) async {
    try {
      var jsonData;
      showLoading();

      var bodyData = {
        'idKejadian': idKejadian,
        'idHewan': idHewan,
        'nik': nik,
        'idPeternak': idPeternak,
        'namaPeternak': namaPeternak,
        'jumlah': jumlah,
        'kategori': kategori,
        'lokasi': lokasi,
        'spesies': spesies,
        'umurKebuntingan': umurKebuntingan,
        'pemeriksaKebuntingan': pemeriksaKebuntingan,
        'tanggalPkb': tanggalPkb
      };
      var data = await http.post(
        Uri.parse(baseUrl + '/pkb'),
        headers: {
          ...getToken(),
          'Content-Type': 'application/json',
        },
        body: jsonEncode(bodyData),
      );
      stopLoading();
      jsonData = json.decode(data.body);
      print(data.body);
      print("apalah");
      if (data.statusCode == 200) {
        jsonData['statusCode'] = 200;
        print(PKBModel);
        print(jsonData);
        print(bodyData);
        return null; //PengobatanModel.fromJson(jsonData);
      } else {
        showErrorMessage(jsonData['message']);
        return PKBModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return PKBModel.fromJson({"status": 404});
    }
  }

  Future<PKBModel?> editPKBAPI(String title, String content, String id) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.put(
        Uri.parse(baseUrl + '/pkb/' + id.toString()),
        headers: getToken(),
        body: {'content': content, 'status': "1"},
      );
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        jsonData['statusCode'] = 200;
        return PKBModel.fromJson(jsonData);
      } else {
        showErrorMessage(jsonData['message']);
        return PKBModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return PKBModel.fromJson({"status": 404});
    }
  }

  Future<PKBModel?> deletePKBAPI(String id) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.delete(
        Uri.parse(baseUrl + '/pkb/' + id.toString()),
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
        // Kirim variabel postData ke dalam fungsi PKBModel.fromJson
        return PKBModel.fromJson(postData);
      } else {
        showErrorMessage(jsonData['message']);
        return PKBModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return PKBModel.fromJson({"status": 404});
    }
  }
}
