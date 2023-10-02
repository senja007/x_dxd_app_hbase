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
    String tanggalLaporan,
    String tanggalLahir,
    String lokasi,
    String namaPeternak,
    String idPeternak,
    String kartuTernakInduk,
    String eartagInduk,
    String idHewanInduk,
    String spesiesInduk,
    String idPejantanStraw,
    String idBatchStraw,
    String produsenStraw,
    String spesiesPejantan,
    String jumlah,
    String kartuTernakAnak,
    String eartagAnak,
    String idHewanAnak,
    String jenisKelaminAnak,
    String kategori,
    String petugasPelapor,
    String urutanIb,
  ) async {
    try {
      var jsonData;
      showLoading();

      var bodyData = {
        'idKejadian': idKejadian,
        'tanggalLaporan': tanggalLaporan,
        'tanggalLahir': tanggalLahir,
        'lokasi': lokasi,
        'namaPeternak': namaPeternak,
        'idPeternak': idPeternak,
        'kartuTernakInduk': kartuTernakInduk,
        'eartagInduk': eartagInduk,
        'idHewanInduk': idHewanInduk,
        'spesiesInduk': spesiesInduk,
        'idPejantanStraw': idPejantanStraw,
        'idBatchStraw': idBatchStraw,
        'produsenStraw': produsenStraw,
        'spesiesPejantan': spesiesPejantan,
        'jumlah': jumlah,
        'kartuTernakAnak': kartuTernakAnak,
        'eartagAnak': eartagAnak,
        'idHewanAnak': idHewanAnak,
        'jenisKelaminAnak': jenisKelaminAnak,
        'kategori': kategori,
        'petugasPelapor': petugasPelapor,
        'urutanIb': urutanIb,
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
        
        return KelahiranModel.fromJson({
          "status": 201,
        "idKejadian": jsonData['idKejadian'],
        "tanggalLaporan": jsonData['tanggalLaporan'],
        "tanggalLahir": jsonData['tanggalLahir'],
        "lokasi": jsonData['lokasi'],
        "namaPeternak": jsonData['namaPeternak'],
        "idPeternak": jsonData['idPeternak'],
        "kartuTernakInduk": jsonData['kartuTernakInduk'],
        "eartagInduk": jsonData['eartagInduk'],
        "idHewanInduk": jsonData['idHewanInduk'],
        "spesiesInduk": jsonData['spesiesInduk'],
        "idPejantanStraw": jsonData['idPejantanStraw'],
        "idBatchStraw": jsonData['idBatchStraw'],
        "produsenStraw": jsonData['produsenStraw'],
        "spesiesPejantan": jsonData['spesiesPejantan'],
        "jumlah": jsonData['jumlah'],
        "kartuTernakAnak": jsonData['kartuTernakAnak'],
        "eartagAnak": jsonData['eartagAnak'],
        "idHewanAnak": jsonData['idHewanAnak'],
        "jenisKelaminAnak": jsonData['jenisKelaminAnak'],
        "kategori": jsonData['kategori'],
        "petugasPelapor": jsonData['petugasPelapor'],
        "urutanIb": jsonData['urutanIb'],
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
    String tanggalLaporan,
    String tanggalLahir,
    String lokasi,
    String namaPeternak,
    String idPeternak,
    String kartuTernakInduk,
    String eartagInduk,
    String idHewanInduk,
    String spesiesInduk,
    String idPejantanStraw,
    String idBatchStraw,
    String produsenStraw,
    String spesiesPejantan,
    String jumlah,
    String kartuTernakAnak,
    String eartagAnak,
    String idHewanAnak,
    String jenisKelaminAnak,
    String kategori,
    String petugasPelapor,
    String urutanIb,
      ) async {
    try {
      var jsonData;
      showLoading();
      var bodyDataedit = {
        'idKejadian': idKejadian,
        'tanggalLaporan': tanggalLaporan,
        'tanggalLahir': tanggalLahir,
        'lokasi': lokasi,
        'namaPeternak': namaPeternak,
        'idPeternak': idPeternak,
        'kartuTernakInduk': kartuTernakInduk,
        'eartagInduk': eartagInduk,
        'idHewanInduk': idHewanInduk,
        'spesiesInduk': spesiesInduk,
        'idPejantanStraw': idPejantanStraw,
        'idBatchStraw': idBatchStraw,
        'produsenStraw': produsenStraw,
        'spesiesPejantan': spesiesPejantan,
        'jumlah': jumlah,
        'kartuTernakAnak': kartuTernakAnak,
        'eartagAnak': eartagAnak,
        'idHewanAnak': idHewanAnak,
        'jenisKelaminAnak': jenisKelaminAnak,
        'kategori': kategori,
        'petugasPelapor': petugasPelapor,
        'urutanIb': urutanIb,
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
