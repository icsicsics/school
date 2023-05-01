class Points {
  String? creationDate;
  String? createdBy;
  bool? isTeacher;
  String? principleIcon;
  String? valueId;
  String? valueName;
  String? createdByName;

  Points({
    this.creationDate,
    this.createdBy,
    this.isTeacher,
    this.valueName,
    this.valueId,
    this.principleIcon,
    this.createdByName,q
  });

  Points.fromJson(dynamic json) {
    creationDate = json['creationDate'];
    createdBy = json['createdBy'];
    isTeacher = json['isTeacher'];
    valueId = json['valueId'];
    valueName = json['valueName'];
    principleIcon = json['principleIcon'];
    createdByName = json['createdByName'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['creationDate'] = creationDate;
    map['createdBy'] = createdBy;
    map['isTeacher'] = isTeacher;
    map['valueId'] = valueId;
    map['valueName'] = valueName;
    map['principleIcon'] = principleIcon;
    map['createdByName'] = createdByName;
    return map;
  }
}
