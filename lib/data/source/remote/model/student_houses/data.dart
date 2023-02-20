import 'students.dart';

class Data {
  String? houseName;
  String? sectionName;
  int? numberofStudentsHouse;
  String? classroomId;
  List<Students>? students;
  Data({
      this.houseName, 
      this.sectionName, 
      this.numberofStudentsHouse, 
      this.classroomId, 
      this.students,});

  Data.fromJson(dynamic json) {
    houseName = json['houseName'];
    sectionName = json['sectionName'];
    numberofStudentsHouse = json['numberofStudentsHouse'];
    classroomId = json['classroomId'];
    if (json['students'] != null) {
      students = [];
      json['students'].forEach((v) {
        students!.add(Students.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['houseName'] = houseName;
    map['sectionName'] = sectionName;
    map['numberofStudentsHouse'] = numberofStudentsHouse;
    map['classroomId'] = classroomId;
    if (students != null) {
      map['students'] = students!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}