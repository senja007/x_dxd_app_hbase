import 'package:crud_flutter_api/app/data/hewan_model.dart';

class InseminasiModel {
  final String? idInseminasi;
  final String? tanggalIB;
  final String? lokasi;
  final IdPeternak? idPeternak;
  final String? idHewan;
  final String? eartag;
  final String? ib1;
  final String? ib2;
  final String? ib3;
  final String? ibLain;
  final String? idPejantan;
  final String? idPembuatan;
  final String? bangsaPejantan;
  final String? produsen;
  final String? inseminator;

  final int? status;

  InseminasiModel({
    this.status,
    this.idInseminasi,
    this.eartag,
    this.idHewan,
    this.idPembuatan,
    this.idPejantan,
    this.bangsaPejantan,
    this.ib1,
    this.ib2,
    this.ib3,
    this.ibLain,
    this.produsen,
    this.idPeternak,
    this.lokasi,
    this.inseminator,
    this.tanggalIB,
  });

  factory InseminasiModel.fromJson(Map<String, dynamic> jsonData) {
    return InseminasiModel(
      status: jsonData['status'] != null ? jsonData['status'] : 0,
      idInseminasi:
          jsonData['idInseminasi'] != null ? jsonData['idInseminasi'] : "",
      eartag: jsonData['eartag'] != null ? jsonData['eartag'] : "",
      idHewan: jsonData['idHewan'] != null ? jsonData['idHewan'] : "",
      idPembuatan:
          jsonData['idPembuatan'] != null ? jsonData['idPembuatan'] : "",
      idPejantan: jsonData['idPejantan'] != null ? jsonData['idPejantan'] : "",
      bangsaPejantan:
          jsonData['bangsaPejantan'] != null ? jsonData['bangsaPejantan'] : "",
      ib1: jsonData['ib1'] != null ? jsonData['ib1'] : "",
      ib2: jsonData['ib2'] != null ? jsonData['ib2'] : "",
      ib3: jsonData['ib3'] != null ? jsonData['ib3'] : "",
      ibLain: jsonData['ibLain'] != null ? jsonData['ibLain'] : "",
      produsen: jsonData['produsen'] != null ? jsonData['produsen'] : "",
      idPeternak: jsonData['idPeternak'] != null
          ? IdPeternak.fromJson(jsonData['idPeternak'])
          : null,
      lokasi: jsonData['lokasi'] != null ? jsonData['lokasi'] : "",
      inseminator:
          jsonData['inseminator'] != null ? jsonData['inseminator'] : "",
      tanggalIB: jsonData['tanggalIB'] != null ? jsonData['tanggalIB'] : "",
    );
  }
}

class InseminasiListModel {
  final int? status; // 200 - 204 - 400 - 404
  final List<InseminasiModel>? content;
  final int? page;
  final int? size;
  final int? totalElements;
  final int? totalPages;
  InseminasiListModel(
      {this.status,
      this.content,
      this.page,
      this.size,
      this.totalElements,
      this.totalPages});
  factory InseminasiListModel.fromJson(Map<String, dynamic> jsonData) {
    return InseminasiListModel(
        status: jsonData['status'],
        content: jsonData['content']
            .map<InseminasiModel>((data) => InseminasiModel.fromJson(data))
            .toList(),
        page: jsonData['page'],
        size: jsonData['size'],
        totalElements: jsonData['totalElements'],
        totalPages: jsonData['totalPages']);
  }
}

class IdPeternak {
  DateTime createdAt;
  DateTime updatedAt;
  int createdBy;
  int updatedBy;
  String idPeternak;
  String nikPeternak;
  String namaPeternak;
  String idIsikhnas;
  String lokasi;
  String petugasPendaftar;
  String tanggalPendaftaran;

  IdPeternak({
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.idPeternak,
    required this.nikPeternak,
    required this.namaPeternak,
    required this.idIsikhnas,
    required this.lokasi,
    required this.petugasPendaftar,
    required this.tanggalPendaftaran,
  });

  factory IdPeternak.fromJson(Map<String, dynamic> json) => IdPeternak(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        idPeternak: json["idPeternak"],
        nikPeternak: json["nikPeternak"],
        namaPeternak: json["namaPeternak"],
        idIsikhnas: json["idISIKHNAS"],
        lokasi: json["lokasi"],
        petugasPendaftar: json["petugasPendaftar"],
        tanggalPendaftaran: json["tanggalPendaftaran"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "idPeternak": idPeternak,
        "nikPeternak": nikPeternak,
        "namaPeternak": namaPeternak,
        "idISIKHNAS": idIsikhnas,
        "lokasi": lokasi,
        "petugasPendaftar": petugasPendaftar,
        "tanggalPendaftaran": tanggalPendaftaran,
      };
}
