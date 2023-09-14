class PengobatanModel {
  final int? status;
  final int? id;
  final String? idKasus;
  final String? namaInfrastruktur;
  final String? dosis;
  final String? sindrom;
  final String? dignosaBanding;
  final String? lokasi;
  final String? namaPetugas;
  final String? tanggalKasus;
  final String? tanggalPengobatan;


  PengobatanModel({
    this.status,
    this.id,
    this.idKasus,
    this.namaInfrastruktur,
    this.dosis,
    this.sindrom,
    this.dignosaBanding,
    this.lokasi,
    this.namaPetugas,
    this.tanggalKasus,
    this.tanggalPengobatan,
  });

  factory PengobatanModel.fromJson(Map<String, dynamic> jsonData) {
    return PengobatanModel(
      status: jsonData['status'] != null ? jsonData['status'] : 0,
      id: jsonData['id'] != null ? jsonData['id'] : 0,
      idKasus: jsonData['idKasus'] != null ? jsonData['idKasus'] : "",
      namaInfrastruktur: jsonData['namaInfrastruktur'] != null ? jsonData['namaInfrastruktur'] : "",
      dosis: jsonData['dosis'] != null ? jsonData['dosis'] : "",
      sindrom: jsonData['sindrom'] != null ? jsonData['sindrom'] : "",
      dignosaBanding: jsonData['dignosaBanding'] != null ? jsonData['dignosaBanding'] : "",
      lokasi: jsonData['lokasi'] != null ? jsonData['lokasi'] : "",
      namaPetugas: jsonData['namaPetugas'] != null ? jsonData['namaPetugas'] : "",
      tanggalKasus: jsonData['tanggalKasus'] != null ? jsonData['tanggalKasus'] : "",
      tanggalPengobatan: jsonData['tanggalPengobatan'] != null ? jsonData['tanggalPengobatan'] : "",
    );
  }
}

class PengobatanListModel {
  final int? status; // 200 - 204 - 400 - 404
  final List<PengobatanModel>? content;
  final int? page;
  final int? size;
  final int? totalElements;
  final int? totalPages;
  PengobatanListModel(
      {this.status,
      this.content,
      this.page,
      this.size,
      this.totalElements,
      this.totalPages});
  factory PengobatanListModel.fromJson(Map<String, dynamic> jsonData) {
    return PengobatanListModel(
        status: jsonData['status'],
        content: jsonData['content']
            .map<PengobatanModel>((data) => PengobatanModel.fromJson(data))
            .toList(),
        page: jsonData['page'],
        size: jsonData['size'],
        totalElements: jsonData['totalElements'],
        totalPages: jsonData['totalPages']);
  }
}
