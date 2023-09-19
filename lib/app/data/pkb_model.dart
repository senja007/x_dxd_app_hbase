class PKBModel {
  final int? status;

  final String? idKejadian;
  final String? tanggalPkb;
  final String? lokasi;
  final String? namaPeternak;
  final String? idPeternak;
  final String? nikPeternak;
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
    this.namaPeternak,
    this.idPeternak,
    this.nikPeternak,
    this.idHewan,
    this.spesies,
    this.kategori,
    this.jumlah,
    this.umurKebuntingan,
    this.pemeriksaKebuntingan,
  });

  factory PKBModel.fromJson(Map<String, dynamic> jsonData) {
    return PKBModel(
      status: jsonData['status'] != null ? jsonData['status'] : 0,
      idKejadian: jsonData['idKejadian'] != null ? jsonData['idKejadian'] : "",
      tanggalPkb: jsonData['tanggalPkb'] != null ? jsonData['tanggalPkb'] : "",
      lokasi: jsonData['lokasi'] != null ? jsonData['lokasi'] : "",
      namaPeternak:jsonData['namaPeternak'] != null ? jsonData['namaPeternak'] : "",
      idPeternak: jsonData['idPeternak'] != null ? jsonData['idPeternak'] : "",
      nikPeternak:jsonData['nikPeternak'] != null ? jsonData['nikPeternak'] : "",
      idHewan: jsonData['idHewan'] != null ? jsonData['idHewan'] : "",
      spesies: jsonData['spesies'] != null ? jsonData['spesies'] : "",
      kategori: jsonData['kategori'] != null ? jsonData['kategori'] : "",
      jumlah: jsonData['jumlah'] != null ? jsonData['jumlah'] : "",
      umurKebuntingan: jsonData['umurKebuntingan'] != null? jsonData['umurKebuntingan']: "",
      pemeriksaKebuntingan: jsonData['pemeriksaKebuntingan'] != null? jsonData['pemeriksaKebuntingan']: "",
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
