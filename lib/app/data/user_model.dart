class UserModel {
  final int? status;
  final int? id;
  final String? username;
  final String? name;
  final String? role;
  final String? description;
  final String? avatar;
  final String? accessToken;
  final String? tokenType;

  UserModel({
    this.status,
    this.id,
    this.username,
    this.name,
    this.role,
    this.description,
    this.avatar,
    this.accessToken,
    this.tokenType,
  });
  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      status: jsonData['status'],
      id: jsonData['id'],
      username: jsonData['username'],
      name: jsonData['name'],
      role: jsonData['role'],
      description: jsonData['description'],
      avatar: jsonData['avatar'],
      accessToken: jsonData['accessToken'],
      tokenType: jsonData['tokenType'],
    );
  }
}
