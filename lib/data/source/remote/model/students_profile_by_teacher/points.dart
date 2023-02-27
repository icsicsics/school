class Points {
  String? creationDate;
  String? createdBy;
  String? valueName;
  bool? isTeacher;
  String? principleName;

  Points({
    this.creationDate,
    this.createdBy,
    this.isTeacher,
    this.principleName,
  });

  Points.fromJson(dynamic json) {
    creationDate = json['creationDate'];
    createdBy = json['createdBy'];
    isTeacher = json['isTeacher'];
    valueName = json['valueName'];
    principleName = json['principleName'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['creationDate'] = creationDate;
    map['createdBy'] = createdBy;
    map['isTeacher'] = isTeacher;
    map['valueName'] = valueName;
    map['principleName'] = principleName;
    return map;
  }
}
