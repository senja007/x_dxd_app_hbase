import 'dart:convert';

import 'package:crud_flutter_api/app/data/kandang_model.dart';
import 'package:crud_flutter_api/app/utils/api.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/internetMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:http/http.dart' as http;

class KandangApi extends SharedApi {
  // Login API
  Future<KandangListModel> loadKandangApi() async {
    try {
      var data =
          await http.get(Uri.parse(baseUrl + '/kandang'), headers: getToken());
      // print("hasil" + data.statusCode.toString());
      // print(json.decode(data.body));
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);

        // print(jsonData['content']);

        return KandangListModel.fromJson({
          "status": 200,
          "content": jsonData['content'],
          "page": jsonData['page'],
          "size": jsonData['size'],
          "totalElements": jsonData['totalElements'],
          "totalPages": jsonData['totalPages']
        });
      } else {
        return KandangListModel.fromJson(
            {"status": data.statusCode, "content": []});
      }
    } on Exception catch (_) {
      return KandangListModel.fromJson({"status": 404, "content": []});
    }
  }

//ADD
  Future<KandangModel?> addKandangAPI(
      String idKandang,
      String idPeternak,
      String namaPeternak,
      String luas,
      String kapasitas,
      String nilaiBangunan,
      String alamat,
      String desa,
      String kecamatan,
      String kabupaten,
      String provinsi) async {
    try {
      var jsonData;
      showLoading();

      var bodyData = {
        'idKandang': idKandang,
        'idPeternak': idPeternak,
        'namaPeternak': namaPeternak,
        'luas': luas,
        'kapasitas': kapasitas,
        'nilaiBangunan': nilaiBangunan,
        'alamat': alamat,
        'desa': desa,
        'kecamatan': kecamatan,
        'kabupaten': kabupaten,
        'provinsi': provinsi,
      };
      var data = await http.post(
        Uri.parse(baseUrl + '/kandang'),
        headers: {
          ...getToken(),
          'Content-Type': 'application/json',
        },
        body: jsonEncode(bodyData),
      );
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 201) {
        return KandangModel.fromJson({
          "status": 201,
          "idKandang": jsonData['idKandang'],
          "idPeternak": jsonData['idPeternak'],
          "namaPeternak": jsonData['namaPeternak'],
          "luas": jsonData['luas'],
          "kapasitas": jsonData['kapasitas'],
          "nilaiBangunan": jsonData['nilaiBangunan'],
          "alamat": jsonData['alamat'],
          "desa": jsonData['desa'],
          "kecamatan": jsonData['kecamatan'],
          "kabupaten": jsonData['kabupaten'],
          "provinsi": jsonData['provinsi'],
        });
      } else {
        showErrorMessage(jsonData['message']);
        return null; //InseminasiModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return KandangModel.fromJson({"status": 404});
    }
  }

//EDIT
  Future<KandangModel?> editKandangApi(
      String idKandang,
      String idPeternak,
      String namaPeternak,
      String luas,
      String kapasitas,
      String nilaiBangunan,
      String alamat,
      String desa,
      String kecamatan,
      String kabupaten,
      String provinsi) async {
    try {
      var jsonData;
      showLoading();
      var bodyDataedit = {
        'idKandang': idKandang,
        'idPeternak': idPeternak,
        'namaPeternak': namaPeternak,
        'luas': luas,
        'kapasitas': kapasitas,
        'nilaiBangunan': nilaiBangunan,
        'alamat': alamat,
        'desa': desa,
        'kecamatan': kecamatan,
        'kabupaten': kabupaten,
        'provinsi': provinsi,
      };

      var data = await http.put(
        Uri.parse(baseUrl + '/kandang/' + idKandang.toString()),
        headers: {...getToken(), 'Content-Type': 'application/json'},
        body: jsonEncode(bodyDataedit),
      );
      // print(data.body);
      stopLoading();

      jsonData = json.decode(data.body);
      if (data.statusCode == 201) {
        return KandangModel.fromJson({
          "status": 201,
          "idKandang": jsonData['idKandang'],
          "idPeternak": jsonData['idPeternak'],
          "namaPeternak": jsonData['namaPeternak'],
          "luas": jsonData['luas'],
          "kapasitas": jsonData['kapasitas'],
          "nilaiBangunan": jsonData['nilaiBangunan'],
          "alamat": jsonData['alamat'],
          "desa": jsonData['desa'],
          "kecamatan": jsonData['kecamatan'],
          "kabupaten": jsonData['kabupaten'],
          "provinsi": jsonData['provinsi'],
        });
      } else {
        // showErrorMessage(jsonData['message']);
        return KandangModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return KandangModel.fromJson({"status": 404});
    }
  }

  Future<KandangModel?> deleteKandangAPI(String id) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.delete(
        Uri.parse(baseUrl + '/kandang/' + id.toString()),
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
        return KandangModel.fromJson({
          "status": 200,
        });
      } else {
        showErrorMessage(jsonData['message']);
        return KandangModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return KandangModel.fromJson({"status": 404});
    }
  }
}
