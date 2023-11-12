import 'package:crud_flutter_api/app/data/hewan_model.dart';

class HewanModel {
  final String? kodeEartagNasional;
  final String? noKartuTernak;
  final String? provinsi;
  final String? kabupaten;
  final String? kecamatan;
  final String? desa;
  final String? namaPeternak;
  final IdPeternak? idPeternak;
  final String? nikPeternak;
  final String? spesies;
  final String? sex;
  final String? umur;
  final String? identifikasiHewan;
  final String? petugasPendaftar;
  final String? tanggalTerdaftar;
  final String? fotoHewan;

  final int? status;

  HewanModel({
    this.status,
    this.kodeEartagNasional,
    this.noKartuTernak,
    this.provinsi,
    this.kabupaten,
    this.kecamatan,
    this.desa,
    this.namaPeternak,
    this.idPeternak,
    this.nikPeternak,
    this.spesies,
    this.sex,
    this.umur,
    this.identifikasiHewan,
    this.petugasPendaftar,
    this.tanggalTerdaftar,
    this.fotoHewan,
  });

  factory HewanModel.fromJson(Map<String, dynamic> jsonData) {
    return HewanModel(
      status: jsonData['status'] != null ? jsonData['status'] : 0,
      kodeEartagNasional: jsonData['kodeEartagNasional'] != null
          ? jsonData['kodeEartagNasional']
          : "",
      noKartuTernak:
          jsonData['noKartuTernak'] != null ? jsonData['noKartuTernak'] : "",
      provinsi: jsonData['provinsi'] != null ? jsonData['provinsi'] : "",
      kabupaten: jsonData['kabupaten'] != null ? jsonData['kabupaten'] : "",
      kecamatan: jsonData['kecamatan'] != null ? jsonData['kecamatan'] : "",
      desa: jsonData['desa'] != null ? jsonData['desa'] : "",
      namaPeternak:
          jsonData['namaPeternak'] != null ? jsonData['namaPeternak'] : "",
      idPeternak: IdPeternak.fromJson(jsonData["idPeternak"]),
      nikPeternak:
          jsonData['nikPeternak'] != null ? jsonData['nikPeternak'] : "",
      spesies: jsonData['spesies'] != null ? jsonData['spesies'] : "",
      sex: jsonData['sex'] != null ? jsonData['sex'] : "",
      umur: jsonData['umur'] != null ? jsonData['umur'] : "",
      identifikasiHewan: jsonData['identifikasiHewan'] != null
          ? jsonData['identifikasiHewan']
          : "",
      petugasPendaftar: jsonData['petugasPendaftar'] != null
          ? jsonData['petugasPendaftar']
          : "",
      tanggalTerdaftar: jsonData['tanggalTerdaftar'] != null
          ? jsonData['tanggalTerdaftar']
          : "",
      fotoHewan: jsonData['fotoHewan'] != null ? jsonData['fotoHewan'] : "",
    );
  }
}

class HewanListModel {
  final int? status; //200 - 204 - 400 - 404
  final List<HewanModel>? content;
  final int? page;
  final int? size;
  final int? totalElements;
  final int? totalPages;
  HewanListModel(
      {this.status,
      this.content,
      this.page,
      this.size,
      this.totalElements,
      this.totalPages});
  factory HewanListModel.fromJson(Map<String, dynamic> jsonData) {
    return HewanListModel(
        status: jsonData['status'],
        content: jsonData['content']
            .map<HewanModel>((data) => HewanModel.fromJson(data))
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
