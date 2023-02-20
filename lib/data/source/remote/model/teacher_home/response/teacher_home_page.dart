import 'get_logo.dart';

class TeacherHomePage {
  String ?id;
  String ?classroomToSectionId;
  String ?classroomName;
  String ?sectionName;
  GetLogo? getLogo;
  TeacherHomePage({
      this.id, 
      this.classroomToSectionId, 
      this.classroomName, 
      this.sectionName, 
      this.getLogo,});

  TeacherHomePage.fromJson(dynamic json) {
    id = json['id'];
    classroomToSectionId = json['classroomToSectionId'];
    classroomName = json['classroomName'];
    sectionName = json['sectionName'];
    getLogo = json['getLogo'] != null ? GetLogo.fromJson(json['getLogo']) : null;
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['classroomToSectionId'] = classroomToSectionId;
    map['classroomName'] = classroomName;
    map['sectionName'] = sectionName;
    if (getLogo != null) {
      map['getLogo'] = getLogo!.toJson();
    }
    return map;
  }

}