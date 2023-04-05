import 'get_image.dart';

class Students {
  String? studentId;
  String? classroomToSectionId;
  String? classroomToSectionStudentId;
  String? classroomId;
  String? studentName;
  String? houseName;
  String? houseIcon;
  GetImage? getImage;

  Students({
    this.studentId,
    this.classroomToSectionId,
    this.classroomId,
    this.studentName,
    this.houseName,
    this.classroomToSectionStudentId,
    this.houseIcon,
    this.getImage,
  });

  Students.fromJson(dynamic json) {
    studentId = json['studentId'];
    classroomToSectionId = json['classroomToSectionId'];
    classroomToSectionStudentId = json['classroomToSectionStudentId'];
    classroomId = json['classroomId'];
    studentName = json['studentName'];
    houseName = json['houseName'];
    houseIcon = json['houseIcon'];
    getImage =
        json['getImage'] != null ? GetImage.fromJson(json['getImage']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['studentId'] = studentId;
    map['classroomToSectionId'] = classroomToSectionId;
    map['classroomToSectionStudentId'] = classroomToSectionStudentId;
    map['classroomId'] = classroomId;
    map['studentName'] = studentName;
    map['houseName'] = houseName;
    map['houseIcon'] = houseIcon;
    if (getImage != null) {
      map['getImage'] = getImage!.toJson();
    }
    return map;
  }
}
