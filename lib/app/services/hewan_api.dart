import 'dart:io';

import 'package:crud_flutter_api/app/data/hewan_model.dart';
import 'package:crud_flutter_api/app/utils/api.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/internetMessage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HewanApi extends SharedApi {
  // Login API
  Future<HewanListModel> loadHewanApi() async {
    try {
      var data =
          await http.get(Uri.parse('$baseUrl/hewan'), headers: getToken());
      print("hasil" + data.statusCode.toString());
      print(json.decode(data.body));
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);

        //print(jsonData['content']);

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
      String alamat,
      //String namaPeternak,
      String idPeternak,
      String idKandang,
      // String nikPeternak,
      String spesies,
      String sex,
      String umur,
      String identifikasiHewan,
      String petugasPendaftar,
      String tanggalTerdaftar,
      File fotoHewan,
      // String latitude,
      // String longitude,
      {required String latitude,
      required String longitude}) async {
    try {
      var jsonData;
      showLoading();

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/hewan'),
      );

      request.fields.addAll({
        "kodeEartagNasional": kodeEartagNasional,
        "noKartuTernak": noKartuTernak,
        "provinsi": provinsi,
        "kabupaten": kabupaten,
        "kecamatan": kecamatan,
        "desa": desa,
        "alamat": alamat,
        //"namaPeternak": namaPeternak,
        "idPeternak": idPeternak,
        "idKandang": idKandang,
        //"nikPeternak": nikPeternak,
        "spesies": spesies,
        "sex": sex,
        "umur": umur,
        "identifikasiHewan": identifikasiHewan,
        "petugasPendaftar": petugasPendaftar,
        "tanggalTerdaftar": tanggalTerdaftar,
        "fotoHewan": fotoHewan.path,
        "latitude": latitude,
        "longitude": longitude,
      });
      var imageField = http.MultipartFile(
        'file',
        fotoHewan.readAsBytes().asStream(),
        fotoHewan.lengthSync(),
        filename: fotoHewan.path.split("/").last,
      );
      request.files.add(imageField);
      request.headers.addAll(
        {
          ...getToken(),
          'Content-Type': 'multipart/form-data',
        },
      );

      var response = await request.send();
      var responseData = await response.stream.transform(utf8.decoder).toList();
      var responseString = responseData.join('');
      jsonData = json.decode(responseString);
      stopLoading();
      if (response.statusCode == 201) {
        return HewanModel.fromJson({
          "status": 201,
          "kodeEartagNasional": jsonData['kodeEartagNasional'],
          "noKartuTernak": jsonData['noKartuTernak'],
          "provinsi": jsonData['provinsi'],
          "kabupaten": jsonData['kabupaten'],
          "kecamatan": jsonData['kecamatan'],
          "desa": jsonData['desa'],
          "alamat": jsonData['alamat'],
          //  "namaPeternak": jsonData['namaPeternak'],
          "idPeternak": jsonData['idPeternak'],
          "idKandag": jsonData['idKandag'],
          // "nikPeternak": jsonData['nikPeternak'],
          "spesies": jsonData['spesies'],
          "sex": jsonData['sex'],
          "umur": jsonData['umur'],
          "identifikasiHewan": jsonData['identifikasiHewan'],
          "petugasPendaftar": jsonData['petugasPendaftar'],
          "tanggalTerdaftar": jsonData['tanggalTerdaftar'],
          "fotoHewan": jsonData['fotoHewan'],
          "latitude": jsonData['latitude'],
          "longitude": jsonData['longitude'],
        });
      } else {
        showErrorMessage(jsonData['message']);
        return HewanModel.fromJson({"status": response.statusCode});
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
      String alamat,
      // String namaPeternak,
      String idPeternak,
      String idKandang,
      // String nikPeternak,
      String spesies,
      String sex,
      String umur,
      String identifikasiHewan,
      String petugasPendaftar,
      String tanggalTerdaftar,
      File? fotoHewan,
      // String latitude,
      // String longitude,
      {required String latitude,
      required String longitude}) async {
    try {
      var jsonData;
      showLoading();

      var request = http.MultipartRequest(
        'PUT',
        Uri.parse('$baseUrl/hewan/$kodeEartagNasional'),
      );

      request.fields.addAll({
        "kodeEartagNasional": kodeEartagNasional,
        "noKartuTernak": noKartuTernak,
        "provinsi": provinsi,
        "kabupaten": kabupaten,
        "kecamatan": kecamatan,
        "desa": desa,
        "alamat": alamat,
        // "namaPeternak": namaPeternak,
        "idPeternak": idPeternak,
        "idKandang": idKandang,
        //  "nikPeternak": nikPeternak,
        "spesies": spesies,
        "sex": sex,
        "umur": umur,
        "identifikasiHewan": identifikasiHewan,
        "petugasPendaftar": petugasPendaftar,
        "tanggalTerdaftar": tanggalTerdaftar,

        "latitude": latitude,
        "longitude": longitude,
      });
      if (fotoHewan != null) {
        var imageField = http.MultipartFile(
          'file',
          fotoHewan.readAsBytes().asStream(),
          fotoHewan.lengthSync(),
          filename: fotoHewan.path.split("/").last,
        );
        request.files.add(imageField);
      }
      request.headers.addAll(
        {
          ...getToken(),
          'Content-Type': 'multipart/form-data',
        },
      );

      var response = await request.send();
      var responseData = await response.stream.transform(utf8.decoder).toList();
      var responseString = responseData.join('');
      jsonData = json.decode(responseString);
      stopLoading();
      if (response.statusCode == 201) {
        jsonData['statusCode'] = 201;
        print(response.contentLength);
        print(jsonData['alamat']);
        return HewanModel.fromJson({
          "status": 201,
          "kodeEartagNasional": jsonData['kodeEartagNasional'],
          "noKartuTernak": jsonData['noKartuTernak'],
          "provinsi": jsonData['provinsi'],
          "kabupaten": jsonData['kabupaten'],
          "kecamatan": jsonData['kecamatan'],
          "desa": jsonData['desa'],
          "alamat": jsonData['alamat'],
          // "namaPeternak": jsonData['namaPeternak'],
          "idPeternak": jsonData['idPeternak'],
          "idKandang": jsonData['idKandang'],
          //  "nikPeternak": jsonData['nikPeternak'],
          "spesies": jsonData['spesies'],
          "sex": jsonData['sex'],
          "umur": jsonData['umur'],
          "identifikasiHewan": jsonData['identifikasiHewan'],
          "petugasPendaftar": jsonData['petugasPendaftar'],
          "tanggalTerdaftar": jsonData['tanggalTerdaftar'],
          "fotoHewan": jsonData['fotoHewan'],
          "latitude": jsonData['latitude'],
          "longitude": jsonData['longitude'],
        });
      } else {
        showErrorMessage(jsonData?['message']);
        return HewanModel.fromJson({"status": response.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return HewanModel.fromJson({"status": 404});
    }
  }

  // Future<HewanModel?> editHewanApi(
  //   String kodeEartagNasional,
  //   String noKartuTernak,
  //   String provinsi,
  //   String kabupaten,
  //   String kecamatan,
  //   String desa,
  //   String namaPeternak,
  //   String idPeternak,
  //   String nikPeternak,
  //   String spesies,
  //   String sex,
  //   String umur,
  //   String identifikasiHewan,
  //   String petugasPendaftar,
  //   String tanggalTerdaftar,
  // ) async {
  //   try {
  //     var jsonData;
  //     showLoading();
  //     var bodyDataedit = {
  //       "kodeEartagNasional": kodeEartagNasional,
  //       "noKartuTernak": noKartuTernak,
  //       "provinsi": provinsi,
  //       "kabupaten": kabupaten,
  //       "kecamatan": kecamatan,
  //       "desa": desa,
  //       "namaPeternak": namaPeternak,
  //       "idPeternak": idPeternak,
  //       "nikPeternak": nikPeternak,
  //       "spesies": spesies,
  //       "sex": sex,
  //       "umur": umur,
  //       "identifikasiHewan": identifikasiHewan,
  //       "petugasPendaftar": petugasPendaftar,
  //       "tanggalTerdaftar": tanggalTerdaftar,
  //     };

  //     var data = await http.put(
  //       Uri.parse(baseUrl + '/hewan/' ),
  //       headers: {...getToken(), 'Content-Type': 'application/json'},
  //       body: jsonEncode(bodyDataedit),
  //     );
  //     //print(data.body);
  //     stopLoading();

  //     jsonData = json.decode(data.body);
  //     if (data.statusCode == 201) {
  //       jsonData['statusCode'] = 201;
  //       // print(data.body);
  //       // print(jsonData);
  //       return HewanModel.fromJson(jsonData);
  //     } else {
  //       showErrorMessage(jsonData['message']);
  //       return HewanModel.fromJson({"status": data.statusCode});
  //     }
  //   } on Exception catch (_) {
  //     stopLoading();
  //     showInternetMessage("Periksa koneksi internet anda");
  //     return HewanModel.fromJson({"status": 404});
  //   }
  // }

  //DELETE
  Future<HewanModel?> deleteHewanApi(String eartagHewanDetail) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.delete(
        Uri.parse('$baseUrl/hewan/$eartagHewanDetail'),
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
        return HewanModel.fromJson({"status": 200});
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
