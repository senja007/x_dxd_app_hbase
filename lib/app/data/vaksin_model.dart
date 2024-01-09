import 'package:crud_flutter_api/app/data/hewan_model.dart';
import 'package:crud_flutter_api/app/data/peternak_model.dart';

class VaksinModel {
  final int? status;
  final String? idVaksin;
  final String? tanggalIB;
  final String? lokasi;
  final String? namaPeternak;
  final PeternakModel? idPeternak;
  final HewanModel? kodeEartagNasional;
  final String? ib1;
  final String? ib2;
  final String? ib3;
  final String? ibLain;
  final String? idPejantan;
  final String? idPembuatan;
  final String? bangsaPejantan;
  final String? produsen;
  final String? inseminator;

  VaksinModel({
    this.status,
    this.idVaksin,
    this.tanggalIB,
    this.lokasi,
    this.namaPeternak,
    this.idPeternak,
    this.kodeEartagNasional,
    this.ib1,
    this.ib2,
    this.ib3,
    this.ibLain,
    this.idPejantan,
    this.idPembuatan,
    this.bangsaPejantan,
    this.produsen,
    this.inseminator,
  });

  factory VaksinModel.fromJson(Map<String, dynamic> jsonData) {
    return VaksinModel(
      status: jsonData['status'] ?? 0,
      idVaksin: jsonData['idVaksin'] ?? "",
      tanggalIB: jsonData['tanggalIB'] ?? "",
      lokasi: jsonData['lokasi'] ?? "",
      idPeternak: jsonData['idPeternak'] != null
          ? PeternakModel.fromJson(jsonData['idPeternak'])
          : null,
      kodeEartagNasional: jsonData['kodeEartagNasional'] != null
          ? HewanModel.fromJson(jsonData['kodeEartagNasional'])
          : null,
      ib1: jsonData['ib1'] ?? "",
      ib2: jsonData['ib2'] ?? "",
      ib3: jsonData['ib3'] ?? "",
      ibLain: jsonData['ibLain'] ?? "",
      idPejantan: jsonData['idPejantan'] ?? "",
      idPembuatan:
          jsonData['idPembuatan'] ?? "",
      bangsaPejantan:
          jsonData['bangsaPejantan'] ?? "",
      produsen: jsonData['produsen'] ?? "",
      inseminator:
          jsonData['inseminator'] ?? "",
    );
  }
}

class VaksinListModel {
  final int? status; // 200 - 204 - 400 - 404
  final List<VaksinModel>? content;
  final int? page;
  final int? size;
  final int? totalElements;
  final int? totalPages;
  VaksinListModel(
      {this.status,
      this.content,
      this.page,
      this.size,
      this.totalElements,
      this.totalPages});
  factory VaksinListModel.fromJson(Map<String, dynamic> jsonData) {
    return VaksinListModel(
        status: jsonData['status'],
        content: jsonData['content']
            .map<VaksinModel>((data) => VaksinModel.fromJson(data))
            .toList(),
        page: jsonData['page'],
        size: jsonData['size'],
        totalElements: jsonData['totalElements'],
        totalPages: jsonData['totalPages']);
  }
}

// class IdPeternak {
//   DateTime createdAt;
//   DateTime updatedAt;
//   int createdBy;
//   int updatedBy;
//   String idPeternak;
//   String nikPeternak;
//   String namaPeternak;
//   String idIsikhnas;
//   String lokasi;
//   String petugasPendaftar;
//   String tanggalPendaftaran;

//   IdPeternak({
//     required this.createdAt,
//     required this.updatedAt,
//     required this.createdBy,
//     required this.updatedBy,
//     required this.idPeternak,
//     required this.nikPeternak,
//     required this.namaPeternak,
//     required this.idIsikhnas,
//     required this.lokasi,
//     required this.petugasPendaftar,
//     required this.tanggalPendaftaran,
//   });

//   factory IdPeternak.fromJson(Map<String, dynamic> json) => IdPeternak(
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         createdBy: json["createdBy"],
//         updatedBy: json["updatedBy"],
//         idPeternak: json["idPeternak"],
//         nikPeternak: json["nikPeternak"],
//         namaPeternak: json["namaPeternak"],
//         idIsikhnas: json["idISIKHNAS"],
//         lokasi: json["lokasi"],
//         petugasPendaftar: json["petugasPendaftar"],
//         tanggalPendaftaran: json["tanggalPendaftaran"],
//       );

//   Map<String, dynamic> toJson() => {
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "createdBy": createdBy,
//         "updatedBy": updatedBy,
//         "idPeternak": idPeternak,
//         "nikPeternak": nikPeternak,
//         "namaPeternak": namaPeternak,
//         "idISIKHNAS": idIsikhnas,
//         "lokasi": lokasi,
//         "petugasPendaftar": petugasPendaftar,
//         "tanggalPendaftaran": tanggalPendaftaran,
//       };
// }
