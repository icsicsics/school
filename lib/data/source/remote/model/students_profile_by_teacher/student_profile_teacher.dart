import 'points.dart';

class StudentProfileTeacher {
  String? studentId;
  String? studentName;
  dynamic? getImage;
  List<Points>? points;

  StudentProfileTeacher({
    this.studentId,
    this.studentName,
    this.getImage,
    this.points,
  });

  StudentProfileTeacher.fromJson(dynamic json) {
    studentId = json['studentId'];
    studentName = json['studentName'];
    getImage = json['getImage'];
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
    map['getImage'] = getImage;
    if (points != null) {
      map['points'] = points!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
