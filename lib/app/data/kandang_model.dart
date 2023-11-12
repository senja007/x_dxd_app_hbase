import 'package:crud_flutter_api/app/data/hewan_model.dart';

class KandangModel {
  final String? idKandang;
  final IdPeternak? idPeternak;
  final String? namaPeternak;
  final String? luas;
  final String? kapasitas;
  final String? nilaiBangunan;
  final String? alamat;
  final String? desa;
  final String? kecamatan;
  final String? kabupaten;
  final String? provinsi;

  final int? status;

  KandangModel({
    this.status,
    this.idKandang,
    this.idPeternak,
    this.namaPeternak,
    this.luas,
    this.kapasitas,
    this.nilaiBangunan,
    this.alamat,
    this.desa,
    this.kecamatan,
    this.kabupaten,
    this.provinsi,
  });

  factory KandangModel.fromJson(Map<String, dynamic> jsonData) {
    return KandangModel(
      status: jsonData['status'] != null ? jsonData['status'] : 0,
      idKandang: jsonData['idKandang'] != null ? jsonData['idKandang'] : "",
      idPeternak: IdPeternak.fromJson(jsonData["idPeternak"]),
      namaPeternak:
          jsonData['namaPeternak'] != null ? jsonData['namaPeternak'] : "",
      luas: jsonData['luas'] != null ? jsonData['luas'] : "",
      kapasitas: jsonData['kapasitas'] != null ? jsonData['kapasitas'] : "",
      nilaiBangunan:
          jsonData['nilaiBangunan'] != null ? jsonData['nilaiBangunan'] : "",
      alamat: jsonData['alamat'] != null ? jsonData['alamat'] : "",
      desa: jsonData['desa'] != null ? jsonData['desa'] : "",
      kecamatan: jsonData['kecamatan'] != null ? jsonData['kecamatan'] : "",
      kabupaten: jsonData['kabupaten'] != null ? jsonData['kabupaten'] : "",
      provinsi: jsonData['provinsi'] != null ? jsonData['provinsi'] : "",
    );
  }
}

class KandangListModel {
  final int? status; // 200 - 204 - 400 - 404
  final List<KandangModel>? content;
  final int? page;
  final int? size;
  final int? totalElements;
  final int? totalPages;
  KandangListModel(
      {this.status,
      this.content,
      this.page,
      this.size,
      this.totalElements,
      this.totalPages});
  factory KandangListModel.fromJson(Map<String, dynamic> jsonData) {
    return KandangListModel(
        status: jsonData['status'],
        content: jsonData['content']
            .map<KandangModel>((data) => KandangModel.fromJson(data))
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
