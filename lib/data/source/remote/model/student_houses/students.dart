import 'package:schools/data/source/remote/model/student_houses/get_lmage.dart';

class Students {
  String? studentId;
  String? classroomToSectionId;
  String? studentName;
  GetImage? getImage;

  Students({
    this.studentId,
    this.classroomToSectionId,
    this.studentName,
    this.getImage,
  });

  Students.fromJson(dynamic json) {
    studentId = json['studentId'];
    classroomToSectionId = json['classroomToSectionId'];
    studentName = json['studentName'];
    getImage =
        json['data'] != null ? GetImage.fromJson(json['getImage']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['studentId'] = studentId;
    map['classroomToSectionId'] = classroomToSectionId;
    map['studentName'] = studentName;
    if (getImage != null) {
      map['getImage'] = getImage!.toJson();
    }
    return map;
  }
}
