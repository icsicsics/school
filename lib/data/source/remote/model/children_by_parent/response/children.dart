import 'dart:convert';

import 'getImage.dart';

class Children {
  String? branchName;
  String? branchId;
  String? classroomSectionStudentsId;
  String? classroomToSectionId;
  String? studentName;
  String? studentId;
  String? classroomId;
  GetImage? getImage;
  String? facebookURL;
  String? instagramURL;
  String? tweeterURL;
  String? snapchatURL;
  String? websiteURL;

  Children({
    this.branchName,
    this.branchId,
    this.classroomSectionStudentsId,
    this.classroomToSectionId,
    this.studentName,
    this.studentId,
    this.classroomId,
    this.getImage,
    this.facebookURL,
    this.instagramURL,
    this.tweeterURL,
    this.snapchatURL,
    this.websiteURL,
  });

  Children.fromJson(dynamic json) {
    branchName = json['branchName'];
    branchId = json['branchId'];
    classroomSectionStudentsId = json['classroomSectionStudentsId'];
    classroomToSectionId = json['classroomToSectionId'];
    studentName = json['studentName'];
    facebookURL = json['facebookURL'];
    instagramURL = json['instagramURL'];
    tweeterURL = json['tweeterURL'];
    snapchatURL = json['snapchatURL'];
    websiteURL = json['websiteURL'];
    studentId = json['studentId'];
    classroomId = json['classroomId'];
    getImage =
        json['getImage'] != null ? GetImage.fromJson(json['getImage']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['branchName'] = branchName;
    map['branchId'] = branchId;
    map['classroomSectionStudentsId'] = classroomSectionStudentsId;
    map['classroomToSectionId'] = classroomToSectionId;
    map['studentName'] = studentName;
    map['facebookURL'] = facebookURL;
    map['instagramURL'] = instagramURL;
    map['tweeterURL'] = tweeterURL;
    map['snapchatURL'] = snapchatURL;
    map['websiteURL'] = websiteURL;
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

  static Children fromJsonString(String jsonString) {
    Map<String, dynamic> data = json.decode(jsonString);
    return Children.fromJson(data);
  }
}
