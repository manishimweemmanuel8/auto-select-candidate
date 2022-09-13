class Select {
  String? id;
  bool? interviewStatus;
  bool? pass;
  String? scholorshipId;
  String? candidateId;
  String? userId;
  String? emailMessage;
  String? createdDate;
  String? updatedAt;

  Select(
      {this.id,
      this.interviewStatus,
      this.pass,
      this.scholorshipId,
      this.candidateId,
      this.userId,
      this.emailMessage,
      this.createdDate,
      this.updatedAt});

  Select.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    interviewStatus = json['interview_status'];
    pass = json['pass'];
    scholorshipId = json['scholorship_id'];
    candidateId = json['candidate_id'];
    emailMessage = json['emailMessage'];
    userId = json['user_id'];
    createdDate = json['createdDate'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['interview_status'] = this.interviewStatus;
    data['pass'] = this.pass;
    data['scholorship_id'] = this.scholorshipId;
    data['candidate_id'] = this.candidateId;
    data['emailMessage'] = this.emailMessage;
    data['user_id'] = this.userId;
    data['createdDate'] = this.createdDate;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
