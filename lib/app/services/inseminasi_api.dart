import 'package:crud_flutter_api/app/utils/api.dart';
import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/internetMessage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../data/inseminasi_model.dart';

class InseminasiApi extends SharedApi {
  // Login API
  Future<InseminasiListModel> loadInseminasiAPI() async {
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

  Future<InseminasiModel?> addInseminasiAPI(String idInseminasi, String tanggalIB, String lokasi, String namaPeternak, 
  String idPeternak, String idHewan, String eartag, String ib1, String ib2, String ib3, String ibLain, String idPejantan, 
  String IdPembuatan, String bangsaPejantan, String produsen, String inseminator) async {
    try {
      var jsonData;
      showLoading();

      var bodyData = {
      'idInseminasi': idInseminasi, 'tanggalIB': tanggalIB, 'lokasi': lokasi, 'namaPeternak': namaPeternak,
      'idPeternak' : idPeternak, 'idHewan' : idHewan, 'eartag' : eartag, 'ib1' : ib1, 'ib2' : ib2, 'ib3' : ib3, 
      'ibLain' : ibLain, 'idPejantan' : idPejantan, 'idPembuatan' : IdPembuatan, 'bangsaPejantan' : bangsaPejantan,
      'produsen' : produsen, 'inseminator' : inseminator
      };
      var data = await http.post(
        Uri.parse(baseUrl + '/inseminasi'),
        headers: {...getToken() , 'Content-Type': 'application/json',},
        body: jsonEncode(bodyData),
      );
      stopLoading();
      jsonData = json.decode(data.body);
      print(data.body);
      print("apalah");
      if (data.statusCode == 200) {
        jsonData['statusCode'] = 200;
        print(InseminasiModel);
        print(jsonData);
        print(bodyData);
        return InseminasiModel.fromJson(jsonData);
      } else {
        showErrorMessage(jsonData['message']);
        return null; //InseminasiModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return InseminasiModel.fromJson({"status": 404});
    }
  }

  Future<InseminasiModel?> editInseminasiAPI(
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

  Future<InseminasiModel?> deleteInseminasiAPI(String id) async {
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
