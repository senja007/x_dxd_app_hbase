class PostModel {
  final int? id;
  final String? idKasus;
  final String? tanggalPengobatan;
  final String? tanggalKasus;
  final String? namaPetugas;
  final String? namaInfrastruktur;
  final String? lokasi;
  final String? dosis;
  final String? sindrom;
  final String? dignosaBanding;

  final int? status;

  PostModel({
    this.status,
    this.id,
    this.idKasus,
    this.tanggalPengobatan,
    this.tanggalKasus,
    this.namaPetugas,
    this.namaInfrastruktur,
    this.dignosaBanding,
    this.dosis,
    this.lokasi,
    this.sindrom,
  });

  factory PostModel.fromJson(Map<String, dynamic> jsonData) {
    return PostModel(
      status: jsonData['status'] != null ? jsonData['status'] : 0,
      id: jsonData['id'] != null ? jsonData['id'] : 0,
      idKasus: jsonData['idKasus'] != null ? jsonData['idKasus'] : "",
      tanggalPengobatan: jsonData['tanggalPengobatan'] != null
          ? jsonData['tanggalPengobatan']
          : "",
      tanggalKasus:
          jsonData['tanggalKasus'] != null ? jsonData['tanggalKasus'] : "",
      namaPetugas:
          jsonData['namaPetugas'] != null ? jsonData['namaPetugas'] : "",
      namaInfrastruktur: jsonData['namaInfrastruktur'] != null
          ? jsonData['namaInfrastruktur']
          : "",
      lokasi: jsonData['lokasi'] != null ? jsonData['lokasi'] : "",
    );
  }
}

class PostListModel {
  final int? status; // 200 - 204 - 400 - 404
  final List<PostModel>? content;
  final int? page;
  final int? size;
  final int? totalElements;
  final int? totalPages;
  PostListModel(
      {this.status,
      this.content,
      this.page,
      this.size,
      this.totalElements,
      this.totalPages});
  factory PostListModel.fromJson(Map<String, dynamic> jsonData) {
    return PostListModel(
        status: jsonData['status'],
        content: jsonData['content']
            .map<PostModel>((data) => PostModel.fromJson(data))
            .toList(),
        page: jsonData['page'],
        size: jsonData['size'],
        totalElements: jsonData['totalElements'],
        totalPages: jsonData['totalPages']);
  }
}
