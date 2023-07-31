import 'dart:convert';

class Points {
  String? creationDate;
  String? createdBy;
  bool? isTeacher;
  String? principleIcon;
  String? valueId;
  String? valueName;
  String? createdByName;
  String? description;

  Points({
    this.creationDate,
    this.createdBy,
    this.isTeacher,
    this.valueName,
    this.valueId,
    this.principleIcon,
    this.createdByName,
    this.description,
  });

  Points.fromJson(dynamic json) {
    creationDate = json['creationDate'];
    createdBy = json['createdBy'];
    isTeacher = json['isTeacher'];
    valueId = json['valueId'];
    valueName = json['valueName'];
    description = json['description'];
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
    map['description'] = description;
    map['principleIcon'] = principleIcon;
    map['createdByName'] = createdByName;
    return map;
  }

  String toJsonString() {
    Map<String, dynamic> data = toJson();
    return json.encode(data);
  }

  static Points fromJsonString(String jsonString) {
    Map<String, dynamic> data = json.decode(jsonString);
    return Points.fromJson(data);
  }
}
