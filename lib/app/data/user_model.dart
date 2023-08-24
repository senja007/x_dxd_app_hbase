class UserModel {
  final int? status;
  final int? id;
  final String? username;
  final String? name;
  final String? email;
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
    this.email,
    this.role,
    this.description,
    this.avatar,
    this.accessToken,
    this.tokenType,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      status: jsonData['status'],
      id: jsonData['userSummary']['id'],
      username: jsonData['userSummary']['username'],
      name: jsonData['userSummary']['name'],
      role: jsonData['userSummary']['role'],
      email: jsonData['userSummary']['email'],
      description: jsonData['userSummary']['description'],
      avatar: jsonData['userSummary']['avatar'],
      accessToken: jsonData['accessToken'],
      tokenType: jsonData['tokenType'],
    );
  }
}
