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
      print("hasil" + data.statusCode.toString());
      print(json.decode(data.body));
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);

        print(jsonData['content']);

        return KelahiranListModel.fromJson(
            {"status": 200, "content": jsonData['content']});
      } else {
        return KelahiranListModel.fromJson(
            {"status": data.statusCode, "content": []});
      }
    } on Exception catch (_) {
      return KelahiranListModel.fromJson({"status": 404, "content": []});
    }
  }

  Future<KelahiranModel?> addKelahiranAPI(
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

      var bodyData = {
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
        return KelahiranModel.fromJson(jsonData);
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

  Future<KelahiranModel?> editKelahiranAPI(
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
      var bodyData = {
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
      if (data.statusCode == 200) {
        jsonData['statusCode'] = 200;
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
        postData["status"] = 1;
        postData['id'] = 0;

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
