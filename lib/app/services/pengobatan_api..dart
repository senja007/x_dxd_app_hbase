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

import '../data/pengobatan_model.dart';

class PengobatanApi extends SharedApi {
  // Login API
  Future<PengobatanListModel> loadPengobatanAPI() async {
    try {
      var data = await http.get(Uri.parse(baseUrl + '/pengobatan'),
          headers: getToken());
      print("hasil" + data.statusCode.toString());
      print(json.decode(data.body));
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);

        print(jsonData['content']);

        return PengobatanListModel.fromJson(
            {"status": 200, "content": jsonData['content']});
      } else {
        return PengobatanListModel.fromJson(
            {"status": data.statusCode, "content": []});
      }
    } on Exception catch (_) {
      return PengobatanListModel.fromJson({"status": 404, "content": []});
    }
  }

//ADD
  Future<PengobatanModel?> addPengobatanAPI(
    String idKasus,
    String tanggalPengobatan,
    String tanggalKasus,
    String namaPetugas,
    String namaInfrastruktur,
    String lokasi,
    String dosis,
    String sindrom,
    String dignosaBanding,
  ) async {
    try {
      var jsonData;
      showLoading();

      var bodyData = {
        'idKasus': idKasus,
        'tanggalPengobatan': tanggalPengobatan,
        'tanggalKasus': tanggalKasus,
        'namaPetugas': namaPetugas,
        'namaInfrastruktur': namaInfrastruktur,
        'lokasi': lokasi,
        'dosis': dosis,
        'sindrom': sindrom,
        'diagnosaBanding': dignosaBanding,
      };
      var data = await http.post(
        Uri.parse(baseUrl + '/pengobatan'),
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
        PengobatanModel.fromJson(jsonData);
      } else {
        showErrorMessage(jsonData['message']);
        return null; // return PengobatanModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return PengobatanModel.fromJson({"status": 404});
    }
  }

//EDIT
  Future<PengobatanModel?> editPengobatanApi(
    String idKasus,
    String tanggalPengobatan,
    String tanggalKasus,
    String namaPetugas,
    String namaInfrastruktur,
    String lokasi,
    String dosis,
    String sindrom,
    String dignosaBanding,
  ) async {
    try {
      var jsonData;
      showLoading();
      var bodyDataedit = {
        'idKasus': idKasus,
        'tanggalPengobatan': tanggalPengobatan,
        'tanggalKasus': tanggalKasus,
        'namaPetugas': namaPetugas,
        'namaInfrastruktur': namaInfrastruktur,
        'lokasi': lokasi,
        'dosis': dosis,
        'sindrom': sindrom,
        'diagnosaBanding': dignosaBanding,
      };

      var data = await http.put(
        Uri.parse(baseUrl + '/pengobatan/' + idKasus.toString()),
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
        return PengobatanModel.fromJson(jsonData);
      } else {
        showErrorMessage(jsonData['message']);
        return PengobatanModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return PengobatanModel.fromJson({"status": 404});
    }
  }

//DELETE
  Future<PengobatanModel?> deletePengobatanAPI(String id) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.delete(
        Uri.parse(baseUrl + '/pengobatan/' + id.toString()),
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
        // Kirim variabel postData ke dalam fungsi PengobatanModel.fromJson
        return PengobatanModel.fromJson(postData);
      } else {
        showErrorMessage(jsonData['message']);
        return PengobatanModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return PengobatanModel.fromJson({"status": 404});
    }
  }
}
