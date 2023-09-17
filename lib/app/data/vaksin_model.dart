class VaksinModel {
  final int? status;
  final String? idVaksin;
  final String? tanggalIB;
  final String? lokasi;
  final String? namaPeternak;
  final String? idPeternak;
  final String? idHewan;
  final String? eartag;
  final String? ib1;
  final String? ib2;
  final String? ib3;
  final String? ibLain;
  final String? idPejantan;
  final String? idPembuatan;
  final String? bangsaPejantan;
  final String? produsen;
  final String? inseminator;

  VaksinModel({
    this.status,
    this.idVaksin,
    this.tanggalIB,
    this.lokasi,
    this.namaPeternak,
    this.idPeternak,
    this.idHewan,
    this.eartag,
    this.ib1,
    this.ib2,
    this.ib3,
    this.ibLain,
    this.idPejantan,
    this.idPembuatan,
    this.bangsaPejantan,
    this.produsen,
    this.inseminator,
  });

  factory VaksinModel.fromJson(Map<String, dynamic> jsonData) {
    return VaksinModel(
      status: jsonData['status'] != null ? jsonData['status'] : 0,
      idVaksin: jsonData['idVaksin'] != null ? jsonData['idVaksin'] : "",
      tanggalIB: jsonData['tanggalIB'] != null ? jsonData['tanggalIB'] : "",
      lokasi: jsonData['lokasi'] != null ? jsonData['lokasi'] : "",
      namaPeternak:
          jsonData['namaPeternak'] != null ? jsonData['namaPeternak'] : "",
      idPeternak: jsonData['idPeternak'] != null ? jsonData['idPeternak'] : "",
      idHewan: jsonData['idHewan'] != null ? jsonData['idHewan'] : "",
      eartag: jsonData['eartag'] != null ? jsonData['eartag'] : "",
      ib1: jsonData['ib1'] != null ? jsonData['ib1'] : "",
      ib2: jsonData['ib2'] != null ? jsonData['ib2'] : "",
      ib3: jsonData['ib3'] != null ? jsonData['ib3'] : "",
      ibLain: jsonData['ibLain'] != null ? jsonData['ibLain'] : "",
      idPejantan: jsonData['idPejantan'] != null ? jsonData['idPejantan'] : "",
      idPembuatan:
          jsonData['idPembuatan'] != null ? jsonData['idPembuatan'] : "",
      bangsaPejantan:
          jsonData['bangsaPejantan'] != null ? jsonData['bangsaPejantan'] : "",
      produsen: jsonData['produsen'] != null ? jsonData['produsen'] : "",
      inseminator:
          jsonData['inseminator'] != null ? jsonData['inseminator'] : "",
    );
  }
}

class VaksinListModel {
  final int? status; // 200 - 204 - 400 - 404
  final List<VaksinModel>? content;
  final int? page;
  final int? size;
  final int? totalElements;
  final int? totalPages;
  VaksinListModel(
      {this.status,
      this.content,
      this.page,
      this.size,
      this.totalElements,
      this.totalPages});
  factory VaksinListModel.fromJson(Map<String, dynamic> jsonData) {
    return VaksinListModel(
        status: jsonData['status'],
        content: jsonData['content']
            .map<VaksinModel>((data) => VaksinModel.fromJson(data))
            .toList(),
        page: jsonData['page'],
        size: jsonData['size'],
        totalElements: jsonData['totalElements'],
        totalPages: jsonData['totalPages']);
  }
}
