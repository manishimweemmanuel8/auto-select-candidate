import 'package:auto_select_candidate/app/features/account/model/user.dart';

class Combination {
  String? id;
  String? name;
  String? abbreviation;
  String? description;
  String? createdDate;
  String? updatedAt;
  User? user;

  Combination(
      {this.id,
      this.name,
      this.abbreviation,
      this.description,
      this.createdDate,
      this.updatedAt,
      this.user});

  Combination.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    abbreviation = json['abbreviation'];
    description = json['description'];
    createdDate = json['createdDate'];
    updatedAt = json['updatedAt'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['abbreviation'] = this.abbreviation;
    data['description'] = this.description;
    data['createdDate'] = this.createdDate;
    data['updatedAt'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}