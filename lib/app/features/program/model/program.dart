import 'package:auto_select_candidate/app/features/account/model/user.dart';

class Program {
  String? id;
  String? name;
  String? country;
  String? description;
  String? createdDate;
  String? updatedAt;
  User? user;

  Program(
      {this.id,
      this.name,
      this.country,
      this.description,
      this.createdDate,
      this.updatedAt,
      this.user});

  Program.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    description = json['description'];
    createdDate = json['createdDate'];
    updatedAt = json['updatedAt'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country'] = this.country;
    data['description'] = this.description;
    data['createdDate'] = this.createdDate;
    data['updatedAt'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}