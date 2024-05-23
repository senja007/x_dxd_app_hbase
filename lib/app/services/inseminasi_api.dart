import 'package:crud_flutter_api/app/utils/api.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:crud_flutter_api/app/widgets/message/internetMessage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../data/inseminasi_model.dart';

class InseminasiApi extends SharedApi {
  // Login API
  Future<InseminasiListModel> loadInseminasiAPI() async {
    try {
      var data =
          await http.get(Uri.parse('$baseUrl/inseminasi'), headers: getToken());
      // print("hasil" + data.statusCode.toString());
      // print(json.decode(data.body));
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);

        // print(jsonData['content']);

        return InseminasiListModel.fromJson({
          "status": 200,
          "content": jsonData['content'],
          "page": jsonData['page'],
          "size": jsonData['size'],
          "totalElements": jsonData['totalElements'],
          "totalPages": jsonData['totalPages']
        });
      } else {
        return InseminasiListModel.fromJson(
            {"status": data.statusCode, "content": []});
      }
    } on Exception catch (_) {
      return InseminasiListModel.fromJson({"status": 404, "content": []});
    }
  }

//ADD
  Future<InseminasiModel?> addInseminasiAPI(
    String idInseminasi,
    String kodeEartagNasional,
    // String idHewan,
    String idPembuatan,
    String idPejantan,
    String bangsaPejantan,
    String ib1,
    String ib2,
    String ib3,
    String ibLain,
    String produsen,
    String idPeternak,
    String lokasi,
    String inseminator,
    String tanggalIB,
  ) async {
    try {
      var jsonData;
      showLoading();

      var bodyData = {
        'idInseminasi': idInseminasi,
        'kodeEartagNasional': kodeEartagNasional,
        // 'idHewan': idHewan,
        'idPembuatan': idPembuatan,
        'idPejantan': idPejantan,
        'bangsaPejantan': bangsaPejantan,
        'ib1': ib1,
        'ib2': ib2,
        'ib3': ib3,
        'ibLain': ibLain,
        'produsen': produsen,
        'idPeternak': idPeternak,
        'lokasi': lokasi,
        'inseminator': inseminator,
        'tanggalIB': tanggalIB,
      };
      var data = await http.post(
        Uri.parse('$baseUrl/inseminasi'),
        headers: {
          ...getToken(),
          'Content-Type': 'application/json',
        },
        body: jsonEncode(bodyData),
      );
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 201) {
        return InseminasiModel.fromJson({
          "status": 201,
          "idInseminasi": jsonData['idInseminasi'],
          "kodeEartagNasional": jsonData['kodeEartagNasional'],
          // "idHewan": jsonData['idHewan'],
          "idPembuatan": jsonData['idPembuatan'],
          "idPejantan": jsonData['idPejantan'],
          "bangsaPejantan": jsonData['bangsaPejantan'],
          "ib1": jsonData['ib1'],
          "ib2": jsonData['ib2'],
          "ib3": jsonData['ib3'],
          "ibLain": jsonData['ibLain'],
          "produsen": jsonData['produsen'],
          "idPeternak": jsonData['idPeternak'],
          //"namaPeternak": jsonData['namaPeternak'],
          "lokasi": jsonData['lokasi'],
          "inseminator": jsonData['inseminator'],
          "tanggalIB": jsonData['tanggalIB'],
        });
      } else {
        // showErrorMessage(jsonData['message']);
        return null; //InseminasiModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return InseminasiModel.fromJson({"status": 404});
    }
  }

//EDIT
  Future<InseminasiModel?> editInseminasiApi(
    String idInseminasi,
    String kodeEartagNasional,
    //String idHewan,
    String idPembuatan,
    // String idPejantan,
    String bangsaPejantan,
    String ib1,
    String ib2,
    String ib3,
    String ibLain,
    String produsen,
    String idPeternak,
    // String namaPeternak,
    String lokasi,
    String inseminator,
    String tanggalIB,
  ) async {
    try {
      var jsonData;
      showLoading();
      var bodyDataedit = {
        'idInseminasi': idInseminasi,
        'kodeEartagNasional': kodeEartagNasional,
        //'idHewan': idHewan,
        'idPembuatan': idPembuatan,
        // 'idPejantan': idPejantan,
        'bangsaPejantan': bangsaPejantan,
        'ib1': ib1,
        'ib2': ib2,
        'ib3': ib3,
        'ibLain': ibLain,
        'produsen': produsen,
        'idPeternak': idPeternak,
        //  'namaPeternak': namaPeternak,
        'lokasi': lokasi,
        'inseminator': inseminator,
        'tanggalIB': tanggalIB,
      };

      var data = await http.put(
        Uri.parse('$baseUrl/inseminasi/$idInseminasi'),
        headers: {...getToken(), 'Content-Type': 'application/json'},
        body: jsonEncode(bodyDataedit),
      );
      print(data.body);
      stopLoading();

      jsonData = json.decode(data.body);
      if (data.statusCode == 201) {
        // jsonData['statusCode'] = 201;
        // // print(data.body);
        // // print(jsonData);
        // return InseminasiModel.fromJson(jsonData);
        return InseminasiModel.fromJson({
          "status": 201,
          "idInseminasi": jsonData['idInseminasi'],
          "kodeEartagNasional": jsonData['kodeEartagNasional'],
          //"idHewan": jsonData['idHewan'],
          "idPembuatan": jsonData['idPembuatan'],
          // "idPejantan": jsonData['idPejantan'],
          "bangsaPejantan": jsonData['bangsaPejantan'],
          "ib1": jsonData['ib1'],
          "ib2": jsonData['ib2'],
          "ib3": jsonData['ib3'],
          "ibLain": jsonData['ibLain'],
          "produsen": jsonData['produsen'],
          "idPeternak": jsonData['idPeternak'],
          // "namaPeternak": jsonData['namaPeternak'],
          "lokasi": jsonData['lokasi'],
          "inseminator": jsonData['inseminator'],
          "tanggalIB": jsonData['tanggalIB'],
        });
      } else {
        // showErrorMessage(jsonData['message']);
        return InseminasiModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return InseminasiModel.fromJson({"status": 404});
    }
  }

//DELETE
  Future<InseminasiModel?> deleteInseminasiAPI(String idInseminasi) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.delete(
        Uri.parse('$baseUrl/inseminasi/$idInseminasi'),
        headers: getToken(),
      );
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        // Simpan nilai jsonData['data'] dalam variabel baru
        var postData = <String, dynamic>{};
        postData["statusCode"] = 200;
        //postData['content'] = "";

        print(postData);
        // Kirim variabel postData ke dalam fungsi InseminasiModel.fromJson
        return InseminasiModel.fromJson({"status": 200});
      } else {
        // showErrorMessage(jsonData['message']);
        return InseminasiModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return InseminasiModel.fromJson({"status": 404});
    }
  }
}
