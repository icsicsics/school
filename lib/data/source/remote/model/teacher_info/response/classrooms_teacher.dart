import 'dart:convert';

import 'package:schools/data/source/remote/model/teacher_home/response/get_logo.dart';

class ClassroomsTeacher {
  String? classroomToSectionId;
  String? classroomName;
  String? sectionName;
  GetLogo? getLogo;


  ClassroomsTeacher({
    this.classroomToSectionId,
    this.classroomName,
    this.sectionName,
    this.getLogo,
  });

  ClassroomsTeacher.fromJson(dynamic json) {
    classroomToSectionId = json['classroomToSectionId'];
    classroomName = json['classroomName'];
    sectionName = json['sectionName'];
    getLogo = json['getLogo'] != null ? GetLogo.fromJson(json['getLogo']) : null;

  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['classroomToSectionId'] = classroomToSectionId;
    map['classroomName'] = classroomName;
    map['sectionName'] = sectionName;
    if (getLogo != null) {
      map['getLogo'] = getLogo!.toJson();
    }
    return map;
  }

  String toJsonString() {
    Map<String, dynamic> data = toJson();
    return json.encode(data);
  }

  static ClassroomsTeacher fromJsonString(String jsonString) {
    Map<String, dynamic> data = json.decode(jsonString);
    return ClassroomsTeacher.fromJson(data);
  }

}
