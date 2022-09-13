class Candidate {
  String? id;
  String? names;
  String? email;
  int? marks;
  bool? status;
  String? combinationId;
  String? programId;
  String? createdDate;
  String? updatedAt;

  Candidate(
      {this.id,
      this.names,
      this.email,
      this.marks,
      this.status,
      this.combinationId,
      this.programId,
      this.createdDate,
      this.updatedAt});

  Candidate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    names = json['names'];
    email = json['email'];
    marks = json['marks'];
    status = json['status'];
    combinationId = json['combination_id'];
    programId = json['program_id'];
    createdDate = json['createdDate'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['names'] = this.names;
    data['email'] = this.email;
    data['marks'] = this.marks;
    data['status'] = this.status;
    data['combination_id'] = this.combinationId;
    data['program_id'] = this.programId;
    data['createdDate'] = this.createdDate;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}