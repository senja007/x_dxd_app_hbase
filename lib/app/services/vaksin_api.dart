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

import '../data/vaksin_model.dart';

class VaksinApi extends SharedApi {
  // Login API
  Future<VaksinListModel> loadVaksinAPI() async {
    try {
      var data =
          await http.get(Uri.parse(baseUrl + '/vaksin'), headers: getToken());
      print("hasil" + data.statusCode.toString());
      print(json.decode(data.body));
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);

        print(jsonData['content']);

        return VaksinListModel.fromJson(
            {"status": 200, "content": jsonData['content']});
      } else {
        return VaksinListModel.fromJson(
            {"status": data.statusCode, "content": []});
      }
    } on Exception catch (_) {
      return VaksinListModel.fromJson({"status": 404, "content": []});
    }
  }

//ADD
  Future<VaksinModel?> addVaksinAPI(
      String idVaksin,
      String eartag,
      String idHewan,
      String idPembuatan,
      String idPejantan,
      String bangsaPejantan,
      String ib1,
      String ib2,
      String ib3,
      String ibLain,
      String produsen,
      String idPeternak,
      String namaPeternak,
      String lokasi,
      String inseminator,
      String tanggalIB) async {
    try {
      var jsonData;
      showLoading();

      var bodyData = {
        'idVaksin': idVaksin,
        'eartag': eartag,
        'idHewan': idHewan,
        'idPembuatan': idPembuatan,
        'idPejantan': idPejantan,
        'bangsaPejantan': bangsaPejantan,
        'ib1': ib1,
        'ib2': ib2,
        'ib3': ib3,
        'ibLain': ibLain,
        'produsen': produsen,
        'idPeternak': idPeternak,
        'namaPeternak': namaPeternak,
        'lokasi': lokasi,
        'inseminator': inseminator,
        'tanggalIB': tanggalIB
      };
      var data = await http.post(
        Uri.parse(baseUrl + '/vaksin'),
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
      if (data.statusCode == 201) {
        showSuccessMessage(jsonData["message"]);
        Get.back();
        return VaksinModel.fromJson(jsonData);
      } else {
        showErrorMessage(jsonData['message']);
        return null; // return VaksinModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return VaksinModel.fromJson({"status": 404});
    }
  }

//EDIT
  Future<VaksinModel?> editVaksinApi(
      String idVaksin,
      String eartag,
      String idHewan,
      String idPembuatan,
      String idPejantan,
      String bangsaPejantan,
      String ib1,
      String ib2,
      String ib3,
      String ibLain,
      String produsen,
      String idPeternak,
      String namaPeternak,
      String lokasi,
      String inseminator,
      String tanggalIB) async {
    try {
      var jsonData;
      showLoading();
      var bodyDataedit = {
        'idVaksin': idVaksin,
        'eartag': eartag,
        'idHewan': idHewan,
        'idPembuatan': idPembuatan,
        'idPejantan': idPejantan,
        'bangsaPejantan': bangsaPejantan,
        'ib1': ib1,
        'ib2': ib2,
        'ib3': ib3,
        'ibLain': ibLain,
        'produsen': produsen,
        'idPeternak': idPeternak,
        'namaPeternak': namaPeternak,
        'lokasi': lokasi,
        'inseminator': inseminator,
        'tanggalIB': tanggalIB
      };

      var data = await http.put(
        Uri.parse(baseUrl + '/vaksin/' + idVaksin.toString()),
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
        return VaksinModel.fromJson(jsonData);
      } else {
        showErrorMessage(jsonData['message']);
        return VaksinModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return VaksinModel.fromJson({"status": 404});
    }
  }

//DELETE
  Future<VaksinModel?> deleteVaksinApi(String id) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.delete(
        Uri.parse(baseUrl + '/vaksin/' + id.toString()),
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
        // Kirim variabel postData ke dalam fungsi VaksinModel.fromJson
        return VaksinModel.fromJson(postData);
      } else {
        showErrorMessage(jsonData['message']);
        return VaksinModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return VaksinModel.fromJson({"status": 404});
    }
  }
}
