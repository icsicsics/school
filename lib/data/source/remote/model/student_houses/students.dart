import 'get_image.dart';

class Students {
  String ?studentId;
  String ?classroomToSectionId;
  String? classroomId;
  String? studentName;
  String? houseName;
  GetImage? getImage;
  Students({
      this.studentId, 
      this.classroomToSectionId, 
      this.classroomId, 
      this.studentName, 
      this.houseName, 
      this.getImage,});

  Students.fromJson(dynamic json) {
    studentId = json['studentId'];
    classroomToSectionId = json['classroomToSectionId'];
    classroomId = json['classroomId'];
    studentName = json['studentName'];
    houseName = json['houseName'];
    getImage = json['getImage'] != null ? GetImage.fromJson(json['getImage']) : null;
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['studentId'] = studentId;
    map['classroomToSectionId'] = classroomToSectionId;
    map['classroomId'] = classroomId;
    map['studentName'] = studentName;
    map['houseName'] = houseName;
    if (getImage != null) {
      map['getImage'] = getImage!.toJson();
    }
    return map;
  }

}