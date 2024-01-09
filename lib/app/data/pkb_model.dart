
class PKBModel {
  final int? status;

  final String? idKejadian;
  final String? tanggalPkb;
  final String? lokasi;
  final IdPeternak? idPeternak;
  final String? idHewan;
  final String? spesies;
  final String? kategori;
  final String? jumlah;
  final String? umurKebuntingan;
  final String? pemeriksaKebuntingan;

  PKBModel({
    this.status,
    this.idKejadian,
    this.tanggalPkb,
    this.lokasi,
    this.idPeternak,
    this.idHewan,
    this.spesies,
    this.kategori,
    this.jumlah,
    this.umurKebuntingan,
    this.pemeriksaKebuntingan,
  });

  factory PKBModel.fromJson(Map<String, dynamic> jsonData) {
    return PKBModel(
      status: jsonData['status'] ?? 0,
      idKejadian: jsonData['idKejadian'] ?? "",
      tanggalPkb: jsonData['tanggalPkb'] ?? "",
      lokasi: jsonData['lokasi'] ?? "",
      idPeternak: jsonData['idPeternak'] != null
          ? IdPeternak.fromJson(jsonData['idPeternak'])
          : null,
      idHewan: jsonData['idHewan'] ?? "",
      spesies: jsonData['spesies'] ?? "",
      kategori: jsonData['kategori'] ?? "",
      jumlah: jsonData['jumlah'] ?? "",
      umurKebuntingan: jsonData['umurKebuntingan'] ?? "",
      pemeriksaKebuntingan: jsonData['pemeriksaKebuntingan'] ?? "",
    );
  }
}

class PKBListModel {
  final int? status; // 200 - 204 - 400 - 404
  final List<PKBModel>? content;
  final int? page;
  final int? size;
  final int? totalElements;
  final int? totalPages;
  PKBListModel(
      {this.status,
      this.content,
      this.page,
      this.size,
      this.totalElements,
      this.totalPages});
  factory PKBListModel.fromJson(Map<String, dynamic> jsonData) {
    return PKBListModel(
        status: jsonData['status'],
        content: jsonData['content']
            .map<PKBModel>((data) => PKBModel.fromJson(data))
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
