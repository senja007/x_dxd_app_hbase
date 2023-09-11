import 'package:crud_flutter_api/app/data/hewan_model.dart';

class HewanModel {
  final String? kodeEartagNasional;
  final String? noKartuTernak;
  final String? provinsi;
  final String? kabupaten;
  final String? kecamatan;
  final String? desa;
  final String? namaPeternak;
  final String? idPeternak;
  final String? nikPeternak;
  final String? spesies;
  final String? sex;
  final String? umur;
  final String? identifikasiHewan;
  final String? petugasPendaftar;
  final String? tanggalTerdaftar;

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
  });

  factory HewanModel.fromJson(Map<String, dynamic> jsonData) {
    return HewanModel(
      status: jsonData['status'] != null ? jsonData['status'] : 0,
      kodeEartagNasional: jsonData['kodeEartagNasional'] != null ? jsonData['kodeEartagNasional'] : "",
      noKartuTernak: jsonData['noKartuTernak'] != null ? jsonData['noKartuTernak'] : "",
      provinsi: jsonData['provinsi'] != null ? jsonData['provinsi'] : "",
      kabupaten: jsonData['kabupaten'] != null ? jsonData['kabupaten'] : "",
      kecamatan: jsonData['kecamatan'] != null ? jsonData['kecamatan'] : "",
      desa: jsonData['desa'] != null ? jsonData['desa'] : "",
      namaPeternak: jsonData['namaPeternak'] != null ? jsonData['namaPeternak'] : "",
      idPeternak: jsonData['idPeternak'] != null ? jsonData['idPeternak'] : "",
      nikPeternak: jsonData['nikPeternak'] != null ? jsonData['nikPeternak'] : "",
      spesies: jsonData['spesies'] != null ? jsonData['spesies'] : "",
      sex: jsonData['sex'] != null ? jsonData['sex'] : "",
      umur: jsonData['umur'] != null ? jsonData['umur'] : "",
      identifikasiHewan: jsonData['identifikasiHewan'] != null ? jsonData['identifikasiHewan'] : "",
      petugasPendaftar: jsonData['petugasPendaftar'] != null ? jsonData['petugasPendaftar'] : "",
      tanggalTerdaftar: jsonData['tanggalTerdaftar'] != null ? jsonData['tanggalTerdaftar'] : "",
    );
  }
}

class HewanListModel {
  final int? status; // 200 - 204 - 400 - 404
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
