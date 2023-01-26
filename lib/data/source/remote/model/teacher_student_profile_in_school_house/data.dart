import 'points.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/get_lmage.dart';

class Data {
  String? studentId;
  String? studentName;
  GetImage? getImage;
  List<Points>? points;

  Data({
    this.studentId,
    this.studentName,
    this.getImage,
    this.points,
  });

  Data.fromJson(dynamic json) {
    studentId = json['studentId'];
    studentName = json['studentName'];
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
    if (getImage != null) {
      map['getImage'] = getImage!.toJson();
    }
    if (points != null) {
      map['points'] = points!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
