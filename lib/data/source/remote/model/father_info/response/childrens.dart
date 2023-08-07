import 'dart:convert';

import 'getImage.dart';

class Childrens {
  String? branchName;
  String? branchId;
  String? studentName;
  String? studentId;
  String? classroomId;
  GetImage? getImage;

  Childrens({
    this.branchName,
    this.branchId,
    this.studentName,
    this.studentId,
    this.getImage,
  });

  Childrens.fromJson(dynamic json) {
    branchName = json['branchName'];
    branchId = json['branchId'];
    studentName = json['studentName'];
    studentId = json['studentId'];
    classroomId = json['classroomId'];
    getImage =
        json['getImage'] != null ? GetImage.fromJson(json['getImage']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['branchName'] = branchName;
    map['branchId'] = branchId;
    map['studentName'] = studentName;
    map['studentId'] = studentId;
    map['classroomId'] = classroomId;
    if (getImage != null) {
      map['getImage'] = getImage!.toJson();
    }
    return map;
  }

  String toJsonString() {
    Map<String, dynamic> data = toJson();
    return json.encode(data);
  }

  static Childrens fromJsonString(String jsonString) {
    Map<String, dynamic> data = json.decode(jsonString);
    return Childrens.fromJson(data);
  }
}
