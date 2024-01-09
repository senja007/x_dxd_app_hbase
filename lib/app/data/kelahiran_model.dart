class KelahiranModel {
  final int? status;
  final String? idKejadian;
  final String? tanggalLaporan;
  final String? tanggalLahir;
  final String? lokasi;
  final String? namaPeternak;
  final IdPeternak? idPeternak;
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
  final String? petugasPelapor;
  final String? urutanIb;

  KelahiranModel({
    this.status,
    this.idKejadian,
    this.tanggalLaporan,
    this.tanggalLahir,
    this.lokasi,
    this.namaPeternak,
    this.idPeternak,
    this.kartuTernakInduk,
    this.eartagInduk,
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
      tanggalLaporan:
          jsonData['tanggalLaporan'] ?? "",
      tanggalLahir:
          jsonData['tanggalLahir'] ?? "",
      lokasi: jsonData['lokasi'] ?? "",
      namaPeternak:
          jsonData['namaPeternak'] ?? "",
      idPeternak: IdPeternak.fromJson(jsonData["idPeternak"]),
      kartuTernakInduk: jsonData['kartuTernakInduk'] ?? "",
      eartagInduk:
          jsonData['eartagInduk'] ?? "",
      idHewanInduk:
          jsonData['idHewanInduk'] ?? "",
      spesiesInduk:
          jsonData['spesiesInduk'] ?? "",
      idPejantanStraw: jsonData['idPejantanStraw'] ?? "",
      idBatchStraw:
          jsonData['idBatchStraw'] ?? "",
      produsenStraw:
          jsonData['produsenStraw'] ?? "",
      spesiesPejantan: jsonData['spesiesPejantan'] ?? "",
      jumlah: jsonData['jumlah'] ?? "",
      kartuTernakAnak: jsonData['kartuTernakAnak'] ?? "",
      eartagAnak: jsonData['eartagAnak'] ?? "",
      idHewanAnak:
          jsonData['idHewanAnak'] ?? "",
      jenisKelaminAnak: jsonData['jenisKelaminAnak'] ?? "",
      kategori: jsonData['kategori'] ?? "",
      petugasPelapor:
          jsonData['petugasPelapor'] ?? "",
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
