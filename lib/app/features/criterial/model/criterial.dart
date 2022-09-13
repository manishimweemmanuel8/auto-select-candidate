class Criterial {
  String? id;
  int? marksFrom;
  int? marksTo;
  String? scholorshipId;
  String? programId;
  String? combinationId;
  String? createdDate;
  String? updatedAt;

  Criterial(
      {this.id,
      this.marksFrom,
      this.marksTo,
      this.scholorshipId,
      this.programId,
      this.combinationId,
      this.createdDate,
      this.updatedAt});

  Criterial.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    marksFrom = json['marks_from'];
    marksTo = json['marks_to'];
    scholorshipId = json['scholorship_id'];
    programId = json['program_id'];
    combinationId = json['combination_id'];
    createdDate = json['createdDate'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['marks_from'] = this.marksFrom;
    data['marks_to'] = this.marksTo;
    data['scholorship_id'] = this.scholorshipId;
    data['program_id'] = this.programId;
    data['combination_id'] = this.combinationId;
    data['createdDate'] = this.createdDate;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}