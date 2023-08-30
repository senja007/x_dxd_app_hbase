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
  final String? petugasPelopor;
  final String? urutanIb;
 

  KelahiranModel({
    this.status,
    this.id,
    this.idKejadian ,
    this.tanggalLaporan ,
    this.tanggalLahir ,
    this.lokasi ,
    this.namaPeternak ,
    this.idPeternak ,
    this.kartuTernakInduk ,
    this.eartagInduk ,
    this.idHewanInduk ,
    this.spesiesInduk ,
    this.idPejantanStraw ,
    this.idBatchStraw ,
    this.produsenStraw ,
    this.spesiesPejantan ,
    this.jumlah ,
    this.kartuTernakAnak ,
    this.eartagAnak ,
    this.idHewanAnak ,
    this.jenisKelaminAnak ,
    this.kategori ,
    this.petugasPelopor ,
    this.urutanIb ,
  });

  factory KelahiranModel.fromJson(Map<String, dynamic> jsonData) {
    return KelahiranModel(
      status: jsonData['status'] != null ? jsonData['status'] : 0,
      id: jsonData['id'] != null ? jsonData['id'] : 0,
      idKejadian:
          jsonData['idKejadian'] != null ? jsonData['idKejadian'] : "",
      tanggalLaporan: jsonData['tanggalLaporan'] != null ? jsonData['tanggalLaporan'] : "",
      tanggalLahir: jsonData['tanggalLahir'] != null ? jsonData['tanggalLahir'] : "",
      lokasi: jsonData['lokasi'] != null ? jsonData['lokasi'] : "",
      namaPeternak: jsonData['namaPeternak'] != null ? jsonData['namaPeternak'] : "",
      idPeternak: jsonData['idPeternak'] != null ? jsonData['idPeternak'] : "",
      kartuTernakInduk: jsonData['kartuTernakInduk'] != null ? jsonData['kartuTernakInduk'] : "",
      eartagInduk: jsonData['eartagInduk'] != null ? jsonData['eartagInduk'] : "",
      idHewanInduk: jsonData['idHewanInduk'] != null ? jsonData['idHewanInduk'] : "",
      spesiesInduk: jsonData['spesiesInduk'] != null ? jsonData['spesiesInduk'] : "",
      idPejantanStraw: jsonData['idPejantanStraw'] != null ? jsonData['idPejantanStraw'] : "",
      idBatchStraw: jsonData['idBatchStraw'] != null ? jsonData['idBatchStraw'] : "",
      produsenStraw: jsonData['produsenStraw'] != null ? jsonData['produsenStraw'] : "",
      spesiesPejantan: jsonData['spesiesPejantan'] != null ? jsonData['spesiesPejantan'] : "",
      jumlah: jsonData['jumlah'] != null ? jsonData['jumlah'] : "",
      kartuTernakAnak: jsonData['kartuTernakAnak'] != null ? jsonData['kartuTernakAnak'] : "",
      eartagAnak: jsonData['eartagAnak'] != null ? jsonData['eartagAnak'] : "",
      jenisKelaminAnak: jsonData['jenisKelaminAnak'] != null ? jsonData['jenisKelaminAnak'] : "",
      kategori: jsonData['kategori'] != null ? jsonData['kategori'] : "",
      petugasPelopor: jsonData['petugasPelopor'] != null ? jsonData['petugasPelopor'] : "",
      urutanIb: jsonData['urutanIb'] != null ? jsonData['urutanIb'] : "",
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
