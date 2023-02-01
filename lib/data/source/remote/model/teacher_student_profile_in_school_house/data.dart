import 'points.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/get_lmage.dart';

class Data {
  String? studentId;
  String? studentName;
  int? allPointsCount;
  int? thisWeekPointsCount;
  GetImage? getImage;
  List<Points>? points;

  Data({
    this.studentId,
    this.studentName,
    this.getImage,
    this.points,
    this.allPointsCount,
    this.thisWeekPointsCount,
  });

  Data.fromJson(dynamic json) {
    studentId = json['studentId'];
    studentName = json['studentName'];
    allPointsCount = json['allPointsCount'];
    thisWeekPointsCount = json['thisWeekPointsCount'];
    getImage =
        json['data'] != null ? GetImage.fromJson(json['getImage']) : null;

    if (json['points'] != null) {
      points = [];
      json['points'].forEach((v) {
        points!.add(Points.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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
    return map;
  }
}
