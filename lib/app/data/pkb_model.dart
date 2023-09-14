class PKBModel {
  final int? status;
  final int? id;
  final String? idKejadian;
  final String? idHewan;
  final String? idPeternak;
  final String? nikPeternak;
  final String? namaPeternak;
  final String? jumlah;
  final String? kategori;
  final String? lokasi;
  final String? spesies;
  final String? umurKebuntingan;
  final String? pemeriksaKebuntingan;
  final String? tanggalPkb;

  PKBModel({
    this.status,
    this.id,
    this.idKejadian,
    this.idHewan,
    this.idPeternak,
    this.nikPeternak,
    this.namaPeternak,
    this.jumlah,
    this.kategori,
    this.lokasi,
    this.spesies,
    this.umurKebuntingan,
    this.pemeriksaKebuntingan,
    this.tanggalPkb,
    
  });

  factory PKBModel.fromJson(Map<String, dynamic> jsonData) {
    return PKBModel(
      status: jsonData['status'] != null ? jsonData['status'] : 0,
      id: jsonData['id'] != null ? jsonData['id'] : 0,
      idKejadian: jsonData['idKejadian'] != null ? jsonData['idKejadian'] : "",
      idHewan: jsonData['idHewan'] != null ? jsonData['idHewan'] : "",
      idPeternak: jsonData['idPeternak'] != null ? jsonData['idPeternak'] : "",
      nikPeternak: jsonData['nikPeternak'] != null ? jsonData['nikPeternak'] : "",
      namaPeternak: jsonData['namaPeternak'] != null ? jsonData['namaPeternak'] : "",
      jumlah: jsonData['jumlah'] != null ? jsonData['jumlah'] : "",
      kategori: jsonData['kategori'] != null ? jsonData['kategori'] : "",
      lokasi: jsonData['lokasi'] != null ? jsonData['lokasi'] : "",
      spesies: jsonData['spesies'] != null ? jsonData['spesies'] : "",
      umurKebuntingan: jsonData['umurKebuntingan'] != null ? jsonData['umurKebuntingan'] : "",
      pemeriksaKebuntingan: jsonData['pemeriksaKebuntingan'] != null ? jsonData['pemeriksaKebuntingan'] : "",
      tanggalPkb: jsonData['tanggalPkb'] != null ? jsonData['tanggalPkb'] : "",
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
