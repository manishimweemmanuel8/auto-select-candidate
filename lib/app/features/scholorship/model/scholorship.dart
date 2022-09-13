import 'package:auto_select_candidate/app/features/account/model/user.dart';

class Scholorship {
  String? id;
  String? names;
  String? description;
  bool? status;
  String? createdDate;
  String? updatedAt;
  User? user;

  Scholorship(
      {this.id,
      this.names,
      this.description,
      this.status,
      this.createdDate,
      this.updatedAt,
      this.user});

  Scholorship.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    names = json['names'];
    description = json['description'];
    status = json['status'];
    createdDate = json['createdDate'];
    updatedAt = json['updatedAt'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['names'] = this.names;
    data['description'] = this.description;
    data['status'] = this.status;
    data['createdDate'] = this.createdDate;
    data['updatedAt'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}
