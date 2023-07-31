import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/advisor.dart';

import 'students.dart';

class StudentHouses {
  String? houseName;
  String? houseIcon;
  String? sectionName;
  int? numberofStudentsHouse;
  String? classroomId;
  List<Students>? students;
  List<Advisor>? advisors;

  StudentHouses({
    this.houseName,
    this.sectionName,
    this.numberofStudentsHouse,
    this.classroomId,
    this.students,
    this.advisors,
  });

  StudentHouses.fromJson(dynamic json) {
    houseName = json['houseName'];
    houseIcon = json['houseIcon'];
    sectionName = json['sectionName'];
    numberofStudentsHouse = json['numberofStudentsHouse'];
    classroomId = json['classroomId'];
    if (json['students'] != null) {
      students = [];
      json['students'].forEach((v) {
        students!.add(Students.fromJson(v));
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
    map['houseName'] = houseName;
    map['houseIcon'] = houseIcon;
    map['sectionName'] = sectionName;
    map['numberofStudentsHouse'] = numberofStudentsHouse;
    map['classroomId'] = classroomId;
    if (students != null) {
      map['students'] = students!.map((v) => v.toJson()).toList();
    }
    if (advisors != null) {
      map['studentGuideList'] = advisors!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
