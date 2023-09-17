class KelahiranModel {
  final int? id;
  final int? status;
  final String? idKejadian;
  final String? tanggalLaporan;
  final String? tanggalLahir;
  final String? lokasi;
  final String? namaPeternak;
  final String? idPeternak;
  final String? kartuTernakInduk;
  final String? eartagInduk;
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
  final String? urutanIb;
  final String? petugasPelapor;

  KelahiranModel({
    this.status,
    this.id,
    this.idKejadian,
    this.eartagInduk,
    this.eartagAnak,
    this.idHewanInduk,
    this.idHewanAnak,
    this.idBatchStraw,
    this.idPejantanStraw,
    this.jenisKelaminAnak,
    this.jumlah,
    this.urutanIb,
    this.kartuTernakAnak,
    this.kartuTernakInduk,
    this.kategori,
    this.lokasi,
    this.idPeternak,
    this.namaPeternak,
    this.petugasPelapor,
    this.produsenStraw,
    this.spesiesInduk,
    this.spesiesPejantan,
    this.tanggalLahir,
    this.tanggalLaporan,
  });

  factory KelahiranModel.fromJson(Map<String, dynamic> jsonData) {
    return KelahiranModel(
      status: jsonData['status'] != null ? jsonData['status'] : 0,
      id: jsonData['id'] != null ? jsonData['id'] : 0,
      idKejadian: jsonData['idKejadian'] != null ? jsonData['idKejadian'] : "",
      eartagInduk:
          jsonData['eartagInduk'] != null ? jsonData['eartagInduk'] : "",
      eartagAnak: jsonData['eartagAnak'] != null ? jsonData['eartagAnak'] : "",
      idHewanInduk:
          jsonData['idHewanInduk'] != null ? jsonData['idHewanInduk'] : "",
      idHewanAnak:
          jsonData['idHewanAnak'] != null ? jsonData['idHewanAnak'] : "",
      idBatchStraw:
          jsonData['idBatchStraw'] != null ? jsonData['idBatchStraw'] : "",
      idPejantanStraw: jsonData['idPejantanStraw'] != null
          ? jsonData['idPejantanStraw']
          : "",
      jenisKelaminAnak: jsonData['jenisKelaminAnak'] != null
          ? jsonData['jenisKelaminAnak']
          : "",
      jumlah: jsonData['jumlah'] != null ? jsonData['jumlah'] : "",
      urutanIb: jsonData['urutanIb'] != null ? jsonData['urutanIb'] : "",
      kartuTernakAnak: jsonData['kartuTernakAnak'] != null
          ? jsonData['kartuTernakAnak']
          : "",
      kartuTernakInduk: jsonData['kartuTernakInduk'] != null
          ? jsonData['kartuTernakInduk']
          : "",
      kategori: jsonData['kategori'] != null ? jsonData['kategori'] : "",
      lokasi: jsonData['lokasi'] != null ? jsonData['lokasi'] : "",
      idPeternak: jsonData['idPeternak'] != null ? jsonData['idPeternak'] : "",
      namaPeternak:
          jsonData['namaPeternak'] != null ? jsonData['namaPeternak'] : "",
      petugasPelapor:
          jsonData['petugasPelapor'] != null ? jsonData['petugasPelapor'] : "",
      produsenStraw:
          jsonData['produsenStraw'] != null ? jsonData['produsenStraw'] : "",
      spesiesInduk:
          jsonData['spesiesInduk'] != null ? jsonData['spesiesInduk'] : "",
      spesiesPejantan: jsonData['spesiesPejantan'] != null
          ? jsonData['spesiesPejantan']
          : "",
      tanggalLahir:
          jsonData['tanggalLahir'] != null ? jsonData['tanggalLahir'] : "",
      tanggalLaporan:
          jsonData['tanggalLaporan'] != null ? jsonData['tanggalLaporan'] : "",
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
