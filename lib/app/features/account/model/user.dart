class User {
  String? id;
  String? username;
  String? email;
  String? password;
  bool? isActive;
  String? createdAt;
  String? updateAt;
  Null? deleteAt;
  String? role;
  String? accessToken;

  User({
    this.id,
    this.username,
    this.email,
    this.password,
    this.isActive,
    this.createdAt,
    this.updateAt,
    this.deleteAt,
    this.role,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updateAt = json['updateAt'];
    deleteAt = json['deleteAt'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id.toString();
    data['username'] = this.username.toString();
    data['email'] = this.email.toString();
    data['password'] = this.password.toString();
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updateAt'] = this.updateAt;
    data['deleteAt'] = this.deleteAt;
    data['role'] = this.role.toString();
    return data;
  }
}
