import 'package:crud_flutter_api/app/utils/api.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
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

      ///print("hasil" + data.statusCode.toString());
      //print(json.decode(data.body));
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);

        //print(jsonData['content']);

        return PKBListModel.fromJson({
          "status": 200,
          "content": jsonData['content'],
          "page": jsonData['page'],
          "size": jsonData['size'],
          "totalElements": jsonData['totalElements'],
          "totalPages": jsonData['totalPages']
        });
      } else {
        return PKBListModel.fromJson(
            {"status": data.statusCode, "content": []});
      }
    } on Exception catch (_) {
      return PKBListModel.fromJson({"status": 404, "content": []});
    }
  }

//ADD
  Future<PKBModel?> addPKBAPI(
      String idKejadian,
      String idHewan,
      String idPeternak,
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
        'idPeternak': idPeternak,
        'jumlah': jumlah,
        'kategori': kategori,
        'lokasi': lokasi,
        'spesies': spesies,
        'umurKebuntingan': umurKebuntingan,
        'pemeriksaKebuntingan': pemeriksaKebuntingan,
        'tanggalPkb': tanggalPkb,
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
      if (data.statusCode == 201) {
        return PKBModel.fromJson({
          "status": 201,
          "idKejadian": jsonData['idKejadian'],
          "idHewan": jsonData['idHewan'],
          "idPeternak": jsonData['idPeternak'],
          "jumlah": jsonData['jumlah'],
          "kategori": jsonData['kategori'],
          "lokasi": jsonData['lokasi'],
          "spesies": jsonData['spesies'],
          "umurKebuntingan": jsonData['umurKebuntingan'],
          "pemeriksaKebuntingan": jsonData['pemeriksaKebuntingan'],
          "tanggalPkb": jsonData['tanggalPkb'],
        });
      } else {
        // showErrorMessage(jsonData['message']);
        return null; // return PKBModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return PKBModel.fromJson({"status": 404});
    }
  }

//EDIT
  Future<PKBModel?> editPKBApi(
      String idKejadian,
      String idHewan,
      String idPeternak,
      String nikPeternak,
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
      var bodyDataedit = {
        'idKejadian': idKejadian,
        'idHewan': idHewan,
        'idPeternak': idPeternak,
        'nikPeternak': nikPeternak,
        'namaPeternak': namaPeternak,
        'jumlah': jumlah,
        'kategori': kategori,
        'lokasi': lokasi,
        'spesies': spesies,
        'umurKebuntingan': umurKebuntingan,
        'pemeriksaKebuntingan': pemeriksaKebuntingan,
        'tanggalPkb': tanggalPkb
      };

      var data = await http.put(
        Uri.parse(baseUrl + '/pkb/' + idKejadian.toString()),
        headers: {...getToken(), 'Content-Type': 'application/json'},
        body: jsonEncode(bodyDataedit),
      );
      // print(data.body);
      stopLoading();

      jsonData = json.decode(data.body);
      if (data.statusCode == 201) {
        return PKBModel.fromJson({
          "status": 201,
          "idKejadian": jsonData['idKejadian'],
          "idHewan": jsonData['idHewan'],
          "idPeternak": jsonData['idPeternak'],
          "nikPeternak": jsonData['nikPeternak'],
          "namaPeternak": jsonData['namaPeternak'],
          "jumlah": jsonData['jumlah'],
          "kategori": jsonData['kategori'],
          "lokasi": jsonData['lokasi'],
          "spesies": jsonData['spesies'],
          "umurKebuntingan": jsonData['umurKebuntingan'],
          "pemeriksaKebuntingan": jsonData['pemeriksaKebuntingan'],
          "tanggalPkb": jsonData['tanggalPkb'],
        });
      } else {
        // showErrorMessage(jsonData['message']);
        return PKBModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return PKBModel.fromJson({"status": 404});
    }
  }

//DELETE
  Future<PKBModel?> deletePKBAPI(String id_kejadian) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.delete(
        Uri.parse(baseUrl + '/pkb/' + id_kejadian.toString()),
        headers: getToken(),
      );
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        // Simpan nilai jsonData['data'] dalam variabel baru
        var postData = <String, dynamic>{};
        postData["statusCode"] = 200;
        // postData['content'] = "";

        print(postData);
        // Kirim variabel postData ke dalam fungsi PKBModel.fromJson
        return PKBModel.fromJson({"status": 200});
      } else {
        // showErrorMessage(jsonData['message']);
        return PKBModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return PKBModel.fromJson({"status": 404});
    }
  }
}
