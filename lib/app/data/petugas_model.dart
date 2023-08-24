class PetugasModel {
  final int? id;
  final String? content;
  final int? page;
  final int? size;
  final int? totalElements;
  final int? totalPages;
  final bool? last;
  final int? statusCode;
  final int? status;

  PetugasModel({
    this.status,
    this.id,
    this.content,
    this.page,
    this.size,
    this.totalElements,
    this.totalPages,
    this.last,
    this.statusCode,
  });

  factory PetugasModel.fromJson(Map<String, dynamic> jsonData) {
    return PetugasModel(
      status: jsonData['status'],
      content: jsonData['content'],
      id: jsonData['id'],
      page: jsonData['page'],
      size: jsonData['size'],
      totalElements: jsonData['totalElements'],
      totalPages: jsonData['totalPages'],
      last: jsonData['last'],
      statusCode: jsonData['statusCode'],
    );
  }
}
