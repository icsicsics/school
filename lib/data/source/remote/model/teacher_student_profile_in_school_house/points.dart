class Points {
  String? creationDate;
  String? createdBy;
  bool? isTeacher;
  String? principleName;
  String? createdByName;

  Points({
    this.creationDate,
    this.createdBy,
    this.isTeacher,
    this.principleName,
    this.createdByName,
  });

  Points.fromJson(dynamic json) {
    creationDate = json['creationDate'];
    createdBy = json['createdBy'];
    isTeacher = json['isTeacher'];
    principleName = json['principleName'];
    createdByName = json['createdByName'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['creationDate'] = creationDate;
    map['createdBy'] = createdBy;
    map['isTeacher'] = isTeacher;
    map['principleName'] = principleName;
    map['createdByName'] = createdByName;
    return map;
  }
}
