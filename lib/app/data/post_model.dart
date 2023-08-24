class PostModel {
  final int? id;
  final String? namaPetugas;
  final String? nikPetugas;
  final String? noTelp;
  final String? email;
  final int? status;

  PostModel({
    this.status,
    this.id,
    this.namaPetugas,
    this.nikPetugas,
    this.noTelp,
    this.email,
  });

  factory PostModel.fromJson(Map<String, dynamic> jsonData) {
    return PostModel(
      status: jsonData['status'] != null ? jsonData['status'] : 0,
      id: jsonData['id'] != null ? jsonData['id'] : 0,
      namaPetugas:
          jsonData['namaPetugas'] != null ? jsonData['namaPetugas'] : "",
      nikPetugas: jsonData['nikPetugas'] != null ? jsonData['nikPetugas'] : "",
      noTelp: jsonData['noTelp'] != null ? jsonData['noTelp'] : "",
      email: jsonData['email'] != null ? jsonData['email'] : "",
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
