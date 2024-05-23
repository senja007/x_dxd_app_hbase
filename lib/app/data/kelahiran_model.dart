import 'package:crud_flutter_api/app/data/hewan_model.dart';
import 'package:crud_flutter_api/app/data/peternak_model.dart';
import 'package:crud_flutter_api/app/data/petugas_model.dart';

class KelahiranModel {
  final int? status;
  final String? idKejadian;
  final String? tanggalLaporan;
  final String? tanggalLahir;
  final String? lokasi;
  final PeternakModel? idPeternak;
  //final String? namaPeternak;
  final String? kartuTernakInduk;
  final String? eartagInduk;
  final HewanModel? kodeEartagNasional;
  final String? idHewanInduk;
  final String? spesiesInduk;
  final String? idPejantanStraw;
  final String? idBatchStraw;
  final String? produsenStraw;
  final String? spesiesPejantan;
  final String? jumlah;
  final String? kartuTernakAnak;
  final String? eartagAnak;
  final String? idHewanAnak;
  final String? jenisKelaminAnak;
  final String? kategori;
  final PetugasModel? petugasPelapor;
  final String? urutanIb;

  KelahiranModel({
    this.status,
    this.idKejadian,
    this.tanggalLaporan,
    this.tanggalLahir,
    this.lokasi,
    this.idPeternak,
    //this.namaPeternak,
    this.kartuTernakInduk,
    this.eartagInduk,
    this.kodeEartagNasional,
    this.idHewanInduk,
    this.spesiesInduk,
    this.idPejantanStraw,
    this.idBatchStraw,
    this.produsenStraw,
    this.spesiesPejantan,
    this.jumlah,
    this.kartuTernakAnak,
    this.eartagAnak,
    this.idHewanAnak,
    this.jenisKelaminAnak,
    this.kategori,
    this.petugasPelapor,
    this.urutanIb,
  });

  factory KelahiranModel.fromJson(Map<String, dynamic> jsonData) {
    return KelahiranModel(
      status: jsonData['status'] ?? 0,
      idKejadian: jsonData['idKejadian'] ?? "",
      tanggalLaporan: jsonData['tanggalLaporan'] ?? "",
      tanggalLahir: jsonData['tanggalLahir'] ?? "",
      lokasi: jsonData['lokasi'] ?? "",
      idPeternak: jsonData['idPeternak'] != null
          ? PeternakModel.fromJson(jsonData['idPeternak'])
          : null,
      //namaPeternak: jsonData['namaPeternak'] ?? "",
      kartuTernakInduk: jsonData['kartuTernakInduk'] ?? "",
      eartagInduk: jsonData['eartagInduk'] ?? "",
      kodeEartagNasional: jsonData['kodeEartagNasional'] != null
          ? HewanModel.fromJson(jsonData['kodeEartagNasional'])
          : null,
      idHewanInduk: jsonData['idHewanInduk'] ?? "",
      spesiesInduk: jsonData['spesiesInduk'] ?? "",
      idPejantanStraw: jsonData['idPejantanStraw'] ?? "",
      idBatchStraw: jsonData['idBatchStraw'] ?? "",
      produsenStraw: jsonData['produsenStraw'] ?? "",
      spesiesPejantan: jsonData['spesiesPejantan'] ?? "",
      jumlah: jsonData['jumlah'] ?? "",
      kartuTernakAnak: jsonData['kartuTernakAnak'] ?? "",
      eartagAnak: jsonData['eartagAnak'] ?? "",
      idHewanAnak: jsonData['idHewanAnak'] ?? "",
      jenisKelaminAnak: jsonData['jenisKelaminAnak'] ?? "",
      kategori: jsonData['kategori'] ?? "",
      petugasPelapor: jsonData['petugasPelapor'] != null
          ? PetugasModel.fromJson(jsonData['petugasPelapor'])
          : null,
      urutanIb: jsonData['urutanIb'] ?? "",
    );
  }
}

class KelahiranListModel {
  final int? status; // 200 - 204 - 400 - 404
  final List<KelahiranModel>? content;
  final int? page;
  final int? size;
  final int? totalElements;
  final int? totalPages;
  KelahiranListModel(
      {this.status,
      this.content,
      this.page,
      this.size,
      this.totalElements,
      this.totalPages});
  factory KelahiranListModel.fromJson(Map<String, dynamic> jsonData) {
    return KelahiranListModel(
        status: jsonData['status'],
        content: jsonData['content']
            .map<KelahiranModel>((data) => KelahiranModel.fromJson(data))
            .toList(),
        page: jsonData['page'],
        size: jsonData['size'],
        totalElements: jsonData['totalElements'],
        totalPages: jsonData['totalPages']);
  }
}
