import 'package:crud_flutter_api/app/utils/api.dart';
import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/internetMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/successMessage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../data/kelahiran_model.dart';

class KelahiranApi extends SharedApi {
  // Login API
  Future<KelahiranListModel> loadKelahiranAPI() async {
    try {
      var data = await http.get(Uri.parse(baseUrl + '/kelahiran'),
          headers: getToken());
      // print("hasil" + data.statusCode.toString());
      // print(json.decode(data.body));
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);

        // print(jsonData['content']);

        return KelahiranListModel.fromJson({
          "status": 200,
          "content": jsonData['content'],
          "page": jsonData['page'],
          "size": jsonData['size'],
          "totalElements": jsonData['totalElements'],
          "totalPages": jsonData['totalPages']
        });
      } else {
        return KelahiranListModel.fromJson(
            {"status": data.statusCode, "content": []});
      }
    } on Exception catch (_) {
      return KelahiranListModel.fromJson({"status": 404, "content": []});
    }
  }

//ADD
  Future<KelahiranModel?> addKelahiranAPI(
    String idKejadian,
    String eartagInduk,
    String eartagAnak,
    String idHewanInduk,
    String idHewanAnak,
    String idBatchStraw,
    String idPejantanStraw,
    String jenisKelaminAnak,
    String jumlah,
    String urutanIb,
    String kartuTernakAnak,
    String kartuTernakInduk,
    String kategori,
    String lokasi,
    String idPeternak,
    String namaPeternak,
    String petugasPelapor,
    String produsenStraw,
    String spesiesInduk,
    String spesiesPejantan,
    String tanggalLahir,
    String tanggalLaporan,
  ) async {
    try {
      var jsonData;
      showLoading();

      var bodyData = {
        'idKejadian': idKejadian,
        'eartagInduk': eartagInduk,
        'eartagAnak': eartagAnak,
        'idHewaninduk': idHewanInduk,
        'idHewanAnak': idHewanAnak,
        'idBatch': idBatchStraw,
        'idPejantan': idPejantanStraw,
        'kelaminAnak': jenisKelaminAnak,
        'jumlah': jumlah,
        'urutanIb': urutanIb,
        'kartuTernakAnak': kartuTernakAnak,
        'kartuTernakInduk': kartuTernakInduk,
        'kategori': kategori,
        'lokasi': lokasi,
        'idPeternak': idPeternak,
        'namaPeternak': namaPeternak,
        'petugasPelapor': petugasPelapor,
        'produsen': produsenStraw,
        'spesiesInduk': spesiesInduk,
        'spesiesPejantan': spesiesPejantan,
        'tanggalLahir': tanggalLahir,
        'tanggalLaporan': tanggalLaporan,
      };
      var data = await http.post(
        Uri.parse(baseUrl + '/kelahiran'),
        headers: {
          ...getToken(),
          'Content-Type': 'application/json',
        },
        body: jsonEncode(bodyData),
      );
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 201) {
        showSuccessMessage(jsonData["message"]);
        Get.back();
        return KelahiranModel.fromJson({
          "status": 201,
          "idKejadian": jsonData['idKejadian'],
          "eartagInduk": jsonData['eartagInduk'],
          "eartagAnak": jsonData['eartagAnak'],
          "idHewaninduk": jsonData['idHewanInduk'],
          "idHewanAnak": jsonData['idHewanAnak'],
          "idBatch": jsonData['idBatchStraw'],
          "idPejantan": jsonData['idPejantanStraw'],
          "kelaminAnak": jsonData['jenisKelaminAnak'],
          "jumlah": jsonData['jumlah'],
          "urutanIb": jsonData['urutanIb'],
          "kartuTernakAnak": jsonData['kartuTernakAnak'],
          "kartuTernakInduk": jsonData['kartuTernakInduk'],
          "kategori": jsonData['kategori'],
          "lokasi": jsonData['lokasi'],
          "idPeternak": jsonData['idPeternak'],
          "namaPeternak": jsonData['namaPeternak'],
          "petugasPelapor": jsonData['petugasPelapor'],
          "produsen": jsonData['produsenStraw'],
          "spesiesInduk": jsonData['spesiesInduk'],
          "spesiesPejantan": jsonData['spesiesPejantan'],
          "tanggalLahir": jsonData['tanggalLahir'],
          "tanggalLaporan": jsonData['tanggalLaporan'],
        });
      } else {
        showErrorMessage(jsonData['message']);
        return null; // KelahiranModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return KelahiranModel.fromJson({"status": 404});
    }
  }

//EDIT
  Future<KelahiranModel?> editKelahiranApi(
      String idKejadian,
      String eartagInduk,
      String eartagAnak,
      String idHewanInduk,
      String idHewanAnak,
      String idBatch,
      String idPejantan,
      String kelaminAnak,
      String jumlah,
      String kartuTernakAnak,
      String kartuTernakInduk,
      String kategori,
      String lokasi,
      String idPeternak,
      String namaPeternak,
      String petugasPelapor,
      String produsen,
      String spesiesInduk,
      String spesiesPejantan,
      String tanggalLahir,
      String tanggalLaporan,
      String urutanIb) async {
    try {
      var jsonData;
      showLoading();
      var bodyDataedit = {
        'idKejadian': idKejadian,
        'eartagInduk': eartagInduk,
        'eartagAnak': eartagAnak,
        'idHewaninduk': idHewanInduk,
        'idHewanAnak': idHewanAnak,
        'idBatch': idBatch,
        'idPejantan': idPejantan,
        'kelaminAnak': kelaminAnak,
        'jumlah': jumlah,
        'kartuTernakAnak': kartuTernakAnak,
        'kartuTernakInduk': kartuTernakInduk,
        'kategori': kategori,
        'lokasi': lokasi,
        'idPeternak': idPeternak,
        'namaPeternak': namaPeternak,
        'petugasPelapor': petugasPelapor,
        'produsen': produsen,
        'spesiesInduk': spesiesInduk,
        'spesiesPejantan': spesiesPejantan,
        'tanggalLahir': tanggalLahir,
        'tanggalLaporan': tanggalLaporan,
        'urutanIb': urutanIb
      };
      var data = await http.put(
        Uri.parse(baseUrl + '/kelahiran/' + idKejadian.toString()),
        headers: {...getToken(), 'Content-Type': 'application/json'},
        body: jsonEncode(bodyDataedit),
      );
      print(data.body);
      stopLoading();

      jsonData = json.decode(data.body);
      if (data.statusCode == 201) {
        jsonData['statusCode'] = 201;
        // print(data.body);
        // print(jsonData);
        return KelahiranModel.fromJson(jsonData);
      } else {
        showErrorMessage(jsonData['message']);
        return KelahiranModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return KelahiranModel.fromJson({"status": 404});
    }
  }

//DELETE
  Future<KelahiranModel?> deleteKelahiranAPI(String id) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.delete(
        Uri.parse(baseUrl + '/kelahiran/' + id.toString()),
        headers: getToken(),
      );
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        // Simpan nilai jsonData['data'] dalam variabel baru
        var postData = <String, dynamic>{};
        postData["statusCode"] = 200;
        postData['content'] = "";

        print(postData);
        // Kirim variabel postData ke dalam fungsi KelahiranModel.fromJson
        return KelahiranModel.fromJson(postData);
      } else {
        showErrorMessage(jsonData['message']);
        return KelahiranModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return KelahiranModel.fromJson({"status": 404});
    }
  }
}
