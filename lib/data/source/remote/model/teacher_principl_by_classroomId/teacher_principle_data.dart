import 'dart:convert';

class TeacherPrincipleData {
  String? id;
  String? principleId;
  String? name;
  String? icon;

  TeacherPrincipleData({
    this.id,
    this.principleId,
    this.name,
    this.icon,
  });

  TeacherPrincipleData.fromJson(dynamic json) {
    id = json['id'];
    principleId = json['principleId'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['principleId'] = principleId;
    map['name'] = name;
    map['icon'] = icon;
    return map;
  }

  String toJsonString() {
    Map<String, dynamic> data = toJson();
    return json.encode(data);
  }

  static TeacherPrincipleData fromJsonString(String jsonString) {
    Map<String, dynamic> data = json.decode(jsonString);
    return TeacherPrincipleData.fromJson(data);
  }
}
