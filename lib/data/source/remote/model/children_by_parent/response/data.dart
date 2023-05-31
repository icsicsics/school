import 'getImage.dart';

class Data {
  String? branchName;
  String? branchId;
  String? classroomSectionStudentsId;
  String? classroomToSectionId;
  String? studentName;
  String? studentId;
  String? classroomId;
  GetImage? getImage;

  Data({
    this.branchName,
    this.branchId,
    this.classroomSectionStudentsId,
    this.classroomToSectionId,
    this.studentName,
    this.studentId,
    this.classroomId,
    this.getImage,
  });

  Data.fromJson(dynamic json) {
    branchName = json['branchName'];
    branchId = json['branchId'];
    classroomSectionStudentsId = json['classroomSectionStudentsId'];
    classroomToSectionId = json['classroomToSectionId'];
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
    map['classroomSectionStudentsId'] = classroomSectionStudentsId;
    map['classroomToSectionId'] = classroomToSectionId;
    map['studentName'] = studentName;
    map['studentId'] = studentId;
    map['classroomId'] = classroomId;
    if (getImage != null) {
      map['getImage'] = getImage!.toJson();
    }
    return map;
  }
}
