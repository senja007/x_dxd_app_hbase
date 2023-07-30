import 'dart:convert';

class PostModel {
  final int? id;
  final String? title;
  final String? content;
  final String? slug;
  final int? status;

  PostModel({
    this.id,
    this.title,
    this.content,
    this.slug,
    this.status,
  });

  factory PostModel.fromJson(Map<String, dynamic> jsonData) {
    return PostModel(
      id: jsonData['id'],
      title: jsonData['title'],
      content: jsonData['content'],
      slug: jsonData['slug'],
      status: jsonData['status_code'],
    );
  }
}

class PostListModel {
  final int? status; // 200 - 204 - 400 - 404
  final List<PostModel>? items;
  PostListModel({this.status, this.items});
  factory PostListModel.fromJson(Map<String, dynamic> jsonData) {
    return PostListModel(
        status: jsonData['status'],
        items: jsonData['items']
            .map<PostModel>((data) => PostModel.fromJson(data))
            .toList());
  }
}
