import 'dart:convert';

import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/utils/api.dart';
import 'package:http/http.dart' as http;

class PetugasApi extends SharedApi {
  Future<List<PetugasModel>> getAllPetugas() async {
    final allPetugasUrl = Uri.parse(baseUrl + "/petugas");
    final response = await http.get(allPetugasUrl, headers: getToken());

    if (response.statusCode == 200) {
      List<PetugasModel> allPetugas = [];
      List<dynamic> body = json.decode(response.body);
      body.forEach((petugas) {
        allPetugas.add(PetugasModel.fromJson(petugas));
      });

      return allPetugas;
    } else {
      throw Exception("Failed to load petugas");
    }
  }
}

//   Future<PetugasModel> loadPetugasAPI() async {
//     try {
//       var data =
//           await http.get(Uri.parse(baseUrl + '/petugas'), headers: getToken());
//       print("hasil" + data.statusCode.toString());
//       print(data.body);
//       if (data.statusCode == 200) {
//         var jsonData = json.decode(data.body);
//         jsonData['id'] = jsonData['id'];
//         print(jsonData);
//         print(data.body);

//         return PetugasModel.fromJson({"status": 200, "content": jsonData});
//       } else {
//         return PetugasModel.fromJson(
//             {"status": data.statusCode, "content": []});
//       }
//     } on Exception catch (_) {
//       return PetugasModel.fromJson({"status": 404, "content": []});
//     }
//   }
// }

