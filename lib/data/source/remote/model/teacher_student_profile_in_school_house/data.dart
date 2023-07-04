import 'package:schools/data/source/remote/model/teacher_home/response/get_logo.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/advisor.dart';

import 'get_image.dart';
import 'points.dart';

class Data {
  String? sectionName;
  String? classroomName;
  String? schoolName;
  String? houseName;
  String? studentId;
  String? studentName;
  int? allPointsCount;
  int? thisWeekPointsCount;
  GetImage? getImage;
  GetLogo? getLogo;
  List<Points>? points;
  List<Advisor>? advisors;

  Data({
    this.sectionName,
    this.classroomName,
    this.schoolName,
    this.houseName,
    this.studentId,
    this.studentName,
    this.allPointsCount,
    this.thisWeekPointsCount,
    this.getImage,
    this.getLogo,
    this.points,
    this.advisors,
  });

  Data.fromJson(dynamic json) {
    sectionName = json['sectionName'];
    classroomName = json['classroomName'];
    schoolName = json['schoolName'];
    houseName = json['houseName'];
    getLogo = json['getLogo'] != null ? GetLogo.fromJson(json['getLogo']) : null;
    studentId = json['studentId'];
    studentName = json['studentName'];
    allPointsCount = json['allPointsCount'];
    thisWeekPointsCount = json['thisWeekPointsCount'];
    getImage =
    json['getImage'] != null ? GetImage.fromJson(json['getImage']) : null;
    if (json['points'] != null) {
      points = [];
      json['points'].forEach((v) {
        points!.add(Points.fromJson(v));
      });
    }
    if (json['studentGuideList'] != null) {
      advisors = [];
      json['studentGuideList'].forEach((v) {
        advisors!.add(Advisor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sectionName'] = sectionName;
    map['classroomName'] = classroomName;
    map['schoolName'] = schoolName;
    map['houseName'] = houseName;
    if (getLogo != null) {
      map['getLogo'] = getLogo!.toJson();
    }
    map['studentId'] = studentId;
    map['studentName'] = studentName;
    map['allPointsCount'] = allPointsCount;
    map['thisWeekPointsCount'] = thisWeekPointsCount;
    if (getImage != null) {
      map['getImage'] = getImage!.toJson();
    }
    if (points != null) {
      map['points'] = points!.map((v) => v.toJson()).toList();
    }
    if (advisors != null) {
      map['advisors'] = advisors!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
