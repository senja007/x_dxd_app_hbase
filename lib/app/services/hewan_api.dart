import 'package:crud_flutter_api/app/data/hewan_model.dart';
import 'package:crud_flutter_api/app/utils/api.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/internetMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/successMessage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../data/hewan_model.dart';

class HewanApi extends SharedApi {
  // Login API
  Future<HewanListModel> loadHewanApi() async {
    try {
      var data =
          await http.get(Uri.parse(baseUrl + '/hewan'), headers: getToken());
      // print("hasil" + data.statusCode.toString());
      // print(json.decode(data.body));
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);

        // print(jsonData['content']);

        return HewanListModel.fromJson({
          "status": 200,
          "content": jsonData['content'],
          "page": jsonData['page'],
          "size": jsonData['size'],
          "totalElements": jsonData['totalElements'],
          "totalPages": jsonData['totalPages']
        });
      } else {
        return HewanListModel.fromJson(
            {"status": data.statusCode, "content": []});
      }
    } on Exception catch (_) {
      return HewanListModel.fromJson({"status": 404, "content": []});
    }
  }

//ADD
  Future<HewanModel?> addHewanAPI(
    String kodeEartagNasional,
    String noKartuTernak,
    String provinsi,
    String kabupaten,
    String kecamatan,
    String desa,
    String namaPeternak,
    String idPeternak,
    String nikPeternak,
    String spesies,
    String sex,
    String umur,
    String identifikasiHewan,
    String petugasPendaftar,
    String tanggalTerdaftar,
  ) async {
    try {
      var jsonData;
      showLoading();

      var bodyData = {
        "kodeEartagNasional": kodeEartagNasional,
        "noKartuTernak": noKartuTernak,
        "provinsi": provinsi,
        "kabupaten": kabupaten,
        "kecamatan": kecamatan,
        "desa": desa,
        "namaPeternak": namaPeternak,
        "idPeternak": idPeternak,
        "nikPeternak": nikPeternak,
        "spesies": spesies,
        "sex": sex,
        "umur": umur,
        "identifikasiHewan": identifikasiHewan,
        "petugasPendaftar": petugasPendaftar,
        "tanggalTerdaftar": tanggalTerdaftar,
      };
      var data = await http.post(
        Uri.parse(baseUrl + '/hewan'),
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

//EDIT
  Future<HewanModel?> editHewanApi(
    String kodeEartagNasional,
    String noKartuTernak,
    String provinsi,
    String kabupaten,
    String kecamatan,
    String desa,
    String namaPeternak,
    String idPeternak,
    String nikPeternak,
    String spesies,
    String sex,
    String umur,
    String identifikasiHewan,
    String petugasPendaftar,
    String tanggalTerdaftar,
  ) async {
    try {
      var jsonData;
      showLoading();
      var bodyDataedit = {
        "kodeEartagNasional": kodeEartagNasional,
        "noKartuTernak": noKartuTernak,
        "provinsi": provinsi,
        "kabupaten": kabupaten,
        "kecamatan": kecamatan,
        "desa": desa,
        "namaPeternak": namaPeternak,
        "idPeternak": idPeternak,
        "nikPeternak": nikPeternak,
        "spesies": spesies,
        "sex": sex,
        "umur": umur,
        "identifikasiHewan": identifikasiHewan,
        "petugasPendaftar": petugasPendaftar,
        "tanggalTerdaftar": tanggalTerdaftar,
      };

      var data = await http.put(
        Uri.parse(baseUrl + '/hewan/' + kodeEartagNasional.toString()),
        headers: {...getToken(), 'Content-Type': 'application/json'},
        body: jsonEncode(bodyDataedit),
      );
      print(data.body);
      stopLoading();

      jsonData = json.decode(data.body);
      if (data.statusCode == 201) {
        jsonData['statusCode'] = 201;
        print(data.body);
        print(jsonData);
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

  //DELETE
  Future<HewanModel?> deleteHewanApi(String id) async {
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
