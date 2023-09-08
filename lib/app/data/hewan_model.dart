import 'package:crud_flutter_api/app/data/hewan_model.dart';

class HewanModel {
  final int? id;
  final String? eartag;
  final String? kartu;
  final String? nik;
  final String? idPeternak;
  final String? namaPeternak;
  final String? provinsi;
  final String? kabupaten;
  final String? kecamatan;
  final String? desa;
  final String? identifikasi;
  final String? kelamin;
  final String? spesies;
  final String? umur;
  final String? petugasPendaftar;
  final String? tanggalTerdaftar;

  final int? status;

  HewanModel({
    this.id,
    this.status,
    this.eartag,
    this.kartu,
    this.nik,
    this.idPeternak,
    this.namaPeternak,
    this.provinsi,
    this.kabupaten,
    this.kecamatan,
    this.desa,
    this.identifikasi,
    this.kelamin,
    this.spesies,
    this.umur,
    this.petugasPendaftar,
    this.tanggalTerdaftar,
  });

  factory HewanModel.fromJson(Map<String, dynamic> jsonData) {
    return HewanModel(
      status: jsonData['status'] != null ? jsonData['status'] : 0,
      eartag: jsonData['eartag'] != null ? jsonData['eartag'] : "",
      kartu: jsonData['kartu'] != null ? jsonData['kartu'] : "",
      nik: jsonData['nik'] != null ? jsonData['nik'] : "",
      idPeternak: jsonData['idPeternak'] != null ? jsonData['idPeternak'] : "",
      namaPeternak: jsonData['namaPeternak'] != null ? jsonData['namaPeternak'] : "",
      provinsi: jsonData['provinsi'] != null ? jsonData['provinsi'] : "",
      kabupaten: jsonData['kabupaten'] != null ? jsonData['kabupaten'] : "",
      kecamatan: jsonData['kecamatan'] != null ? jsonData['kecamatan'] : "",
      desa: jsonData['desa'] != null ? jsonData['desa'] : "",
      identifikasi: jsonData['identifikasi'] != null ? jsonData['identifikasi'] : "",
      kelamin: jsonData['kelamin'] != null ? jsonData['kelamin'] : "",
      spesies: jsonData['spesies'] != null ? jsonData['spesies'] : "",
      umur: jsonData['umur'] != null ? jsonData['umur'] : "",
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
