class Points {
  String? creationDate;
  String? createdBy;
  bool? isTeacher;
  String? principleName;
  String? valueId;
  String? valueName;
  String? createdByName;

  Points({
    this.creationDate,
    this.createdBy,
    this.isTeacher,
    this.valueName,
    this.valueId,
    this.principleName,
    this.createdByName,
  });

  Points.fromJson(dynamic json) {
    creationDate = json['creationDate'];
    createdBy = json['createdBy'];
    isTeacher = json['isTeacher'];
    valueId = json['valueId'];
    valueName = json['valueName'];
    principleName = json['principleName'];
    createdByName = json['createdByName'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['creationDate'] = creationDate;
    map['createdBy'] = createdBy;
    map['isTeacher'] = isTeacher;
    map['valueId'] = valueId;
    map['valueName'] = valueName;
    map['principleName'] = principleName;
    map['createdByName'] = createdByName;
    return map;
  }
}
