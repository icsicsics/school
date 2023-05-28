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
}
